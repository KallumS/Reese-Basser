#!/usr/bin/env python3
"""
Checks of the window against Apple's HIG Foundations (ADR-015), read from a gfx log written by
the jsfx2c harness. Used by tools/test_render.py; can also be run on a log by hand:

  python3 tools/ui_checks.py out.log

- contrast():  every string at least 7:1 on what is drawn under it (WCAG's formula, the one
               Apple's Accessibility page points to). Disabled labels are exempt.
- fits():      every string fits the box it is drawn in (gfx_drawstr clips to it), measured with
               Liberation Sans (Arial's metrics) and a margin for wider system fonts.
- small_text(): no text smaller than a given size.
- rings():     the keyboard focus rings drawn (#F2F4F7 rounded rectangles), grouped.
- focus_list(): the plugin's focus list (ids, kinds and places) from a `dumpmem` of FOCUSL.
- edges():     every framed control's edge at least 3:1 on the ground outside it, a button's on its fill too (the
               non-text contrast Apple's Accessibility page asks of controls; WCAG 1.4.11).
- arcs():      every knob's value arc at least 3:1 on its panel and on the track beside it.
"""
import os
import sys

sys.path.insert(0, os.path.join(os.path.dirname(os.path.abspath(__file__)), 'jsfx2c'))
import render_gfx  # noqa: E402

DISABLED = (89, 94, 107)          # c_dis(): 0.35 0.37 0.42, the only colour exempt from 7:1
RING = (242, 244, 247)            # focus_ring(): #F2F4F7
FOCUSL = 130000                   # the plugin's focus list (memory map)
FIT_MARGIN = 1.08                 # San Francisco and Segoe UI run a little wider than Arial


def _lin(c):
    c /= 255.0
    return c / 12.92 if c <= 0.04045 else ((c + 0.055) / 1.055) ** 2.4


def luminance(rgb):
    r, g, b = rgb[:3]
    return 0.2126 * _lin(r) + 0.7152 * _lin(g) + 0.0722 * _lin(b)


def ratio(a, b):
    la, lb = luminance(a), luminance(b)
    hi, lo = max(la, lb), min(la, lb)
    return (hi + 0.05) / (lo + 0.05)


def _blend(fg, bg):
    a = fg[3] / 255.0
    return tuple(fg[i] * a + bg[i] * (1 - a) for i in range(3))


def read(log):
    return open(log).read().split('\n')


_cache = {}


def near(a, b, tol=2):
    return all(abs(x - y) <= tol for x, y in zip(a, b))


def texts(lines):
    """Every string drawn: dicts with text, x, y, w, h, colour, box, size and the colours under it."""
    key = id(lines)
    if key in _cache and _cache[key][0] is lines:
        return _cache[key][1]
    out = []

    def on_text(txt, tx, ty, f, c, box, flags, size, under):
        if not txt.strip():
            return
        l, t, r, b = f.getbbox(txt)
        x0, y0, x1, y1 = int(tx + l), int(ty + t), int(tx + r), int(ty + b)
        W, H = under.size
        x0, y0, x1, y1 = max(0, x0), max(0, y0), min(W, x1), min(H, y1)
        hist = {}
        if x1 > x0 and y1 > y0:
            im = under.crop((x0, y0, x1, y1)).convert('RGB')
            data = im.get_flattened_data() if hasattr(im, 'get_flattened_data') else im.getdata()
            for px in data:
                hist[px] = hist.get(px, 0) + 1
        out.append(dict(text=txt, x=tx, y=ty, w=f.getlength(txt), colour=c, box=box, size=size,
                        under=hist, flags=flags))
    render_gfx.replay(lines, on_text)
    _cache[key] = (lines, out)
    return out


def contrast(lines, need=7.0):
    """Strings under `need`:1 against any colour covering at least 8% of the area under them."""
    bad = []
    for t in texts(lines):
        if near(t['colour'][:3], DISABLED):
            continue
        total = sum(t['under'].values()) or 1
        worst = None
        for bg, n in t['under'].items():
            if n / total < 0.08:
                continue
            r = ratio(_blend(t['colour'], bg), bg)
            if worst is None or r < worst[0]:
                worst = (r, bg)
        if worst and worst[0] < need:
            bad.append((t['text'], round(worst[0], 2), t['colour'][:3], worst[1]))
    return bad


def fits(lines, margin=FIT_MARGIN):
    """Strings wider than the box gfx_drawstr clips them to."""
    bad = []
    for t in texts(lines):
        if t['box'] is None:
            continue
        x0, y0, x1, y1 = t['box']
        if t['w'] * margin > (x1 - x0) + 0.5:
            bad.append((t['text'], round(t['w'] * margin, 1), round(x1 - x0, 1)))
    return bad


def small_text(lines, least):
    return [(t['text'], t['size']) for t in texts(lines) if t['size'] < least - 0.01]


def text_at(lines, needle):
    return [t for t in texts(lines) if needle in t['text']]


def rings(lines):
    """Bounding boxes of the focus rings drawn: roundrects in the ring colour, merged when nested."""
    boxes = []
    for ln in lines:
        p = ln.split(' ')
        if p[0] != 'roundrect':
            continue
        c = render_gfx.color(p[6:10])[:3]
        if not near(c, RING):
            continue
        x, y, w, h = map(float, p[1:5])
        for b in boxes:
            if x >= b[0] - 4 and y >= b[1] - 4 and x + w <= b[2] + 4 and y + h <= b[3] + 4:
                break
        else:
            boxes.append([x, y, x + w, y + h])
    return boxes


def other_rings(lines):
    """Rounded rectangles in any colour but the ring's (the ring is never drawn in an accent)."""
    return [ln for ln in lines if ln.startswith('roundrect')
            and not near(render_gfx.color(ln.split(' ')[6:10])[:3], RING)]


def focus_list(stdout):
    """[(id, kind, x, y, w, h)] from the `dumpmem 130000 n` output of the harness."""
    mem = {}
    for ln in stdout.split('\n'):
        if ln.startswith('mem '):
            a = ln.split()
            mem[int(a[1])] = float(a[3])
    out, i = [], 0
    while mem.get(FOCUSL + i * 8, 0):
        b = FOCUSL + i * 8
        out.append(tuple(mem[b + k] for k in range(6)))
        i += 1
    return out


PANEL = (26, 29, 35)              # panel(): 0.105 0.115 0.14
TRACK = (51, 56, 66)              # knob(): the track, 0.2 0.22 0.26
FRAMED = (2, 3, 4, 5, 6, 7)       # menus, switches, bars, buttons, tabs, the preset box


def pixel(img, x, y):
    return img.getpixel((int(x), int(y)))[:3]


def edges(lines, focus, need=3.0, scale=1.0):
    """Framed controls whose edge (its top row, 3 in from the left) is under `need`:1 on what is
    just outside it (a button: and on its own fill just inside). `focus` is focus_list(); places are logical, the window unscrolled."""
    img = render_gfx.replay(lines)
    bad = []
    for fid, kind, x, y, w, h in focus:
        if kind not in FRAMED:
            continue
        ex, ey = (x + 3) * scale, y * scale
        edge, out, inside = pixel(img, ex, ey), pixel(img, ex, ey - 1), pixel(img, ex, ey + 1)
        # a button's edge is its section's colour, so it must also stand off its own fill; the
        # others' grey edge sits on a dark fill, or on a chosen segment's tint, which is itself
        # the cue (and carries a bar)
        r = min(ratio(edge, out), ratio(edge, inside)) if kind == 5 else ratio(edge, out)
        if r < need:
            bad.append((int(fid), round(r, 2), edge, out, inside))
    return bad


def arcs(lines, need=3.0):
    """Knob value arcs (anything drawn with gfx_arc but the track and the focus ring) under
    `need`:1 on the panel or on the track."""
    bad, seen = [], 0
    for ln in lines:
        p = ln.split(' ')
        if p[0] != 'arc':
            continue
        c = render_gfx.color(p[6:10])
        if near(c[:3], TRACK):
            continue
        seen += 1
        on_panel = _blend(c, PANEL)
        worst = min(ratio(on_panel, PANEL), ratio(_blend(c, TRACK), TRACK))
        if worst < need:
            bad.append((c, round(worst, 2)))
    return bad, seen


def spacing(focus, gap=12):
    """Pairs of controls closer than `gap` (logical units) to each other."""
    bad = []
    for i, a in enumerate(focus):
        for b in focus[i + 1:]:
            ax0, ay0, ax1, ay1 = a[2], a[3], a[2] + a[4], a[3] + a[5]
            bx0, by0, bx1, by1 = b[2], b[3], b[2] + b[4], b[3] + b[5]
            dx = max(bx0 - ax1, ax0 - bx1)
            dy = max(by0 - ay1, ay0 - by1)
            if max(dx, dy) < gap - 0.01:
                bad.append((int(a[0]), int(b[0]), max(dx, dy)))
    return bad


if __name__ == '__main__':
    lines = read(sys.argv[1])
    for t in contrast(lines):
        print('contrast', t)
    for t in fits(lines):
        print('fit', t)
