# Session log

## Session 1 (2026-09-23 → 09-24): design, build, verify

**Brief from the owner:** a plugin that *only* makes Reese basses, extremely well; REAPER is the
DAW (JSFX or CLAP); support different Reese creation methods; "bonus points" for creative mangling.
The owner supplied 11 saved web guides on Reese design (a RAR archive: eMastered, Sample Market,
MusicRadar, LANDR, Ali Jamieson, Native Instruments, RouteNote, Noise Masters, Mind Flux,
a DnB tutorial site, Noise Engineering), then later the JSFX Programming Reference, ReaScript/API
pages and the REAPER 7.79 User Guide.

### What was done
1. **Research**: extracted the guides and distilled the methods: detuned saw pairs (±15–50 ct),
   unison stacks, PWM, the Casio CZ-5000 phase-distortion original (1988, Kevin Saunderson),
   filter/phaser movement with key tracking, FM/audio-rate modulated processors, sub split
   (mono sub, HPF'd Reese at ~120 Hz), +19 st layer, notch sweeps, OTT-style squash, the Trace
   SD-1 techstep distortion, and resampled/crushed jungle Reeses.
2. **Platform choice**: JSFX (ADR-001). GitHub (except this repo) and cockos.com were blocked,
   so no existing JSFX host was available, and an **offline JSFX→C harness** was written (ADR-005).
3. **Built `ReeseBasser.jsfx` v1.0** (about 2000 lines):
   - 8 engines: Dual Saw, Supersaw, PWM, CZ phase distortion, FM cross-mod, Hard Sync,
     Phaser (filter method), Cross-Fold. Shared A/B/C controls, unison ×8, spread, drift, phase mode.
   - Detune in Cents / Hz / **Tempo Sync with grid-locked beat phase** (ADR-003).
   - Oversampled core (1x/2x/4x, elliptic decimation), ZDF ladder + SVF filter with drive, key
     tracking and env; 6 distortion types pre/post filter.
   - Mangle rack: formant (A-E-I-O-U), key-tracked ring mod, Hilbert frequency shifter, crusher,
     3-band up/down "Squash". Movement: notch sweep / phaser / flanger (tempo synced).
   - Sub (bypasses FX), noise, Reese low cut, chorus, M/S width, mono-bass crossover, soft clipper.
   - 2 ADSRs, 2 LFOs (7 shapes, sync, retrigger, fade), 6-slot mod matrix (10 sources incl.
     Beat Phase, 24 destinations). Mono legato/retrigger, glide modes, bend, sustain pedal.
   - Custom scalable UI: knobs/dropdowns/segments, scope + throb meter, live filter curve, envelope
     and LFO previews, footer help, 20 presets, MUTATE (engine / mangle / modulation / all / nudge).
4. **Verification** (all in the harness; `tools/test_render.py` → FAILURES: 0):
   every engine × oversampling rate, all FX, all presets through the UI menu, silence after release,
   UI interaction scripts (drag, double-click reset, dropdown, wheel, preset menu, mutate), and
   **measured beat rates**: Hz mode 2/5 Hz constant across notes, tempo sync 1/4 @ 120 BPM = 2 Hz,
   cents mode scaling with pitch, stale-srate @init case.
5. **Bugs found and fixed** (all would also have happened in REAPER):
   - `NSTK` vs `nstk` case clash, causing stuck notes (EEL2 names are case-insensitive). The harness now errors on case clashes.
   - Legato clicks from instant velocity changes, fixed with smoothed velocity gain.
   - Stale filter/DC states at note start after silence, fixed by clearing the voice path when idle.
   - Engines sounding like a sine at A=0, fixed with per-engine A/B/C defaults when the engine is picked in the UI.
   - `engine_defaults()` used before `p_set()` was defined, a compile error in REAPER.
   - After reading the reference: `//tags:` was a comment (fixed to `tags:instrument`); srate-dependent
     constants in @init (stale with ext_noinit, moved to `update_params()` with srate-change detection);
     5-argument `gfx_rect` (JSFX takes 4); text clipping in `gfx_drawstr` boxes; fonts < 8 px;
     `gfx_getchar()` added for modifier keys; host notification switched to the `sliderX` form for all
     sliders; the harness now uses equal `&&`/`||` precedence.
6. **Performance**: decimators unrolled into instance variables, precomputed mod slots, and
   per-sample logs removed, giving about 3× faster (30–50× realtime in C at 2x oversampling).
7. **Presets** level-matched to about −14.5 dB RMS. A demo MP3 of all presets was rendered
   (`tools/make_demo.py`) and sent to the owner.
8. **Docs**: README (user manual), CLAUDE.md, docs/JSFX_NOTES.md, docs/DECISIONS.md, this log.

### Commits (branch `claude/reese-bass-plugin-fvsdw1`)
- `4a1795a` Add Reese Basser (plugin, harness, tests, README, screenshot)
- `e874771` Align with the JSFX programming reference
- `41592e2` project docs: CLAUDE.md, ADRs, session log, JSFX notes; preset count derived from the list

### Open items / next steps
- **Needs the owner to test in REAPER**: loading and compiling, the UI look (fonts differ from
  the harness), CPU use (estimated 5–10% of one core at 2x), automation recording from the custom
  UI (`slider_automate(sliderX, end_touch)`), and the Instruments-list entry.
- Possible upgrades: compact UI when embedded in the TCP/MCP (`gfx_ext_flags & 1`);
  `slider_next_chg()` for sample-accurate automation; `options:gfx_hz=60`; preset name saved via
  `@serialize`; more engines (e.g. wavetable / resampled-loop); a keyboard/scale helper; exporting
  the renders to REAPER with `export_buffer_to_project`.
- No PR has been opened (the owner hasn't asked for one).

## Session 2 (2026-09-24): first REAPER test

**Owner's report:** the plugin loads in REAPER (macOS, about 1.1% CPU while idle, no error), but the FX
window shows only the list of sliders and fields, with no custom GUI.

**Cause:** REAPER lays out visible sliders above the `@gfx` graphics area. With 100 visible
sliders the list fills the window and the UI sits below it, out of view. The harness renders `@gfx`
on its own, so it couldn't show this.

**Fix:** every slider name is now prefixed with `-` (hidden but still automatable, per the
JSFX reference). The transpiler errors if a plugin with `@gfx` has more than 8 visible sliders
(verified: the previous commit is rejected). ADR-011 records the decision, and the README,
CLAUDE.md and JSFX_NOTES are updated.

**Result:** confirmed in REAPER; the GUI shows and looks good.

### Session 2, part 2: feedback on the GUI in REAPER
**Report:** most text is very small; could parts of the UI go on separate pages (FX on another page,
mod matrix on its own)? Also, the mod matrix dropdowns flash constantly (slot 2 switching between
LFO and Mod Env, slots 3–6 between their source and "Off").

**Flashing, cause:** a thread race. @gfx (UI thread) looped over the matrix with the global `mi`,
which @sample (audio thread) also uses as a loop counter every sample, so each dropdown sometimes
drew another slot's value. **Fix:** UI loop variables renamed to `ui_*`. The transpiler now does a
call-graph analysis and rejects any global written by both @gfx and audio code (ADR-013). It
reports `mi` on the old code.

**Small text, fix:** the UI was redesigned into three tabbed pages on a 960×684 canvas (ADR-012):
SYNTH / MODULATION (with the full-width mod matrix) / FX + MANGLE. Knobs are bigger, fonts are
11–13 px logical (about 1.6× larger on screen), captions explain each section, and a mini scope sits
in the tab bar. Test/demo scripts use the new preset-box coordinates, and a UI test was added
(tabs, a knob drag on the FX page, a mod-matrix dropdown). Screenshots for all three pages are in docs/.
Version bumped to 1.1.

**Result:** the owner tested v1.1 in REAPER and reports it all working well: the pages
display, the mod matrix no longer flickers and the text is readable. No exact CPU figure was reported.
Docs updated and a carry-over prompt written for the next session.

---

## Current status (end of session 2)

- **v1.1 works in REAPER** (macOS, owner-tested): it loads under Instruments, the custom paged UI
  shows, and the sound and presets work. Branch `claude/reese-bass-plugin-fvsdw1`; no PR opened.
- The harness suite (`tools/test_render.py`) passes: all engines × oversampling, FX, 20 presets,
  beat-rate measurements, stale-srate @init, UI page test.
- **Open / unverified:** automation *recording* from the custom UI (`slider_automate(sliderX, end_touch)`)
  hasn't been specifically tested; exact CPU while playing is not measured.
- **Idea backlog** (none requested yet): compact embedded TCP/MCP view (`gfx_ext_flags & 1`);
  `slider_next_chg()` sample-accurate automation; save the current page and preset name via
  `@serialize`/hidden sliders; `options:gfx_hz=60`; more engines (wavetable, resampled loop);
  more presets; keyboard shortcuts for the pages; `export_buffer_to_project` to bounce a Reese
  straight into the project.


## Session 3 (2026-10-14): wording to Apple's writing guidelines (v1.1.1)

The user asked for every app's text to follow Apple's writing guidelines (ADR-014). Text only:
nothing about the sound, the layout or the sliders' numbers, order and ranges changed.

- Title-style: the Mutate menu ("Mutate Engine", "Mutate Mangle and Movement", "Nudge All
  (Subtle)"), slider names and enum labels ("Squash (Multiband)", "Cents (Tracks Pitch)"), the FX
  description ("Reese Basser — Reese Bass Synthesizer").
- Sentence case: subtitle, status ("Note 55.0 Hz", "Voice on · 2x oversampling"), every caption
  under a control, the footer ("Drag to adjust · Shift-drag for fine control · Double-click or
  Ctrl/Cmd-click to reset · Scroll to step"). "drag = adjust"-style shorthand written as words.
- Typography: em dashes in the engine descriptions and "Init — Classic Dual Saw", curly
  apostrophes and quotes ("Saunderson ’88 (CZ)", “Mod Env”), → in the signal flow and mod matrix.
- Two real fixes found on the way: "Sample & Hold" showed as a mnemonic in the LFO shape menu
  (`build_menu` now doubles `&`), and the list reader stopped at the first non-ASCII byte because
  `str_getchar` is signed (loops now stop on `!= 0`). The harness had hidden the second: its
  `str_getchar` was unsigned (now signed), and its C string literals used hex escapes that
  swallowed the "88" after "’" (now octal).
- Version 1.1.1 (header and footer). README presets and UI tips, and the three screenshots,
  re-rendered.

Verified: `tools/test_render.py` FAILURES: 0; all three pages rendered and looked at, nothing
clipped; the preset box shows "Saunderson ’88 (CZ)"; the menus read as above.


## Session 4 (2026-10-15): the rest of Apple's HIG Foundations (v1.2)

The user asked for the window to meet Apple's HIG "Foundations" in full, as Transient Shuffler
does (ADR-015, `docs/apple-hig-review.md`). Nothing about the sound changed; no slider was
renumbered (two new ones, 101 and 102, are window preferences).

**First, measure.** A checker (`tools/ui_checks.py`) was written to replay the harness's drawing
log and measure every string against what is drawn under it. Run on 1.1.1 it found 34 strings
under 7:1 on the Synth page alone: every caption and hint at 4.7:1, the footer 4.3:1, white on the
chosen switches 4.8–5.3:1, and the beat reading over the bright beat bar down to 2.1:1 (it
depends on the moment: the bar pulses, so the tests look at four moments). On the other pages
the blue, pink and purple titles were 5.7–6.6:1, the mod-amount reading 3.4:1, the mod matrix's
slot numbers 3.9:1.

**What changed, in a musician's terms:**
- Every word in the window is now easy to read: the grey captions are lighter, the coloured
  section titles are a lighter tint of their colour, the chosen switch segments are darker, and
  the beat reading sits on its own dark plate.
- **Options** (top right): Interface Size 100/125/150/200% or Fit to Window, and Reduce Motion,
  which holds the beat bar still. The window still grows when you make it bigger; made smaller
  than the chosen size it scrolls instead of shrinking the text.
- The whole window works from the keyboard: Tab, Shift+Tab, Return/Space, the arrows (Shift for
  finer), Delete to reset, Esc. A white ring shows where you are, and the line under the title
  says what it is and its value.
- The help line and readout moved from the bottom edge to under the title; the version is in
  the Options menu. Buttons, menus and switches are 28 tall with room between them; a chosen
  switch or tab also has a bar under it.
- The text is in the system's font (San Francisco, Segoe UI), else Arial.

**The harness** gained what the new code needs, each written from the JSFX reference's
description as carried in Transient Shuffler: multi-character key constants (`'rght'`),
`gfx_getfont` (with `JSFX_FONTS` standing for the faces a system has), `match`/`matchi`
(wildcards), `gfx_ext_flags`, and script commands `key`, `retina`, `extflags`, `dumpmem`,
`logframe <path>`. `render_gfx.py` became a reusable `replay()` (its PNGs are byte-identical).

**Tests** (`tools/test_render.py`, "HIG" sections): contrast and fit of 3,705 strings in 38 frames
(all pages, four beat moments, hovered and focused states, every engine, movement, detune and
phase mode); nothing under 10 px; nothing below y 664; the Tab order on each page (40, 45 and 35
controls, counted off the screen), one ring per press, wrapping; ring colour; heights ≥ 28;
spacing ≥ 12; the bar on every chosen switch and tab; Shift+Tab, Return, Space, arrows, Delete,
Esc, a click; interface size from the menu, 200% with scroll bars and the focus scrolled into
view, Retina (sharp, and in a smaller window), a small window, Fit to Window, the embedded view,
the wheel; the font with each face present or missing; Reduce Motion on and off, and remembered.

**Proving they bite.** 27 sabotages, each applied to a copy of the plug-in, never the working
tree (the batch script is in the session scratchpad), running only the HIG checks. 25 bit at
once. Two did not:
- *Grey text on a hovered tab*: it measures 7.05:1, so it was not a violation — an estimate of
  6.5 by hand was wrong. Paired with a lighter hover fill (5.8:1) it bites.
- *Retina ignored*: a real gap. The only Retina case was a window exactly twice the canvas, where
  fitting gives the same answer. A Retina window smaller than that must now still draw at 2x
  and scroll; with that case added it bites.

**Looked at**: all three pages at 100%, a focus ring on a switch, 200% scrolled to a focused
knob, and a Retina-sized render. The README screenshots were re-rendered.

**Not verified, only REAPER can say** (ADR-015): which keys REAPER passes to the window without
"Send all keyboard input to plug-in"; whether `gfx_getfont` names the real face on macOS; the
sideways wheel; how 125% and 150% look with REAPER's own font rasteriser; whether Esc is the
window's or REAPER's. Note that 1.1 already called `gfx_getchar()` every frame, so key handling
by REAPER is no different from what the user has already run.

## Current status (end of session 4)

- **v1.2 on `ccr-f2d9adc9-lanc9o`** (with 1.1.1), not yet run in REAPER. `tools/test_render.py`
  passes (FAILURES: 0).
- Ask the user, when they try it: does Tab move the white ring, do the arrows turn a knob, does
  the text look like their system's font, and does Options → Interface Size behave as described.

## Session 5 (2026-10-21): the final sweep of Apple's HIG Foundations (v1.3)

Every guideline left on the Foundations pages was taken back to its page and decided for this
window; the verdicts are in `docs/apple-hig-review.md` (*Final sweep*), the reasons in ADR-015's
dated note. Done after AutoCC's sweep (its commit `9773580`), doing the equivalent here.

**Measured first** (WCAG ratios at 100%): the edges of menus, switches, mod-amount bars and the
preset box were 1.7–2.4:1 on what is around them, the tabs' 1.6:1 (their fill is 1.1:1 off the
ground, so the edge is all that shows a tab); MUTATE's pink edge 2.7:1 on its own fill. The
knob arcs (4.4:1 or more on the panel, 3.1:1 or more on the track) and the scroll bar (4.0:1)
already passed. The beat bar pulsed at the beat's own rate, which Beat Hz lets reach 20 a second.

**Changed**
- `c_edge()` `#6D7581` for every framed control's edge and the mod bar's zero mark; buttons'
  coloured edges at 80%.
- A beat faster than 3 Hz holds the beat bar still; the still bar at half strength (3.7:1).
- The interface size fits the window's width, never below 100%: no sideways scrolling unless
  the window is narrower than 960 points. The Options hint says a larger size needs a wider
  window.
- A preset (menu, < or >) or a mutation goes through `ask_change()`: an undo point on the click,
  the change and a second undo point the next frame. The hints say Edit → Undo puts the sound
  back.
- The harness logs `sliderchange(-1)` as `[undo point]`; `test_render.py --hig` runs only the
  window's checks (2½ minutes).

**Checked by** ten new checks (`ui_checks.edges()` and `arcs()`, the help line for all 120 Tab
stops, every choice of seven menus, the flash and the still bar, four window widths at 200%, the
undo points for a preset and a mutation). Twelve sabotages, each in a scratch copy of the repo
(batch in the session scratchpad), running the window's checks. Eleven bit at once. One did not:
- *MUTATE's edge back at 60%*: my estimate of 2.9:1 had blended it over the window's ground,
  but it is drawn over the button's own fill, which lifts it to 3.2:1 outside — it passed. It is
  2.7:1 against the fill inside, so `edges()` now also measures a button's edge against its own
  fill (not the switches': a chosen segment's tint is itself the cue, with its bar), and then it
  bites.

**Looked at**: all three pages at 100% and 200% in a 1200-point window scrolled to a focused
control. The three README screenshots were re-rendered (the edges now show).

**Not verified, only REAPER can say**: that `sliderchange(-1)` from `@gfx` adds an undo point,
and what two of them a frame apart look like in REAPER's undo history; how the width-fitted
interface looks when the FX window is resized; everything still open from session 4 (keys,
the system font, 125%/150%).

## Current status (end of session 5)

- **v1.3 on `ccr-f2d9adc9-lanc9o`** (with 1.1.1 and 1.2), not yet run in REAPER.
  `tools/test_render.py` passes (FAILURES: 0).
- Ask the user, when they try it: after choosing a preset or a mutation, does Edit → Undo bring
  the old sound back in one step (or two)? At 200%, does the window fill its width without
  scrolling sideways? Plus session 4's questions (Tab, arrows, the font, Interface Size).
