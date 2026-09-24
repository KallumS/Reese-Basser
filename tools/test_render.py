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


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--out', default=os.path.join(ROOT, 'build', 'test'))
    ap.add_argument('--quick', action='store_true')
    a = ap.parse_args()
    os.makedirs(a.out, exist_ok=True)
    exe = build(a.out)
    fails = 0

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
                'mouse 395 66 1\nframe\nmouse 395 66 0\nframe\n'          # FX + MANGLE tab
                'mouse 53 156 1\nframe\nmouse 53 96 1\nframe\nmouse 53 96 0\nframe\n'  # drag DRIVE up
                'mouse 240 66 1\nframe\nmouse 240 66 0\nframe\n'          # MODULATION tab
                'menu 2\nmouse 600 412 1\nframe\nmouse 600 412 0\nframe\n'  # slot 1 dest -> Cutoff
                'logframe\ndumpsliders\n')
    r = subprocess.run([exe, 'gfx', '44100', sc, os.path.join(a.out, 'pages.log')], capture_output=True, text=True)
    vals = {int(l.split()[0][6:]): float(l.split()[2]) for l in r.stdout.split('\n') if l.startswith('slider')}
    ok = r.returncode == 0 and vals.get(48, 0) > 10 and vals.get(84) == 1
    fails += not ok
    print(f'  dist drive after drag {vals.get(48)}, mod 1 dest {vals.get(84)} {"OK" if ok else "FAIL"}')

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
