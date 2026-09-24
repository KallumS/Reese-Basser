#!/usr/bin/env python3
"""
jsfx2c - a small JSFX/EEL2 -> C transpiler used to test Reese Basser offline.

It parses a JSFX file (strictly enough to catch syntax errors), converts the
@init/@slider/@block/@sample/@gfx sections to C and emits one C file that is
compiled together with runtime.c.  The resulting binary can render audio from
a MIDI script and log @gfx drawing commands so the UI can be rendered to PNG.

It implements the subset of EEL2 that Reese Basser uses:
  expressions, ; sequences, ?: , loop(), while(), memory [], user functions
  with local()/instance()/globals(), this./namespaced calls, strings, and the
  common math / MIDI / slider / gfx / string built-ins.

Usage: jsfx2c.py input.jsfx output.c
"""
import re
import sys

# ----------------------------------------------------------------- tokenizer
TOKEN_RE = re.compile(r'''
   (?P<ws>\s+)
 | (?P<lcomment>//[^\n]*)
 | (?P<bcomment>/\*.*?\*/)
 | (?P<num>0x[0-9a-fA-F]+|\$x[0-9a-fA-F]+|\$'.'|\$pi|\$e|\$phi|(?:\d+\.?\d*|\.\d+)(?:[eE][+-]?\d+)?)
 | (?P<str>"(?:\\.|[^"\\])*")
 | (?P<ident>\#?[A-Za-z_][A-Za-z0-9_.]*|\#)
 | (?P<op>===|!==|<<|>>|==|!=|<=|>=|&&|\|\||\+=|-=|\*=|/=|%=|\^=|\|=|&=|~=|[-+*/%^|&~!<>=?:;,()\[\]])
''', re.S | re.X)


class Tok:
    def __init__(self, kind, val, line):
        self.kind, self.val, self.line = kind, val, line

    def __repr__(self):
        return f'{self.kind}:{self.val}@{self.line}'


def tokenize(src, line0):
    pos, line, out = 0, line0, []
    while pos < len(src):
        m = TOKEN_RE.match(src, pos)
        if not m:
            raise SyntaxError(f'line {line}: bad character {src[pos]!r}')
        kind = m.lastgroup
        val = m.group(kind)
        if kind not in ('ws', 'lcomment', 'bcomment'):
            out.append(Tok(kind, val, line))
        line += val.count('\n')
        pos = m.end()
    out.append(Tok('eof', None, line))
    return out


# ----------------------------------------------------------------- AST nodes
# ('num', value) ('str', text) ('var', name) ('seq', [nodes]) ('bin', op, a, b)
# ('un', op, a) ('assign', op, lhs, rhs) ('cond', c, a, b|None)
# ('mem', base, idx) ('call', name, [args], line) ('while', cond, body)
# ('nop',)

class Func:
    def __init__(self, name, params, locals_, instances, body, line):
        self.name, self.params, self.locals, self.instances = name, params, locals_, instances
        self.body, self.line = body, line


class Parser:
    ASSIGN_OPS = ('=', '+=', '-=', '*=', '/=', '%=', '^=', '|=', '&=', '~=')

    def __init__(self, toks, funcs):
        self.t, self.i, self.funcs = toks, 0, funcs

    def peek(self, k=0):
        return self.t[self.i + k]

    def next(self):
        tok = self.t[self.i]
        self.i += 1
        return tok

    def accept(self, val):
        if self.peek().kind == 'op' and self.peek().val == val:
            self.i += 1
            return True
        return False

    def expect(self, val):
        tok = self.next()
        if not (tok.kind == 'op' and tok.val == val):
            raise SyntaxError(f'line {tok.line}: expected {val!r}, got {tok.val!r}')
        return tok

    def err(self, msg):
        raise SyntaxError(f'line {self.peek().line}: {msg} (at {self.peek().val!r})')

    # seq := stmt (';' stmt?)*
    def parse_seq(self, stop=(')', ']', ',')):
        items = []
        while True:
            tok = self.peek()
            if tok.kind == 'eof' or (tok.kind == 'op' and tok.val in stop):
                break
            if tok.kind == 'op' and tok.val == ';':
                self.next()
                continue
            if tok.kind == 'ident' and tok.val.lower() == 'function':
                self.parse_function()
                continue
            items.append(self.parse_expr())
            tok = self.peek()
            if tok.kind == 'op' and tok.val == ';':
                self.next()
                continue
            if tok.kind == 'eof' or (tok.kind == 'op' and tok.val in stop):
                break
            self.err('expected ; or end of block')
        if not items:
            return ('nop',)
        if len(items) == 1:
            return items[0]
        return ('seq', items)

    def parse_function(self):
        line = self.next().line
        name = self.next()
        if name.kind != 'ident':
            self.err('function name expected')
        self.expect('(')
        params = []
        while not self.accept(')'):
            tok = self.next()
            if tok.kind == 'ident':
                params.append(tok.val.lower())
            elif not (tok.kind == 'op' and tok.val == ','):
                raise SyntaxError(f'line {tok.line}: bad parameter list')
        locals_, instances = [], []
        while self.peek().kind == 'ident' and self.peek().val.lower() in ('local', 'instance', 'globals', 'global'):
            kw = self.next().val.lower()
            self.expect('(')
            lst = []
            while not self.accept(')'):
                tok = self.next()
                if tok.kind == 'ident':
                    lst.append(tok.val.lower())
                elif not (tok.kind == 'op' and tok.val == ','):
                    raise SyntaxError(f'line {tok.line}: bad {kw} list')
            if kw == 'local':
                locals_ += lst
            elif kw == 'instance':
                instances += lst
        self.expect('(')
        body = self.parse_seq(stop=(')',))
        self.expect(')')
        fname = name.val.lower()
        if fname in self.funcs:
            raise SyntaxError(f'line {line}: function {fname} redefined')
        self.funcs[fname] = Func(fname, params, locals_, instances, body, line)

    def parse_expr(self):
        return self.parse_assign()

    def parse_assign(self):
        lhs = self.parse_ternary()
        tok = self.peek()
        if tok.kind == 'op' and tok.val in self.ASSIGN_OPS:
            self.next()
            rhs = self.parse_assign()
            if lhs[0] not in ('var', 'mem') and not (lhs[0] == 'call' and lhs[1] == 'slider'):
                raise SyntaxError(f'line {tok.line}: assignment to non-lvalue')
            return ('assign', tok.val, lhs, rhs)
        return lhs

    def parse_ternary(self):
        c = self.parse_or()
        if self.accept('?'):
            a = self.parse_assign()
            b = None
            if self.accept(':'):
                b = self.parse_assign()
            return ('cond', c, a, b)
        return c

    def _binary(self, sub, ops):
        a = sub()
        while self.peek().kind == 'op' and self.peek().val in ops:
            op = self.next().val
            b = sub()
            a = ('bin', op, a, b)
        return a

    def parse_or(self):
        return self._binary(self.parse_and, ('||',))

    def parse_and(self):
        return self._binary(self.parse_cmp, ('&&',))

    def parse_cmp(self):
        return self._binary(self.parse_bit, ('==', '!=', '===', '!==', '<', '>', '<=', '>='))

    def parse_bit(self):
        return self._binary(self.parse_add, ('|', '&', '~'))

    def parse_add(self):
        return self._binary(self.parse_mul, ('+', '-'))

    def parse_mul(self):
        return self._binary(self.parse_mod, ('*', '/'))

    def parse_mod(self):
        return self._binary(self.parse_pow, ('%', '<<', '>>'))

    def parse_pow(self):
        return self._binary(self.parse_unary, ('^',))

    def parse_unary(self):
        tok = self.peek()
        if tok.kind == 'op' and tok.val in ('-', '+', '!'):
            self.next()
            return ('un', tok.val, self.parse_unary())
        return self.parse_postfix()

    def parse_postfix(self):
        node = self.parse_primary()
        while self.accept('['):
            idx = self.parse_seq(stop=(']',))
            self.expect(']')
            node = ('mem', node, idx)
        return node

    def parse_primary(self):
        tok = self.next()
        if tok.kind == 'num':
            v = tok.val
            if v.startswith('0x'):
                val = float(int(v, 16))
            elif v.startswith('$x'):
                val = float(int(v[2:], 16))
            elif v.startswith("$'"):
                val = float(ord(v[2]))
            elif v == '$pi':
                val = 3.141592653589793
            elif v == '$e':
                val = 2.718281828459045
            elif v == '$phi':
                val = 1.618033988749895
            else:
                val = float(v)
            return ('num', val)
        if tok.kind == 'str':
            return ('str', bytes(tok.val[1:-1], 'utf-8').decode('unicode_escape'))
        if tok.kind == 'ident':
            name = tok.val.lower()
            if self.accept('('):
                args = []
                if not self.accept(')'):
                    while True:
                        args.append(self.parse_seq(stop=(',', ')')))
                        if self.accept(')'):
                            break
                        self.expect(',')
                if name == 'while':
                    if len(args) != 1:
                        raise SyntaxError(f'line {tok.line}: while() takes one argument')
                    if self.accept('('):
                        body = self.parse_seq(stop=(')',))
                        self.expect(')')
                        return ('while', args[0], body)
                    return ('while', None, args[0])
                base = name.rsplit('.', 1)[-1]
                builtin = (name in MATH1 or name in MATH2 or name in OUT_ARGS or name in RUNTIME_FUNCS
                           or name in ('loop', 'slider'))
                if not builtin and name not in self.funcs and base not in self.funcs:
                    raise SyntaxError(f'line {tok.line}: function {name} used before it is defined')
                return ('call', name, args, tok.line)
            return ('var', name)
        if tok.kind == 'op' and tok.val == '(':
            s = self.parse_seq(stop=(')',))
            self.expect(')')
            return s
        raise SyntaxError(f'line {tok.line}: unexpected {tok.val!r}')


# ----------------------------------------------------------------- JSFX file
def split_sections(text):
    header, sections = [], {}
    cur, cur_line, buf = None, 0, []
    for ln, line in enumerate(text.split('\n'), 1):
        m = re.match(r'^@(\w+)(.*)$', line)
        if m:
            if cur is not None:
                sections[cur] = (cur_line, '\n'.join(buf))
            cur, cur_line, buf = m.group(1), ln + 1, []
            if cur == 'gfx':
                sections['gfx_size'] = (ln, m.group(2).strip())
            continue
        if cur is None:
            header.append(line)
        else:
            buf.append(line)
    if cur is not None:
        sections[cur] = (cur_line, '\n'.join(buf))
    return header, sections


SLIDER_RE = re.compile(r'^slider(\d+):(?:([A-Za-z_]\w*)=)?\s*([-+0-9.eE]+)\s*<([^>]*)>(.*)$')


def parse_sliders(header):
    sliders = {}
    for line in header:
        m = SLIDER_RE.match(line.strip())
        if not m:
            if line.strip().startswith('slider'):
                raise SyntaxError(f'bad slider line: {line}')
            continue
        idx = int(m.group(1))
        name = (m.group(2) or '').lower()
        default = float(m.group(3))
        spec = m.group(4)
        enum = None
        em = re.search(r'\{(.*)\}', spec)
        if em:
            enum = em.group(1).split(',')
            spec = spec[:em.start()]
        parts = spec.split(',')
        mn, mx = float(parts[0]), float(parts[1])
        step_part = parts[2] if len(parts) > 2 else '0'
        shape = None
        if ':' in step_part:
            step_part, shape = step_part.split(':', 1)
        step = float(step_part) if step_part.strip() else 0.0
        if enum is not None and (mn != 0 or mx != len(enum) - 1 or step != 1):
            raise SyntaxError(f'slider{idx}: enum range mismatch ({len(enum)} items, <{mn},{mx},{step}>)')
        if not (mn <= default <= mx) and not (mx < mn):
            raise SyntaxError(f'slider{idx}: default {default} outside range')
        if idx in sliders:
            raise SyntaxError(f'slider{idx} defined twice')
        sliders[idx] = dict(name=name, default=default, min=mn, max=mx, step=step,
                            enum=enum, shape=shape, label=m.group(5).strip())
    return sliders


# ----------------------------------------------------------------- codegen
SPECIAL_VARS = ['srate', 'spl0', 'spl1', 'tempo', 'beat_position', 'play_state', 'play_position',
                'samplesblock', 'num_ch', 'ts_num', 'ts_denom', 'ext_noinit', 'ext_nodenorm',
                'gfx_r', 'gfx_g', 'gfx_b', 'gfx_a', 'gfx_x', 'gfx_y', 'gfx_w', 'gfx_h', 'gfx_texth',
                'gfx_ext_retina', 'gfx_clear', 'gfx_mode', 'gfx_dest',
                'mouse_x', 'mouse_y', 'mouse_cap', 'mouse_wheel', 'mouse_hwheel', 'trigger',
                'pdc_delay', 'pdc_bot_ch', 'pdc_top_ch', 'midi_bus', 'ext_midi_bus']

MATH1 = {'sin': 'sin', 'cos': 'cos', 'tan': 'tan', 'asin': 'asin', 'acos': 'acos', 'atan': 'atan',
         'sqrt': 'r_sqrt', 'exp': 'exp', 'log': 'r_log', 'log10': 'r_log10', 'floor': 'floor',
         'ceil': 'ceil', 'abs': 'fabs', 'sqr': 'r_sqr', 'sign': 'r_sign', 'invsqrt': 'r_invsqrt',
         'rand': 'r_rand'}
MATH2 = {'pow': 'pow', 'atan2': 'atan2', 'min': 'fmin', 'max': 'fmax'}

# built-ins that take pointers to variables (output args); value = indices of out args
OUT_ARGS = {'midirecv': (0, 1, 2, 3), 'gfx_measurestr': (1, 2)}

RUNTIME_FUNCS = {
    'midisend': 4, 'slider_automate': None, 'sliderchange': None, 'slider_show': None,
    'memset': 3, 'memcpy': 3, 'freembuf': 1, 'time_precise': None,
    'gfx_set': None, 'gfx_rect': None, 'gfx_line': None, 'gfx_lineto': None, 'gfx_circle': None,
    'gfx_arc': None, 'gfx_roundrect': None, 'gfx_drawstr': None, 'gfx_setfont': None,
    'gfx_triangle': None, 'gfx_showmenu': 1, 'gfx_drawnumber': 2, 'gfx_getchar': None,
    'gfx_setcursor': None, 'gfx_gradrect': None,
    'strlen': 1, 'strcpy': 2, 'strcat': 2, 'strcmp': 2, 'stricmp': 2, 'strcpy_substr': None,
    'str_getchar': None, 'str_setchar': None, 'sprintf': None, 'strncpy': 3, 'match': None,
    'printf': None,
}


class CGen:
    def __init__(self, sliders, funcs):
        self.sliders = sliders
        self.slider_by_name = {s['name']: i for i, s in sliders.items() if s['name']}
        self.funcs = funcs
        self.globals = set()
        self.assigned = set()
        self.read = {}
        self.strings = []
        self.named_strings = {}
        self.specs = {}          # (fname, ns) -> cname
        self.spec_code = []
        self.spec_protos = []
        self.tmp = 0
        self.usedfuncs = set()

    # ---- names
    def cident(self, name):
        return 'v_' + re.sub(r'[^a-z0-9_]', lambda m: '_%02x' % ord(m.group(0)), name)

    def slider_ref(self, name):
        m = re.fullmatch(r'slider(\d+)', name)
        if m:
            return f'SL[{int(m.group(1))}]'
        if name in self.slider_by_name:
            return f'SL[{self.slider_by_name[name]}]'
        return None

    def resolve_var(self, name, ctx, write=False):
        """ctx: dict(ns, params, locals, instances) or None for top-level."""
        if name.startswith('#'):
            return None  # string, handled elsewhere
        if ctx is not None:
            if name in ctx['params']:
                return 'p_' + name.replace('.', '_')
            if name in ctx['locals']:
                return 'l_' + ctx['cname'] + '_' + name.replace('.', '_')
            if name.startswith('this.'):
                rest = name[5:]
                full = (ctx['ns'] + '.' + rest) if ctx['ns'] else rest
                return self.gvar(full, write)
            if name == 'this':
                return self.gvar(ctx['ns'] or 'this', write)
            first = name.split('.')[0]
            if first in ctx['instances']:
                full = (ctx['ns'] + '.' + name) if ctx['ns'] else name
                return self.gvar(full, write)
        return self.gvar(name, write)

    def gvar(self, name, write):
        sref = self.slider_ref(name)
        if sref:
            return sref
        self.globals.add(name)
        if write:
            self.assigned.add(name)
        else:
            self.read.setdefault(name, 0)
            self.read[name] += 1
        return self.cident(name)

    def strid(self, node, ctx):
        """Return C expr for a string id (literal, #named, or numeric expr)."""
        if node[0] == 'str':
            self.strings.append(node[1])
            return f'(double)(STR_LIT_BASE+{len(self.strings) - 1})'
        if node[0] == 'var' and node[1].startswith('#'):
            nm = node[1]
            if nm not in self.named_strings:
                self.named_strings[nm] = len(self.named_strings)
            return f'(double)(STR_NAMED_BASE+{self.named_strings[nm]})'
        return self.expr(node, ctx)

    # ---- expressions
    def lvalue(self, node, ctx):
        if node[0] == 'var':
            r = self.resolve_var(node[1], ctx, write=True)
            if r is None:
                raise SyntaxError(f'cannot assign to string {node[1]} with numeric op')
            return '&' + r if not r.startswith('SL[') else '&' + r
        if node[0] == 'mem':
            return f'memp(({self.expr(node[1], ctx)})+({self.expr(node[2], ctx)}))'
        if node[0] == 'call' and node[1] == 'slider':
            return f'sliderp({self.expr(node[2][0], ctx)})'
        raise SyntaxError('bad lvalue')

    def expr(self, n, ctx):
        k = n[0]
        if k == 'num':
            return repr(float(n[1]))
        if k == 'str':
            return self.strid(n, ctx)
        if k == 'nop':
            return '0.0'
        if k == 'var':
            if n[1].startswith('#'):
                return self.strid(n, ctx)
            return self.resolve_var(n[1], ctx)
        if k == 'seq':
            parts = [self.expr(x, ctx) for x in n[1]]
            self.tmp += 1
            body = ''.join(f'(void)({p});\n' for p in parts[:-1])
            return f'({{ {body} ({parts[-1]}); }})'
        if k == 'mem':
            return f'(*memp(({self.expr(n[1], ctx)})+({self.expr(n[2], ctx)})))'
        if k == 'un':
            a = self.expr(n[2], ctx)
            if n[1] == '-':
                return f'(-({a}))'
            if n[1] == '+':
                return f'(+({a}))'
            return f'(TRUTH({a}) ? 0.0 : 1.0)'
        if k == 'bin':
            op = n[1]
            a, b = self.expr(n[2], ctx), self.expr(n[3], ctx)
            if op in ('+', '-', '*', '/'):
                return f'(({a}) {op} ({b}))'
            if op == '^':
                return f'pow(({a}), ({b}))'
            if op == '%':
                return f'r_mod(({a}), ({b}))'
            if op in ('|', '&', '~', '<<', '>>'):
                cop = {'|': '|', '&': '&', '~': '^', '<<': '<<', '>>': '>>'}[op]
                return f'((double)(((long long)({a})) {cop} ((long long)({b}))))'
            if op == '==':
                return f'(fabs(({a})-({b})) < 0.00001 ? 1.0 : 0.0)'
            if op == '!=':
                return f'(fabs(({a})-({b})) < 0.00001 ? 0.0 : 1.0)'
            if op == '===':
                return f'((({a}) == ({b})) ? 1.0 : 0.0)'
            if op == '!==':
                return f'((({a}) != ({b})) ? 1.0 : 0.0)'
            if op in ('<', '>', '<=', '>='):
                return f'((({a}) {op} ({b})) ? 1.0 : 0.0)'
            if op == '&&':
                return f'((TRUTH({a}) && TRUTH({b})) ? 1.0 : 0.0)'
            if op == '||':
                return f'((TRUTH({a}) || TRUTH({b})) ? 1.0 : 0.0)'
            raise SyntaxError(f'op {op}')
        if k == 'assign':
            op, lhs, rhs = n[1], n[2], n[3]
            if lhs[0] == 'var' and lhs[1].startswith('#'):
                d = self.strid(lhs, ctx)
                s = self.strid(rhs, ctx)
                if op == '=':
                    return f'r_strcpy_2({d}, {s})'
                if op == '+=':
                    return f'r_strcat_2({d}, {s})'
                raise SyntaxError('bad string op')
            p = self.lvalue(lhs, ctx)
            r = self.expr(rhs, ctx)
            if op == '=':
                return f'(*({p}) = ({r}))'
            fn = {'+=': 'OP_ADD', '-=': 'OP_SUB', '*=': 'OP_MUL', '/=': 'OP_DIV', '%=': 'OP_MOD',
                  '^=': 'OP_POW', '|=': 'OP_OR', '&=': 'OP_AND', '~=': 'OP_XOR'}[op]
            return f'({{ double *_p = ({p}); double _r = ({r}); *_p = {fn}(*_p, _r); }})'
        if k == 'cond':
            c = self.expr(n[1], ctx)
            a = self.expr(n[2], ctx)
            b = self.expr(n[3], ctx) if n[3] is not None else '0.0'
            return f'(TRUTH({c}) ? ({a}) : ({b}))'
        if k == 'while':
            if n[1] is None:
                body = self.expr(n[2], ctx)
                return f'({{ int _g = 0; while (TRUTH({body})) {{ if (++_g > 100000000) die("while loop runaway"); }} 0.0; }})'
            c = self.expr(n[1], ctx)
            body = self.expr(n[2], ctx)
            return f'({{ int _g = 0; while (TRUTH({c})) {{ (void)({body}); if (++_g > 100000000) die("while loop runaway"); }} 0.0; }})'
        if k == 'call':
            return self.call(n, ctx)
        raise SyntaxError(f'node {k}')

    def call(self, n, ctx):
        name, args, line = n[1], n[2], n[3]
        if name == 'loop':
            cnt = self.expr(args[0], ctx)
            body = self.expr(args[1], ctx)
            return f'({{ int _n = (int)({cnt}); if (_n > 10000000) die("loop too long"); while (_n-- > 0) {{ (void)({body}); }} 0.0; }})'
        if name == 'slider':
            return f'(*sliderp({self.expr(args[0], ctx)}))'
        if name in MATH1:
            if len(args) != 1:
                raise SyntaxError(f'line {line}: {name} takes 1 arg')
            return f'{MATH1[name]}({self.expr(args[0], ctx)})'
        if name in MATH2:
            if len(args) != 2:
                raise SyntaxError(f'line {line}: {name} takes 2 args')
            return f'{MATH2[name]}(({self.expr(args[0], ctx)}), ({self.expr(args[1], ctx)}))'
        if name in OUT_ARGS:
            outs = OUT_ARGS[name]
            cargs = []
            for i, a in enumerate(args):
                if i in outs:
                    cargs.append(self.lvalue(a, ctx))
                else:
                    cargs.append(self.strid(a, ctx))
            return f'r_{name}({", ".join(cargs)})'
        if name in RUNTIME_FUNCS:
            want = RUNTIME_FUNCS[name]
            if want is not None and len(args) != want:
                raise SyntaxError(f'line {line}: {name} takes {want} args, got {len(args)}')
            cargs = [self.strid(a, ctx) if a[0] in ('str',) or (a[0] == 'var' and a[1].startswith('#'))
                     else self.expr(a, ctx) for a in args]
            return f'r_{name}({len(cargs)}, (double[]){{ {", ".join(cargs) or "0"} }})'
        # user function (possibly namespaced)
        ns = ''
        fname = name
        if fname not in self.funcs:
            if '.' in name:
                pre, fname = name.rsplit('.', 1)
                if fname not in self.funcs:
                    raise SyntaxError(f'line {line}: unknown function {name}')
                if pre.startswith('this.') or pre == 'this':
                    rest = pre[5:] if pre != 'this' else ''
                    cur = ctx['ns'] if ctx else ''
                    ns = '.'.join(x for x in (cur, rest) if x)
                else:
                    first = pre.split('.')[0]
                    if ctx and first in ctx['instances']:
                        ns = '.'.join(x for x in (ctx['ns'], pre) if x)
                    else:
                        ns = pre
            else:
                raise SyntaxError(f'line {line}: unknown function {name}')
        f = self.funcs[fname]
        if len(args) != len(f.params):
            raise SyntaxError(f'line {line}: {fname} expects {len(f.params)} args, got {len(args)}')
        cname = self.specialize(f, ns)
        cargs = [self.expr(a, ctx) for a in args]
        return f'{cname}({", ".join(cargs)})'

    def specialize(self, f, ns):
        key = (f.name, ns)
        if key in self.specs:
            return self.specs[key]
        cname = 'f_' + re.sub(r'[^a-z0-9_]', '_', f.name) + ('__' + re.sub(r'[^a-z0-9_]', '_', ns) if ns else '')
        cname += f'_{len(self.specs)}'
        self.specs[key] = cname
        ctx = dict(ns=ns, params=f.params, locals=f.locals, instances=f.instances, cname=cname)
        params = ', '.join('double p_' + p.replace('.', '_') for p in f.params) or 'void'
        proto = f'static double {cname}({params})'
        self.spec_protos.append(proto + ';')
        body = self.expr(f.body, ctx)
        locs = ''.join(f'static double l_{cname}_{l.replace(".", "_")};\n' for l in f.locals)
        self.spec_code.append(f'{locs}{proto} {{\n return ({body});\n}}\n')
        return cname


def main():
    src_path, out_path = sys.argv[1], sys.argv[2]
    text = open(src_path, encoding='utf-8').read()
    header, sections = split_sections(text)
    sliders = parse_sliders(header)
    for line in header:
        if line.startswith('import '):
            raise SyntaxError('import not supported by harness')
    funcs = {}
    asts = {}
    case_variants = {}
    for sec in ('init', 'slider', 'block', 'sample', 'gfx', 'serialize'):
        if sec in sections:
            line0, code = sections[sec]
            toks = tokenize(code, line0)
            for t in toks:
                if t.kind == 'ident':
                    case_variants.setdefault(t.val.lower(), set()).add(t.val)
            p = Parser(toks, funcs)
            ast = p.parse_seq(stop=())
            if p.peek().kind != 'eof':
                p.err('unexpected token at top level (unbalanced parentheses?)')
            asts[sec] = ast
    clashes = [sorted(v) for v in case_variants.values() if len(v) > 1]
    if clashes:
        # EEL2 names are case-insensitive: NAME and name are the same variable
        raise SyntaxError('identifiers differing only in case (same variable in EEL2): ' +
                          ', '.join('/'.join(c) for c in clashes))
    gen = CGen(sliders, funcs)
    bodies = {}
    for sec in ('init', 'slider', 'block', 'sample', 'gfx'):
        if sec in asts:
            bodies[sec] = gen.expr(asts[sec], None)
        else:
            bodies[sec] = '0.0'
    out = []
    out.append('#include "runtime.h"\n')
    for v in SPECIAL_VARS:
        gen.globals.discard(v)
    for v in SPECIAL_VARS:
        out.append(f'double {gen.cident(v)};\n')
    for g in sorted(gen.globals):
        out.append(f'static double {gen.cident(g)};\n')
    # strings
    out.append(f'const int NUM_STR_LIT = {len(gen.strings)};\n')
    out.append('const char *STR_LIT[] = {\n')
    for s in gen.strings:
        out.append('  "' + s.encode('unicode_escape').decode('ascii').replace('"', '\\"') + '",\n')
    out.append('  0 };\n')
    out.append(f'const int NUM_STR_NAMED = {len(gen.named_strings)};\n')
    # sliders
    out.append(f'const int NUM_SLIDER_DEFS = {max(sliders) if sliders else 0};\n')
    out.append('const SliderDef SLIDER_DEFS[] = {\n')
    for i in sorted(sliders):
        s = sliders[i]
        out.append(f'  {{ {i}, {s["default"]!r}, {s["min"]!r}, {s["max"]!r}, {s["step"]!r}, "{s["label"]}" }},\n')
    out.append('  { 0, 0, 0, 0, 0, 0 } };\n')
    out.extend(p + '\n' for p in gen.spec_protos)
    out.extend(gen.spec_code)
    for sec in ('init', 'slider', 'block', 'sample', 'gfx'):
        out.append(f'void sec_{sec}(void) {{ (void)({bodies[sec]}); }}\n')
    gs = sections.get('gfx_size', (0, '0 0'))[1].split()
    out.append(f'const int GFX_W = {gs[0] if gs else 0}, GFX_H = {gs[1] if len(gs) > 1 else 0};\n')
    open(out_path, 'w').write(''.join(out))
    # diagnostics: globals read but never assigned (likely typos)
    specials = set(SPECIAL_VARS)
    suspicious = sorted(g for g in gen.read if g not in gen.assigned and g not in specials)
    if suspicious:
        print('WARNING: variables read but never assigned:', ', '.join(suspicious), file=sys.stderr)
    unused = sorted(set(funcs) - {k[0] for k in gen.specs})
    if unused:
        print('note: functions never called:', ', '.join(unused), file=sys.stderr)
    print(f'ok: {len(sliders)} sliders, {len(funcs)} functions, {len(gen.specs)} specializations, '
          f'{len(gen.globals)} globals', file=sys.stderr)


if __name__ == '__main__':
    try:
        main()
    except SyntaxError as e:
        print('SYNTAX ERROR:', e, file=sys.stderr)
        sys.exit(1)
