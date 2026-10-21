#!/usr/bin/env python3
"""
Offline tests for ReeseBasser.jsfx.

Transpiles the plugin to C (tools/jsfx2c), renders a set of patches and checks
for NaN/Inf, silence, clipping and that the Reese "beating" really happens at
the expected rate.  WAV files are written to --out for listening.

  python3 tools/test_render.py [--out DIR] [--quick]
"""
import argparse
import os
import subprocess
import sys
import wave

import numpy as np

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import ui_checks
import render_gfx  # noqa: E402

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
H = os.path.join(ROOT, 'tools', 'jsfx2c')

ENGINES = ['Dual Saw', 'Supersaw', 'PWM', 'CZ', 'FM', 'Sync', 'Phaser', 'Cross-Fold']


def build(out):
    c = os.path.join(out, 'rb.c')
    exe = os.path.join(out, 'rb')
    subprocess.check_call([sys.executable, os.path.join(H, 'jsfx2c.py'), os.path.join(ROOT, 'ReeseBasser.jsfx'), c])
    subprocess.check_call(['gcc', '-O2', '-w', '-I', H, '-o', exe, c, os.path.join(H, 'runtime.c'), '-lm'])
    return exe


def read_wav(path):
    import struct
    with open(path, 'rb') as f:
        data = f.read()
    n = struct.unpack('<I', data[40:44])[0] // 4
    x = np.frombuffer(data[44:44 + n * 4], dtype='<f4').reshape(-1, 2)
    return x


def render(exe, out, name, sliders, notes, secs=2.0, sr=44100, tempo=174, init_srate=None):
    ev = os.path.join(out, name + '.txt')
    with open(ev, 'w') as f:
        for idx, val in sliders.items():
            f.write(f'0 slider {idx} {val}\n')
        for t, n, v in notes:
            if v > 0:
                f.write(f'{t} midi 144 {n} {v}\n')
            else:
                f.write(f'{t} midi 128 {n} 0\n')
    wav = os.path.join(out, name + '.wav')
    env = dict(os.environ)
    if init_srate:
        env['JSFX_INIT_SRATE'] = str(init_srate)
    r = subprocess.run([exe, 'render', str(sr), str(secs), ev, wav, str(tempo)], capture_output=True, text=True,
                       env=env)
    if r.returncode not in (0,):
        print(r.stdout, r.stderr)
        raise SystemExit(f'render failed: {name}')
    speed = float(r.stdout.split('(')[1].split('x')[0])
    return read_wav(wav), speed


def envelope_rate(x, sr, lo=0.3, hi=30):
    """Dominant amplitude-modulation frequency of the signal (Hz)."""
    m = x.mean(axis=1)
    env = np.abs(m)
    # smooth to ~ 100 Hz
    k = int(sr / 100)
    env = np.convolve(env, np.ones(k) / k, mode='same')[::k // 2]
    env = env - env.mean()
    esr = sr / (k // 2)
    spec = np.abs(np.fft.rfft(env * np.hanning(len(env)), n=1 << 16))
    freqs = np.fft.rfftfreq(1 << 16, 1 / esr)
    band = (freqs > lo) & (freqs < hi)
    return freqs[band][np.argmax(spec[band])]


# ----------------------------------------------------------------- Apple's HIG Foundations (ADR-015)
def kc(s):
    """gfx_getchar()'s code for a named key: 'rght' is the bytes r g h t, big-endian."""
    v = 0
    for ch in s.encode():
        v = v * 256 + ch
    return v


TAB, RET, ESC, SPACE = 9, 13, 27, 32
PAGE_STOPS = {0: 40, 1: 45, 2: 35}   # every control on each page, counted off the screen:
#   all pages: <, preset, >, Mutate, Options, three tabs (8)
#   Synth: engine menu, 8 knobs, 2 switches, 2 knobs | filter menu, 5 knobs | 4 knobs, 2 switches | 3 knobs, 4 switches
#   Modulation: 4 knobs + bar | 4 knobs | LFO 1 menu, 2 knobs, 2 switches | LFO 2 the same | 6 x (2 menus + bar)
#   FX: menu, 3 knobs, switch | menu, 6 knobs | 10 knobs | 5 knobs
TAB_XY = {0: (85, 78), 1: (247, 78), 2: (409, 78)}


def gfx_run(exe, out, name, body, env=None, size=None):
    """Run a gfx script (a list of lines); returns (stdout, stderr, {logname: lines})."""
    sc = os.path.join(out, name + '.ui')
    lines = ['frame'] + ([f'size {size[0]} {size[1]}'] if size else []) + body
    logs = []
    for i, l in enumerate(lines):
        if l.startswith('logframe') and len(l.split()) == 1:
            p = os.path.join(out, f'{name}_{len(logs)}.log')
            lines[i] = 'logframe ' + p
            logs.append(p)
    open(sc, 'w').write('\n'.join(lines) + '\n')
    e = dict(os.environ)
    e.update(env or {})
    r = subprocess.run([exe, 'gfx', '44100', sc, os.path.join(out, name + '.log')], capture_output=True, text=True,
                       env=e)
    if r.returncode != 0 or 'RUNTIME ERROR' in r.stderr:
        print(r.stderr[-2000:])
    return r.stdout, r.stderr, [ui_checks.read(p) for p in logs]


def click(x, y, cap=1):
    return [f'mouse {x} {y} {cap}', 'frame', f'mouse {x} {y} 0', 'frame', 'mouse -100 -100 0']


def keys(*codes, shift=False):
    out = []
    for c in codes:
        out += ([f'mouse -100 -100 8'] if shift else []) + [f'key {c}', 'frame'] + (['mouse -100 -100 0'] if shift else [])
    return out


def sliders(stdout):
    return {int(l.split()[0][6:]): float(l.split()[2]) for l in stdout.split('\n') if l.startswith('slider')}


def check(label, ok, detail=''):
    print(f'  {label}: {"OK" if ok else "FAIL"}{(" — " + detail) if detail and not ok else ""}')
    return 0 if ok else 1


def hig_tests(exe, out):
    fails = 0
    playing = ['menu 4'] + click(450, 22) + ['note 36 100', 'audio 0.5']

    print('--- HIG: every line of text 7:1 on what it sits on, and fits its box (Arial metrics +8%)')
    states = {}
    for page in (0, 1, 2):
        body = list(playing) + (click(*TAB_XY[page]) if page else [])
        for k in range(4):   # the beat bar pulses: look at it at four moments
            body += ['audio 0.11', 'logframe']
        states[f'page {page}'] = gfx_run(exe, out, f'hig_c{page}', body)[2]
    # hover and keyboard states, and text that changes with the settings
    states['hover'] = gfx_run(exe, out, 'hig_hover', playing + [
        'mouse 110 270 0', 'logframe', 'mouse 680 22 0', 'logframe', 'mouse 247 78 0', 'logframe',
        'mouse 400 22 0', 'logframe', 'mouse -100 -100 0'] + keys(*[TAB] * 10) + ['logframe']
        + click(*TAB_XY[1]) + ['mouse 830 424 0', 'logframe', 'mouse 85 78 0', 'logframe'])[2]
    for sl, vals in ((1, range(8)), (52, range(4)), (3, range(3)), (13, range(3)), (21, (5,))):
        body = []
        for v in vals:
            body += [f'slider {sl} {v}'] + (click(*TAB_XY[2]) if sl == 52 else []) + ['logframe']
        states[f'slider {sl}'] = gfx_run(exe, out, f'hig_s{sl}', body)[2]
    bad_c, bad_f, small, seen = [], [], [], 0
    for name, logs in states.items():
        for lines in logs:
            seen += sum(1 for l in lines if l.startswith('textbox'))
            bad_c += [(name,) + b for b in ui_checks.contrast(lines)]
            bad_f += [(name,) + b for b in ui_checks.fits(lines)]
            small += [(name,) + b for b in ui_checks.small_text(lines, 10)]
    fails += check(f'contrast, {seen} strings in {sum(map(len, states.values()))} frames', not bad_c, str(bad_c[:6]))
    fails += check('every string fits its box', not bad_f, str(bad_f[:6]))
    fails += check('nothing smaller than 10 px at 100%', not small, str(small[:6]))
    low = [t['text'] for lines in states['page 0'] for t in ui_checks.texts(lines) if t['y'] >= 664]
    fails += check('nothing at the bottom edge (no text below y 664)', not low, str(low[:4]))
    top = ui_checks.text_at(states['page 0'][0], 'Tab to use the keys')
    fails += check('the help line is at the top', bool(top) and top[0]['y'] < 60)

    print('--- HIG: the keyboard alone (Tab, Shift+Tab, Return/Space, arrows, Delete, Esc)')
    unfit = []
    for page, want in PAGE_STOPS.items():
        body = (click(*TAB_XY[page]) if page else []) + ['dumpmem 130000 1100']
        for k in range(want + 1):
            body += keys(TAB) + ['logframe']
        so, _, logs = gfx_run(exe, out, f'hig_tab{page}', body)
        focus = ui_checks.focus_list(so)
        rings = [ui_checks.rings(l) for l in logs]
        unfit += [(page,) + b for l in logs for b in ui_checks.fits(l)]
        one = all(len(r) == 1 for r in rings)
        fails += check(f'page {page}: {len(focus)} controls in the Tab order (expect {want}), one ring per press',
                       len(focus) == want and one, f'{len(focus)} controls, rings per press {[len(r) for r in rings]}')
        inside = True
        for k, r in enumerate(rings[:want]):
            if len(r) != 1:
                continue
            fid, kind, x, y, w, h = focus[k]
            bx = r[0]
            inside &= bx[0] < x and bx[1] < y and bx[2] > x + w and bx[3] > y + h
        fails += check(f'page {page}: each press rings the next control in reading order, then wraps',
                       inside and one and rings[want] == rings[0])
        notacc = not any(ui_checks.other_rings(l) for l in logs)
        fails += check(f'page {page}: the ring is near-white #F2F4F7, never an accent', notacc)
        # not colour alone: each switch has one bar under its chosen segment, the chosen tab a thick one
        rects = [tuple(map(float, l.split()[1:5])) for l in logs[0] if l.startswith('rect ')]
        bars = []
        for fid, kind, x, y, w, h in focus:
            if kind == 3:
                bars.append(sum(1 for rx, ry, rw, rh in rects
                                if rh == 3 and ry == y + h - 4 and x <= rx and rx + rw <= x + w))
            if kind == 6 and fid == 300 + page:
                bars.append(sum(1 for rx, ry, rw, rh in rects if rh == 4 and ry == y + h - 4 and rx == x))
        fails += check(f'page {page}: the chosen segment of every switch and the chosen tab carry a bar',
                       bars and all(b == 1 for b in bars), str(bars))
        short = [f for f in focus if f[5] < 28]
        fails += check(f'page {page}: every control at least 28 tall', not short, str(short[:4]))
        close = ui_checks.spacing(focus)
        fails += check(f'page {page}: controls at least 12 apart', not close, str(close[:6]))
    fails += check('the help line names every focused control and its value without being cut short',
                   not unfit, str(unfit[:4]))
    _, _, logs = gfx_run(exe, out, 'hig_stab', keys(TAB, shift=True) + ['logframe'])
    r = ui_checks.rings(logs[0])
    fails += check('Shift+Tab from nothing goes to the last control (Clipper)',
                   len(r) == 1 and r[0][0] < 826 < r[0][2] and r[0][1] < 596 < r[0][3], str(r))
    _, _, logs = gfx_run(exe, out, 'hig_ret', keys(*[TAB] * 7, RET) + ['logframe'])
    fails += check('Return on the Modulation tab opens that page', bool(ui_checks.text_at(logs[0], 'MOD MATRIX')))
    _, se, _ = gfx_run(exe, out, 'hig_menu', ['menu 5'] + keys(TAB, TAB, SPACE) + ['logframe'])
    _, _, logs = gfx_run(exe, out, 'hig_menu2', ['menu 5'] + keys(TAB, TAB, SPACE) + ['logframe'])
    fails += check('Space on the preset box opens the preset menu',
                   '[menu] ' in se and bool(ui_checks.text_at(logs[0], 'Neuro Double Notch')))
    to_detune = keys(*[TAB] * 10)
    so, _, logs = gfx_run(exe, out, 'hig_arrow', to_detune + ['logframe'] + keys(kc('rght')) + ['dumpsliders'])
    a = sliders(so)[2]
    hint = [t for t in ui_checks.texts(logs[0]) if t['text'].startswith('Detune:')]
    fails += check('the focused knob is named with its value in the help line', bool(hint) and hint[0]['y'] < 60)
    so, _, _ = gfx_run(exe, out, 'hig_arrow2', to_detune + keys(kc('rght'), shift=True) + ['dumpsliders'])
    b = sliders(so)[2]
    so, _, _ = gfx_run(exe, out, 'hig_arrow3', to_detune + keys(kc('rght'), kc('rght'), kc('del')) + ['dumpsliders'])
    c = sliders(so)[2]
    fails += check('arrows nudge a knob, Shift finer, Delete resets', a > 30.5 and 30 < b < a and c == 30,
                   f'right {a}, shift-right {b}, delete {c}')
    so, _, _ = gfx_run(exe, out, 'hig_dd', keys(*[TAB] * 9, kc('down')) + ['dumpsliders'])
    s1 = sliders(so)
    so, _, _ = gfx_run(exe, out, 'hig_sg', keys(*[TAB] * 18, kc('rght')) + keys(*[TAB] * 1, RET) + ['dumpsliders'])
    s2 = sliders(so)
    fails += check('arrows step a menu and a switch, Return steps a switch',
                   s1[1] == 1 and s2[3] == 1 and s2[13] == 1, f'engine {s1[1]}, detune mode {s2[3]}, phase {s2[13]}')
    _, _, logs = gfx_run(exe, out, 'hig_esc', keys(TAB, TAB) + ['logframe'] + keys(ESC) + ['logframe']
                         + keys(TAB) + click(700, 300) + ['logframe'])
    fails += check('Esc and a click both let go of the focus',
                   [len(ui_checks.rings(l)) for l in logs] == [1, 0, 0])

    print('--- HIG: interface size, Retina, the system font, scrolling')
    def biggest_font(lines):
        return max(float(l.split()[1]) for l in lines if l.startswith('font '))

    def scrollbars(lines):
        return [l for l in lines if l.startswith('rect') and ' 0.4500 0.4800 0.5500 ' in l]
    so, _, logs = gfx_run(exe, out, 'hig_opt', ['menu 4'] + click(898, 22) + ['logframe', 'dumpsliders'])
    s = sliders(so)
    fails += check('Options → Interface Size 200% is remembered (slider 101)', s.get(101) == 3, str(s.get(101)))
    fails += check('200% in a 960 x 684 window: drawn as wide as the window (100%), no scroll bars (1.3)',
                   biggest_font(logs[0]) == 27 and len(scrollbars(logs[0])) == 0,
                   f'font {biggest_font(logs[0])}, bars {len(scrollbars(logs[0]))}')
    for label, size, want_font, want_bars in (
            ('200% in a 1440 x 684 window: 150%, as wide as the window, scrolls up and down only', (1440, 684), 40.5, 1),
            ('200% in a 1920 x 900 window: twice the size, scrolls up and down only', (1920, 900), 54, 1),
            ('200% in a 2000 x 1500 window: grows past 200% to fit, no scroll bars', (2000, 1500), 27 * 2000 / 960, 0)):
        _, _, logs = gfx_run(exe, out, 'hig_w', ['slider 101 3', 'logframe'], size=size)
        f, b = biggest_font(logs[0]), len(scrollbars(logs[0]))
        fails += check(label, abs(f - want_font) < 0.01 and b == want_bars, f'font {f}, bars {b}')
    body = ['slider 101 3'] + keys(*[TAB] * 40) + ['logframe']
    _, _, logs = gfx_run(exe, out, 'hig_follow', body, size=(1200, 684))
    r = ui_checks.rings(logs[0])
    fails += check('at 200% the focus scrolls into view (last control, bottom right)',
                   len(r) == 1 and r[0][0] >= 0 and r[0][1] >= 0 and r[0][2] <= 1200 and r[0][3] <= 684, str(r))
    for label, body, size, env, want_font, want_bars in (
            ('Retina 2x at 100%: twice the size, no scroll bars', ['retina 2'], (1920, 1368), None, 54, 0),
            ('Retina 2x in a smaller window: still twice the size, scrolls', ['retina 2'], (1440, 1026), None, 54, 2),
            ('100% in a small window keeps its size and scrolls', [], (700, 500), None, 27, 2),
            ('Fit to Window shrinks to fit, no scroll bars', ['slider 101 4'], (480, 342), None, 13.5, 0),
            ('embedded in a track panel: fits, no scroll bars', ['extflags 1'], (480, 342), None, 13.5, 0)):
        _, _, logs = gfx_run(exe, out, 'hig_sz', body + ['logframe'], size=size, env=env)
        fails += check(label, biggest_font(logs[0]) == want_font and len(scrollbars(logs[0])) == want_bars,
                       f'font {biggest_font(logs[0])}, bars {len(scrollbars(logs[0]))}')
    _, _, logs = gfx_run(exe, out, 'hig_wheel', ['logframe', 'mouse 780 300 0', 'wheel -240', 'frame', 'logframe'],
                         size=(700, 500))
    y0 = ui_checks.text_at(logs[0], 'SCOPE / THROB')[0]['y']
    y1 = ui_checks.text_at(logs[1], 'SCOPE / THROB')[0]['y']
    fails += check('the wheel scrolls where no control takes it', y1 < y0, f'{y0} -> {y1}')
    for fonts, want in (('Arial', 'Arial'), ('.AppleSystemUIFont,Arial', '.AppleSystemUIFont'),
                        ('Segoe UI,Arial', 'Segoe UI')):
        _, _, logs = gfx_run(exe, out, 'hig_font', ['logframe'], env={'JSFX_FONTS': fonts})
        faces = {' '.join(l.split()[3:]) for l in logs[0] if l.startswith('font ')}
        fails += check(f'system font: given {fonts!r}, draws in {want}', faces == {want}, str(faces))

    print('--- HIG: Reduce Motion holds the beat bar still')
    def beat_bars(lines):
        # the bar's fill: x 22 in the page, a rect drawn just after the dark trough at y 336
        return [l for l in lines if l.startswith('rect 22.00 338.00')]
    for rm in (0, 1):
        _, _, logs = gfx_run(exe, out, f'hig_rm{rm}', [f'slider 102 {rm}', 'note 36 100', 'audio 0.3', 'logframe',
                                                       'audio 0.17', 'logframe', 'audio 0.23', 'logframe'])
        bars = [tuple(beat_bars(l)) for l in logs]
        still = len(set(bars)) == 1 and all(bars)
        fails += check(f'Reduce Motion {"on: the bar holds still" if rm else "off: the bar pulses with the beat"}',
                       still == bool(rm), str([b[0][:60] if b else None for b in bars]))
    _, _, logs = gfx_run(exe, out, 'hig_rmmenu', ['menu 6'] + click(898, 22) + ['dumpsliders'])
    so, _, _ = gfx_run(exe, out, 'hig_rmmenu', ['menu 6'] + click(898, 22) + ['dumpsliders'])
    fails += check('Options → Reduce Motion is remembered (slider 102)', sliders(so).get(102) == 1)

    print('--- HIG final sweep (1.3): edges and arcs 3:1, menus in full, no flashing, undo')
    for page in (0, 1, 2):
        so, _, logs = gfx_run(exe, out, f'hig_e{page}', (click(*TAB_XY[page]) if page else [])
                              + ['logframe', 'dumpmem 130000 1100'])
        focus = ui_checks.focus_list(so)
        framed = sum(1 for f in focus if f[1] in ui_checks.FRAMED)
        bad = ui_checks.edges(logs[0], focus)
        fails += check(f'page {page}: the edges of all {framed} menus, switches, bars, buttons and tabs 3:1 on the ground (a button’s on its fill too)',
                       framed > 0 and not bad, str(bad[:4]))
        bad, seen = ui_checks.arcs(logs[0])
        fails += check(f'page {page}: {seen} knob value arcs 3:1 on the panel and on the track', seen > 0 and not bad,
                       str(bad[:4]))
    unfit = []
    for sl, n, page in ((21, 6, 0), (35, 7, 1), (41, 7, 1), (47, 6, 2), (52, 4, 2), (83, 11, 1), (84, 25, 1)):
        body = click(*TAB_XY[page]) if page else []
        for v in range(n):
            body += [f'slider {sl} {v}', 'logframe']
        for lines in gfx_run(exe, out, f'hig_dd{sl}', body)[2]:
            unfit += [(sl,) + b for b in ui_checks.fits(lines) if b[0] != 'FILTER OFF']
    fails += check('every choice of every menu fits its box', not unfit, str(unfit[:4]))

    def beat_bar(lines):
        return [l for l in lines if l.startswith('rect 22.00 338.00')]
    _, _, logs = gfx_run(exe, out, 'hig_flash', ['slider 3 1', 'slider 4 6', 'note 36 100', 'audio 0.3', 'logframe',
                                                 'audio 0.04', 'logframe', 'audio 0.05', 'logframe'])
    bars = [tuple(beat_bar(l)) for l in logs]
    fails += check('a beat faster than 3 a second holds the bar still (no flashing)',
                   len(set(bars)) == 1 and all(bars), str([b[0][:60] if b else None for b in bars]))
    img = render_gfx.replay(logs[0])
    bar, trough = ui_checks.pixel(img, 30, 340), ui_checks.pixel(img, 21, 340)
    fails += check('the still beat bar 3:1 on its trough', ui_checks.ratio(bar, trough) >= 3,
                   f'{ui_checks.ratio(bar, trough):.2f}')

    def undos(se):
        return se.count('[undo point]')
    s0 = sliders(gfx_run(exe, out, 'hig_u0', ['dumpsliders'])[0])
    for what, press, release in (('a preset (the > button)', ['mouse 598 22 1', 'frame'], ['mouse 598 22 0', 'frame']),
                                 ('a mutation', ['menu 4', 'mouse 680 22 1', 'frame'], ['mouse 680 22 0', 'frame'])):
        so1, se1, _ = gfx_run(exe, out, 'hig_u1', press + ['dumpsliders'])
        so2, se2, _ = gfx_run(exe, out, 'hig_u2', press + release + ['dumpsliders'])
        first = undos(se1) == 1 and sliders(so1) == s0
        then = undos(se2) == 2 and sliders(so2) != s0
        fails += check(f'{what}: an undo point before the sound changes and one after, so Undo puts it back',
                       first and then, f'undo points {undos(se1)} then {undos(se2)}, changed first {sliders(so1) != s0}')
    return fails


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--out', default=os.path.join(ROOT, 'build', 'test'))
    ap.add_argument('--quick', action='store_true')
    ap.add_argument('--hig', action='store_true', help="only the window's checks (Apple's HIG)")
    a = ap.parse_args()
    os.makedirs(a.out, exist_ok=True)
    exe = build(a.out)
    fails = 0
    if a.hig:
        fails = hig_tests(exe, a.out)
        print('FAILURES:', fails)
        return 1 if fails else 0

    held = [(0.0, 36, 110), (1.9, 36, 0)]
    line = [(0.0, 36, 110), (0.45, 36, 0), (0.5, 39, 100), (0.8, 41, 90), (0.95, 39, 0),
            (1.2, 34, 120), (1.25, 41, 0), (1.9, 34, 0)]

    print('--- engines x oversampling')
    for e in range(8):
        for q in ([1] if a.quick else [0, 1, 2]):
            x, speed = render(exe, a.out, f'eng{e}_q{q}', {1: e, 80: q, 22: 2500}, line)
            pk = np.abs(x).max()
            rms = np.sqrt((x ** 2).mean())
            ok = 0.02 < rms and pk <= 1.0001 and np.isfinite(x).all()
            fails += not ok
            print(f'{ENGINES[e]:10s} q{q}: peak {pk:.3f} rms {rms:.3f} speed {speed:6.1f}x realtime {"OK" if ok else "FAIL"}')

    print('--- beat rate follows Hz mode (2 Hz / 5 Hz), constant across notes')
    for bhz in (2.0, 5.0):
        for note in (28, 40):
            x, _ = render(exe, a.out, f'beat{bhz}_{note}', {1: 0, 3: 1, 4: bhz, 21: 5, 11: 0, 12: 0},
                          [(0.0, note, 100), (3.9, note, 0)], secs=4)
            r = envelope_rate(x[4410:], 44100)
            ok = abs(r - bhz) < 0.25 or abs(r - 2 * bhz) < 0.25
            fails += not ok
            print(f'  beat {bhz} Hz, note {note}: measured {r:.2f} Hz {"OK" if ok else "FAIL"}')

    print('--- tempo sync: 1/4 at 120 bpm = 2 Hz')
    x, _ = render(exe, a.out, 'beat_sync', {1: 0, 3: 2, 5: 6, 21: 5, 11: 0, 12: 0},
                  [(0.0, 33, 100), (3.9, 33, 0)], secs=4, tempo=120)
    r = envelope_rate(x[4410:], 44100)
    ok = abs(r - 2.0) < 0.25
    fails += not ok
    print(f'  measured {r:.2f} Hz {"OK" if ok else "FAIL"}')

    print('--- @init ran at a stale 44.1 kHz, playing at 96 kHz (ext_noinit case): 2 Hz beat')
    x, _ = render(exe, a.out, 'stale_srate', {1: 0, 3: 1, 4: 2.0, 21: 5, 11: 0, 12: 0},
                  [(0.0, 33, 100), (3.9, 33, 0)], secs=4, sr=96000, init_srate=44100)
    r = envelope_rate(x[9600:], 96000)
    ok = abs(r - 2.0) < 0.25 and np.isfinite(x).all() and np.abs(x).max() <= 1.0001
    fails += not ok
    print(f'  measured {r:.2f} Hz {"OK" if ok else "FAIL"}')

    print('--- cents mode: beat scales with pitch (30 cents)')
    rates = []
    for note in (33, 45):
        x, _ = render(exe, a.out, f'cents_{note}', {1: 0, 3: 0, 2: 30, 21: 5, 11: 0, 12: 0},
                      [(0.0, note, 100), (3.9, note, 0)], secs=4)
        rates.append(envelope_rate(x[4410:], 44100, hi=40))
    f33 = 440 * 2 ** ((33 - 69) / 12)
    expect = f33 * (2 ** (30 / 1200) - 1)
    print(f'  note 33: {rates[0]:.2f} Hz (expect {expect:.2f}), note 45: {rates[1]:.2f} Hz (expect {2 * expect:.2f})')
    ok = abs(rates[0] - expect) < 0.3 and abs(rates[1] - 2 * expect) < 0.5
    fails += not ok

    print('--- mangle / fx smoke tests')
    fx = {
        'formant': {60: 100, 59: 40},
        'shift': {61: 120, 62: 60},
        'ring': {63: 1.5, 64: 80},
        'crush': {65: 5, 66: 6},
        'notch': {52: 1, 58: 100, 56: 80},
        'phaser': {52: 2},
        'flanger': {52: 3, 56: 80},
        'squash': {68: 100},
        'chorus': {69: 80, 72: 160},
        'dist_all': {48: 80, 47: 5, 51: 1},
        'sub_noise_lowcut': {15: 80, 18: 50, 20: 150},
        'modmatrix': {84: 1, 85: 60, 87: 5, 88: 50, 90: 3, 91: 40, 93: 13, 94: 50, 96: 19, 97: -50},
    }
    for dtype in range(6):
        fx[f'dist{dtype}'] = {47: dtype, 48: 70}
    for name, sl in fx.items():
        sl = dict(sl)
        sl.setdefault(22, 3000)
        x, speed = render(exe, a.out, 'fx_' + name, sl, line)
        pk = np.abs(x).max()
        rms = np.sqrt((x ** 2).mean())
        ok = 0.01 < rms and pk <= 1.0001 and np.isfinite(x).all()
        fails += not ok
        print(f'  {name:18s} peak {pk:.3f} rms {rms:.3f} speed {speed:6.1f}x {"OK" if ok else "FAIL"}')

    print('--- presets (loaded through the UI preset menu)')
    riff = os.path.join(a.out, 'riff.txt')
    with open(riff, 'w') as f:
        for t, n, v in line + [(2.0, 29, 110), (2.9, 29, 0)]:
            f.write(f'{t} midi {144 if v else 128} {n} {v}\n')
    for p in range(20):
        sc = os.path.join(a.out, f'preset{p}.ui')
        wav = os.path.join(a.out, f'preset{p:02d}.wav')
        with open(sc, 'w') as f:
            f.write(f'frame\nmenu {p + 1}\nmouse 450 24 1\nframe\nmouse 450 24 0\nframe\n'
                    f'renderwav 3.5 {riff} {wav}\n')
        r = subprocess.run([exe, 'gfx', '44100', sc, os.path.join(a.out, 'p.log')], capture_output=True, text=True)
        x = read_wav(wav)
        pk = np.abs(x).max()
        rms = np.sqrt((x ** 2).mean())
        ok = r.returncode == 0 and 0.02 < rms and pk <= 1.0001 and np.isfinite(x).all()
        fails += not ok
        name = [l for l in r.stderr.split('\n') if '[menu]' in l]
        print(f'  preset {p:2d}: peak {pk:.3f} ({20 * np.log10(pk + 1e-9):5.1f} dB) rms {20 * np.log10(rms + 1e-9):5.1f} dB '
              f'{"OK" if ok else "FAIL"}')

    print('--- UI pages: tabs, knob drag on the FX page, mod matrix dropdown')
    sc = os.path.join(a.out, 'pages.ui')
    with open(sc, 'w') as f:
        f.write('frame\n'
                'mouse 395 70 1\nframe\nmouse 395 70 0\nframe\n'          # FX + MANGLE tab
                'mouse 53 170 1\nframe\nmouse 53 110 1\nframe\nmouse 53 110 0\nframe\n'  # drag DRIVE up
                'mouse 240 70 1\nframe\nmouse 240 70 0\nframe\n'          # MODULATION tab
                'menu 2\nmouse 600 424 1\nframe\nmouse 600 424 0\nframe\n'  # slot 1 dest -> Cutoff
                'logframe\ndumpsliders\n')
    r = subprocess.run([exe, 'gfx', '44100', sc, os.path.join(a.out, 'pages.log')], capture_output=True, text=True)
    vals = {int(l.split()[0][6:]): float(l.split()[2]) for l in r.stdout.split('\n') if l.startswith('slider')}
    ok = r.returncode == 0 and vals.get(48, 0) > 10 and vals.get(84) == 1
    fails += not ok
    print(f'  dist drive after drag {vals.get(48)}, mod 1 dest {vals.get(84)} {"OK" if ok else "FAIL"}')

    fails += hig_tests(exe, a.out)

    print('--- silence after release')
    x, _ = render(exe, a.out, 'release', {}, [(0.0, 36, 100), (0.5, 36, 0)], secs=2)
    tail = np.abs(x[int(1.5 * 44100):]).max()
    ok = tail < 1e-4
    fails += not ok
    print(f'  tail peak {tail:.2e} {"OK" if ok else "FAIL"}')

    print('FAILURES:', fails)
    return 1 if fails else 0


if __name__ == '__main__':
    sys.exit(main())
