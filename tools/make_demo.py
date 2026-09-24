#!/usr/bin/env python3
"""
Render every built-in preset of ReeseBasser.jsfx playing the same two-bar
DnB bassline (172 BPM) and join them into one demo file (WAV, plus MP3 when
the 'lameenc' module is installed).

  python3 tools/make_demo.py [--out DIR]
"""
import argparse
import os
import subprocess
import sys

import numpy as np

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from test_render import build, read_wav  # noqa: E402

BPM = 172
B = 60 / BPM
# (beat, note, velocity) - velocity 0 = note off; overlapping notes glide (legato)
RIFF = [(0, 29, 115), (2.5, 32, 100), (2.55, 29, 0), (3.5, 31, 100), (3.55, 32, 0),
        (4, 29, 115), (4.05, 31, 0), (6, 36, 120), (6.05, 29, 0), (7, 34, 110), (7.05, 36, 0),
        (7.75, 34, 0)]


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--out', default=os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), 'build', 'demo'))
    a = ap.parse_args()
    os.makedirs(a.out, exist_ok=True)
    exe = build(a.out)
    ev = os.path.join(a.out, 'riff.txt')
    with open(ev, 'w') as f:
        for beat, n, v in RIFF:
            f.write(f'{beat * B:.4f} midi {144 if v else 128} {n} {v}\n')
    parts = []
    seg = 8 * B + 0.25
    for p in range(20):
        sc = os.path.join(a.out, 'p.ui')
        wav = os.path.join(a.out, f'preset{p:02d}.wav')
        with open(sc, 'w') as f:
            f.write(f'frame\nmenu {p + 1}\nmouse 450 24 1\nframe\nmouse 450 24 0\nframe\n'
                    f'renderwav {seg:.3f} {ev} {wav}\n')
        subprocess.run([exe, 'gfx', '44100', sc, os.path.join(a.out, 'p.log')], check=True,
                       capture_output=True)
        parts.append(read_wav(wav))
    x = np.concatenate(parts)
    pcm = (np.clip(x, -1, 1) * 32767).astype('<i2')
    import wave
    out_wav = os.path.join(a.out, 'reese_basser_presets_demo.wav')
    with wave.open(out_wav, 'wb') as w:
        w.setnchannels(2)
        w.setsampwidth(2)
        w.setframerate(44100)
        w.writeframes(pcm.tobytes())
    print('wrote', out_wav)
    try:
        import lameenc
        enc = lameenc.Encoder()
        enc.set_bit_rate(192)
        enc.set_in_sample_rate(44100)
        enc.set_channels(2)
        enc.set_quality(2)
        mp3 = enc.encode(pcm.tobytes()) + enc.flush()
        out_mp3 = out_wav[:-4] + '.mp3'
        open(out_mp3, 'wb').write(mp3)
        print('wrote', out_mp3)
    except ImportError:
        pass
    print('order: ' + ' / '.join(f'{i + 1}' for i in range(20)), f'({seg:.2f}s each)')


if __name__ == '__main__':
    main()
