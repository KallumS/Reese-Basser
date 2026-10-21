#!/usr/bin/env python3
"""Render a gfx log written by the jsfx2c runtime (gfx mode) into a PNG.

replay() is also used by tools/ui_checks.py: it draws the log in order and can hand every
string to a callback together with a picture of everything drawn under it so far (text left
out), which is how the contrast of each line of text is measured."""
import math
import sys

from PIL import Image, ImageDraw, ImageFont

FONT = '/usr/share/fonts/truetype/liberation/LiberationSans-Regular.ttf'
FONTB = '/usr/share/fonts/truetype/liberation/LiberationSans-Bold.ttf'
_fonts = {}


def get_font(size, flags):
    key = (max(6, int(round(size))), flags)
    if key not in _fonts:
        _fonts[key] = ImageFont.truetype(FONTB if flags == 98 else FONT, key[0])
    return _fonts[key]


def color(parts):
    r, g, b, a = [float(x) for x in parts]
    return (int(max(0, min(1, r)) * 255), int(max(0, min(1, g)) * 255), int(max(0, min(1, b)) * 255),
            int(max(0, min(1, a)) * 255))


def text_place(p, cur):
    """Where a 'textbox' line puts its text: (text, x, y, font, colour, box) with box =
    (left, top, right, bottom) or None."""
    x, y, rgt, bot = map(float, p[1:5])
    flags, hasbox = int(p[5]), int(p[6])
    c = color(p[8:12])
    txt = ' '.join(p[12:])
    f = get_font(cur[0], cur[1])
    tw = f.getlength(txt)
    th = cur[0]
    tx, ty = x, y
    if hasbox:
        if flags & 1:
            tx = x + (rgt - x - tw) / 2
        if flags & 2:
            tx = rgt - tw
        if flags & 4:
            ty = y + (bot - y - th) / 2
        if flags & 8:
            ty = bot - th
    return txt, tx, ty, f, c, ((x, y, rgt, bot) if hasbox else None), flags


def replay(lines, on_text=None):
    """Draw a log. on_text(txt, tx, ty, font, colour, box, flags, size, under) is called for each
    string, 'under' being an RGB image of everything drawn before it except text."""
    w, h = 1200, 810
    if lines and lines[0].startswith('size'):
        _, w, h = lines[0].split()[:3]
        w, h = int(float(w)), int(float(h))
    img = Image.new('RGBA', (w, h), (0, 0, 0, 255))
    bare = Image.new('RGBA', (w, h), (0, 0, 0, 255)) if on_text else None
    cur = (12, 0)

    def draw(fn, c, text=False):
        targets = [img] if (text or bare is None) else [img, bare]
        for t in targets:
            if c[3] >= 255:
                fn(ImageDraw.Draw(t), c)
            else:
                ov = Image.new('RGBA', t.size, (0, 0, 0, 0))
                fn(ImageDraw.Draw(ov), c)
                t.alpha_composite(ov)

    for ln in lines[1:]:
        p = ln.split(' ')
        if not p or not p[0]:
            continue
        k = p[0]
        if k == 'rect':
            x, y, ww, hh = map(float, p[1:5])
            filled = int(p[5])
            c = color(p[6:10])
            if ww <= 0 or hh <= 0:
                continue
            if filled:
                draw(lambda d, c: d.rectangle([x, y, x + ww - 1, y + hh - 1], fill=c), c)
            else:
                draw(lambda d, c: d.rectangle([x, y, x + ww - 1, y + hh - 1], outline=c), c)
        elif k == 'line':
            x1, y1, x2, y2 = map(float, p[1:5])
            c = color(p[5:9])
            draw(lambda d, c: d.line([x1, y1, x2, y2], fill=c, width=1), c)
        elif k == 'circle':
            x, y, r = map(float, p[1:4])
            f = int(p[4])
            c = color(p[5:9])
            if f:
                draw(lambda d, c: d.ellipse([x - r, y - r, x + r, y + r], fill=c), c)
            else:
                draw(lambda d, c: d.ellipse([x - r, y - r, x + r, y + r], outline=c), c)
        elif k == 'arc':
            x, y, r, a0, a1 = map(float, p[1:6])
            c = color(p[6:10])
            s0, s1 = math.degrees(a0) - 90, math.degrees(a1) - 90
            if s1 < s0:
                s0, s1 = s1, s0
            draw(lambda d, c: d.arc([x - r, y - r, x + r, y + r], s0, s1, fill=c, width=1), c)
        elif k == 'roundrect':
            x, y, ww, hh, r = map(float, p[1:6])
            c = color(p[6:10])
            draw(lambda d, c: d.rounded_rectangle([x, y, x + ww, y + hh], r, outline=c), c)
        elif k == 'poly':
            n = int(p[1])
            pts = [(float(p[2 + 2 * i]), float(p[3 + 2 * i])) for i in range(n)]
            c = color(p[2 + 2 * n:6 + 2 * n])
            draw(lambda d, c: d.polygon(pts, fill=c), c)
        elif k == 'font':
            cur = (float(p[1]), int(p[2]))
        elif k == 'textbox':
            txt, tx, ty, f, c, box, flags = text_place(p, cur)
            if on_text:
                on_text(txt, tx, ty, f, c, box, flags, cur[0], bare)
            draw(lambda d, c: d.text((tx, ty), txt, fill=c, font=f), c, text=True)
        elif k == 'text':
            x, y, sz = map(float, p[1:4])
            c = color(p[4:8])
            txt = ' '.join(p[8:])
            f = get_font(cur[0], cur[1])
            draw(lambda d, c: d.text((x, y), txt, fill=c, font=f), c, text=True)
    return img


def main(log, out):
    replay(open(log).read().split('\n')).convert('RGB').save(out)


if __name__ == '__main__':
    main(sys.argv[1], sys.argv[2])
