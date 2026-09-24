#!/usr/bin/env python3
"""Render a gfx log written by the jsfx2c runtime (gfx mode) into a PNG."""
import math
import sys

from PIL import Image, ImageDraw, ImageFont

FONT = '/usr/share/fonts/truetype/liberation/LiberationSans-Regular.ttf'
FONTB = '/usr/share/fonts/truetype/liberation/LiberationSans-Bold.ttf'


def main(log, out):
    lines = open(log).read().split('\n')
    w, h = 1200, 810
    if lines and lines[0].startswith('size'):
        _, w, h = lines[0].split()[:3]
        w, h = int(float(w)), int(float(h))
    img = Image.new('RGBA', (w, h), (0, 0, 0, 255))
    fonts = {}
    cur = (12, 0)

    def getfont():
        key = (max(6, int(round(cur[0]))), cur[1])
        if key not in fonts:
            fonts[key] = ImageFont.truetype(FONTB if cur[1] == 98 else FONT, key[0])
        return fonts[key]

    def color(parts):
        r, g, b, a = [float(x) for x in parts]
        return (int(max(0, min(1, r)) * 255), int(max(0, min(1, g)) * 255), int(max(0, min(1, b)) * 255),
                int(max(0, min(1, a)) * 255))

    def draw(fn, c):
        if c[3] >= 255:
            fn(ImageDraw.Draw(img), c)
        else:
            ov = Image.new('RGBA', img.size, (0, 0, 0, 0))
            fn(ImageDraw.Draw(ov), c)
            img.alpha_composite(ov)

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
            x, y, rgt, bot = map(float, p[1:5])
            flags, hasbox = int(p[5]), int(p[6])
            c = color(p[8:12])
            txt = ' '.join(p[12:])
            f = getfont()
            l, t, r_, b_ = f.getbbox(txt)
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
            draw(lambda d, c: d.text((tx, ty), txt, fill=c, font=f), c)
        elif k == 'text':
            x, y, sz = map(float, p[1:4])
            c = color(p[4:8])
            txt = ' '.join(p[8:])
            f = getfont()
            draw(lambda d, c: d.text((x, y), txt, fill=c, font=f), c)
    img.convert('RGB').save(out)


if __name__ == '__main__':
    main(sys.argv[1], sys.argv[2])
