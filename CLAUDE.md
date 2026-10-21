# CLAUDE.md: Reese Basser

A REAPER instrument that only makes Reese basses. It is a single JSFX file
(`ReeseBasser.jsfx`, EEL2 language). The owner's DAW is REAPER; the target is
**REAPER 6.74+** (102 parameters, slider shaping, `tags:instrument`).

**Status:** v1.1 is owner-tested and working in REAPER (macOS): a paged UI (SYNTH / MODULATION /
FX + MANGLE), 8 engines, 20 presets. v1.1.1 (wording, ADR-014), **v1.2 (Apple's HIG Foundations,
ADR-015: 7:1 text, interface size, the keyboard alone, system font) and v1.3 (the final sweep: 3:1
edges, no flashing, the interface fits the width, Undo for presets and Mutate) are on
`ccr-f2d9adc9-lanc9o` and not yet run in REAPER.** See "Current status" at the end of `docs/SESSION_LOG.md`.

Read first: `docs/JSFX_NOTES.md` (verified language/API facts; they have already
caused real bugs), `docs/DECISIONS.md` (why things are the way they are),
`docs/SESSION_LOG.md` (history and open items), `docs/apple-hig-review.md` (the window checked
against Apple's 19 Foundations pages).

## Layout

```
ReeseBasser.jsfx          the plugin (DSP + custom UI + presets), ~2000 lines
README.md                 user manual (install, engines, controls, presets, recipes)
docs/                     screenshot*.png (3 pages), JSFX_NOTES.md, DECISIONS.md, SESSION_LOG.md,
                          apple-hig-review.md
tools/jsfx2c/jsfx2c.py    JSFX/EEL2 -> C transpiler (strict; follows the JSFX reference)
tools/jsfx2c/runtime.c|h  C runtime + driver: renders audio, logs @gfx draw calls
tools/jsfx2c/render_gfx.py  gfx log -> PNG (Liberation Sans = Arial metrics)
tools/test_render.py      test suite (must print FAILURES: 0)
tools/ui_checks.py        reads a gfx log: contrast and fit of every string, focus rings, focus list
tools/make_demo.py        renders all presets on a DnB riff -> build/demo/*.wav|mp3
```

## Commands

```bash
pip install numpy                        # matplotlib/lameenc optional (plots / mp3 demo)
python3 tools/test_render.py             # full suite (~3 min); --quick for 1x speed; --hig the window only
python3 tools/make_demo.py               # demo audio into build/demo/
# transpile only (catches syntax errors, case clashes, define-before-use, arg counts):
python3 tools/jsfx2c/jsfx2c.py ReeseBasser.jsfx /tmp/rb.c
gcc -O2 -w -Itools/jsfx2c -o /tmp/rb /tmp/rb.c tools/jsfx2c/runtime.c -lm
/tmp/rb render 44100 2 events.txt out.wav [tempo]     # events: "<sec> midi <st> <d1> <d2>" / "<sec> slider <i> <v>"
/tmp/rb gfx 44100 script.txt out.log && python3 tools/jsfx2c/render_gfx.py out.log ui.png
#   gfx script cmds: note n vel | noteoff n | audio sec | slider i v | mouse x y cap | wheel d
#                    menu n (next gfx_showmenu result) | frame | logframe [path] | dumpsliders
#                    key code (next gfx_getchar(); Shift via mouse cap 8) | size w h | retina v
#                    extflags v (1 = embedded) | dumpmem addr n (e.g. the focus list at 130000)
#                    renderwav sec events.txt out.wav   (env JSFX_INIT_SRATE=44100 = stale-srate @init)
#   env JSFX_FONTS=".AppleSystemUIFont,Arial": faces the "system" has (default Arial only)
```

There is no REAPER in the dev container. The harness is the only verification,
so **run the test suite before every push**, and render a UI PNG after any `@gfx` change.

## Critical EEL2/JSFX rules (see docs/JSFX_NOTES.md for more)

- Names are **case-insensitive**: `NSTK` and `nstk` are the same variable (this caused a real
  stuck-note bug). The transpiler errors on case-only clashes; don't work around it.
- `&&` and `||` have **equal precedence**, evaluated left to right. `|`, `&` and `~` are also equal.
  Always parenthesise mixes.
- Functions must be **defined before use** (no recursion), 0–40 params. Functions defined in
  `@init` are global; ones defined in other sections are local to that section.
- `gfx_rect(x,y,w,h)` has 4 args only; outlines are drawn via `RO()`. `gfx_drawstr` clips to its box.
- With `ext_noinit=1`, `srate` may be stale in `@init`, so every rate-dependent value lives in
  `update_params()`, which `@block` re-runs when `srate != last_srate`.
- `@slider` does not run for UI edits. The UI sets `ui_dirty=1` and `@block` calls `update_params()`.
- Notify the host with the slider variable itself: `sliderchange(cutoff)`,
  `slider_automate(cutoff, done)` (generated dispatch in `notify()`/`automate()`).
- `@gfx` runs concurrently with audio: never write a global in @gfx that audio code also writes
  (use `ui_*` names). The transpiler enforces this (`ui_dirty` is the one allowed shared flag).
- Every slider name starts with `-` (hidden). REAPER puts visible sliders above the `@gfx` area,
  so 100 visible sliders hid the whole UI in REAPER (ADR-011). New sliders must be hidden too.
- **Text follows Apple's writing guidelines** (ADR-014): title-style names, menus and slider
  names; sentence-case captions and hints; em dashes, curly quotes. `str_getchar` is signed, so loop
  over a string to `!= 0`; `build_menu` doubles `&` for `gfx_showmenu`. Render the pages after.
- **Apple's HIG Foundations** (ADR-015, `docs/apple-hig-review.md`). Rules for new UI code:
  - every size is logical (960×684 canvas) and goes through `ui_s` — use `RF`/`RO`/`LN`/`TX`/...;
  - every control calls `focusable(id, kind, x, y, w, h)` as it is drawn (so Tab reaches it in
    reading order), draws `focus_ring()` when focused, and answers the keys (`key_value`,
    `key_press`); ids are slider numbers, buttons 200+, tabs 300+;
  - every line of text 7:1 on what it sits on: `c_text`, `c_sec` (#B0B6C0), an accent's tint
    (`atr/atg/atb`), or measure it; `c_dis` only for disabled labels;
  - buttons, menus, switches, bars 28 tall and ≥ 12 apart (knobs: their own 56×72 target);
  - a chosen state needs a second cue besides colour (the bars on switches and tabs);
  - nothing important at the bottom edge; no message on a timer; new animation obeys
    `reduce_motion`, and holds still if it would flash more than 3 times a second. Add the new
    control to `PAGE_STOPS` in `tools/test_render.py`;
  - (1.3) the edge of a framed control is `c_edge()` (#6D7581, 3:1 on every fill and ground) or,
    hovered, the section's colour; a mark that carries meaning is 3:1 on what it sits on
    (`ui_checks.edges()`/`arcs()` check them);
  - (1.3) anything that replaces the sound (a preset, a mutation) goes through `ask_change()`,
    which adds a REAPER undo point before and after, so Edit → Undo puts the sound back.
- Memory index = `floor(v + 0.00001)`; `%` works on absolute integer values; `x == y` means |x−y| < 1e-5.

## Code map (search for these banners)

- **Header**: 102 `sliderN:name=` lines (101 Interface Size and 102 Reduce Motion are window
  preferences, not sound; presets and Mutate touch only 1–100). **Never renumber or reorder sliders**, because it breaks saved
  projects and automation. Add new parameters at 101+. Enum sliders: min 0, step 1.
- `@init`: memory map, tables (BEATS, INTV, FMR, formants, Hilbert coefs), DSP helpers
  (`blep/saw/pulse/wave_morph/cz_wave`, env, LFO, `calc_filter`+`filt` ladder/SVF, `svf_*`,
  `dec2/dec4` elliptic decimators, `dist`, `eng_phaser`, `hilbert`), voice setup, MIDI/note stack,
  `update_params()`, then UI (param table `pm/pe`, formatting, widgets, displays), presets, mutate.
- `@block`: MIDI into a queue (`MQ`), transport lock of synced LFO/movement phases.
- `@sample`: per-sample MIDI dispatch → mod sources → mod matrix → smoothing → pitch/beat →
  per-osc freqs → **oversampled loop** (engine → noise → [pre-dist] → filter → [post-dist] → decimate)
  → DC block → VCA → formant → ring → shift → crush → movement → squash → low cut → chorus → width
  → mono-bass → + sub → pan/volume/clipper → scope buffers.
- `@gfx 960 684`: immediate-mode UI on a 960×684 logical canvas scaled to the window
  (`ui_s`, `ui_ox/oy`), never below the interface size × `gfx_ext_retina` or, if the window is narrower than that, its width (never below 100%) (then it scrolls:
  `ui_sx/ui_sy`, scroll bars), with 3 pages chosen by `ui_page` (0 SYNTH, 1 MODULATION, 2 FX +
  MANGLE). Header row 1 (y 8): name, presets, MUTATE, Options; row 2 (y 44): the help line and
  readout; tabs at y 64. Pages are drawn 10 below their own coordinates (`ui_ty`).
  Widgets: `knob` (66×74 cell), `dropdown`, `segs`, `hbar`, `button`, `tab`; keys at the end of
  @gfx (Tab order from the `FOCUSL` list built this frame).
  **@gfx runs in its own thread**: its globals must be `ui_*` (or function locals), never a
  variable the audio code writes. A shared `mi` loop counter made the mod matrix flicker in
  REAPER; the transpiler now rejects any global written by both @gfx and audio code.

Memory map (slots): MQ 0, NOTESTK 8200, per-osc arrays O_* 9000–9831 (stride 64; `O_FB[k+32]` holds
osc levels), SRC/MODV/MSRC/MDST/MAMT/BEATS/INTV/FMR 10000–10120, phaser/Hilbert states 10400–10600,
FORMT 10700, PMIN/PMAX/PDEF/PSHAPE 11000–12000, PUNIT 12200, ENGDESC 12400, ENGLBL 12420,
ENGDEF 12460, PNAME 12500, PENUM 12800, PSTEP 13100, chorus 20000–36383, flanger 40000–72767,
SCOPE 80000, THROB 90000, PSTORE 100000, UIMEM 120000, FOCUSL 130000–131023 (focus list, @gfx
only). Keep new buffers clear of these.

## Parameters worth knowing

Engine=1 (0 Dual Saw, 1 Supersaw, 2 PWM, 3 CZ, 4 FM, 5 Sync, 6 Phaser, 7 Cross-Fold), det=2,
detmode=3 (cents/Hz/tempo-sync), enga/b/c=6/7/8 (meaning depends on engine; UI labels in ENGLBL,
defaults in ENGDEF), cutoff=22, quality=80 (oversampling), volume=81, mod matrix = 83..100
(src, dst, amount × 6). Mod destinations are indexed 1..24 into `MODV[]`. iface_size=101
(100/125/150/200%, Fit to Window), reduce_motion=102.

## Conventions

- Match the existing style: 2-space indent, `?:` for branching, `// ---` section banners, short comments.
- Presets live in `load_preset()` as `pv(index, value)` diffs from defaults. Keep them level-matched
  (~−14.5 dB RMS on the test riff; `test_render.py` prints each preset's level).
- Performance matters (EEL2 JIT is slower than the C harness): avoid per-sample `log`/`pow` when a
  value can be computed in `update_params()`, and prefer instance variables over memory in hot loops.
- Branches: 1.1 was developed on `claude/reese-bass-plugin-fvsdw1` (merged); 1.1.1, 1.2 and 1.3 are on
  `ccr-f2d9adc9-lanc9o`. Commit messages are descriptive; no PR unless asked.
- Never commit Apple's guideline pages: they are Apple's copyrighted text. Refer to them by page.
- Don't commit Cockos documentation verbatim. Summarise verified facts in docs/JSFX_NOTES.md instead.
