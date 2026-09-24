# Architecture Decision Records

Each record gives the context, the decision and its consequences. Newest last. Add a new ADR
when a decision would surprise a future contributor, rather than editing an accepted one.

---

## ADR-001: JSFX rather than CLAP/VST

**Status:** accepted (session 1)
**Context:** The owner works in REAPER and asked for "JSFX or CLAP, whatever works best". A CLAP
plugin needs a C++ toolchain per OS, binary distribution and a rebuild for every change. A JSFX
is a text file that REAPER compiles on load, runs on all platforms, can be edited in REAPER, and
can draw a custom UI.
**Decision:** Build a single-file JSFX (`ReeseBasser.jsfx`).
**Consequences:** It only works in REAPER (or JSFX hosts such as ysfx). Performance depends on the
EEL2 JIT, which is slower than native C++, so DSP is written with CPU in mind (ADR-006). No
installer is needed: copy one file.

## ADR-002: One mono voice with multiple "engines"

**Context:** Reese basses are monophonic, legato and glided. The guides describe many different
methods (detuned saws, unison stacks, PWM, the CZ phase-distortion original, filter/phaser
movement, FM/audio-rate modulation).
**Decision:** A monophonic synth with a last-note-priority note stack and **8 selectable engines**
that share one control surface: DETUNE + three engine-specific controls A/B/C (labels, value
formatting and UI defaults change per engine) + unison/spread/drift.
**Consequences:** One voice keeps CPU low and allows expensive per-voice processing (oversampling,
Hilbert shifter, multiband). No polyphony, which is intentional for a Reese specialist. Slider names
for A/B/C are generic ("Engine A") in REAPER's generic UI.

## ADR-003: Detune modes built around the beat (Cents / Hz / Tempo Sync)

**Context:** The Reese character comes from the beat rate Δf between detuned oscillators. Normal
synths only offer cents, so the throb speeds up on higher notes.
**Decision:** Three detune modes. **Cents** is classic. **Hz** keeps Δf constant on every note.
**Tempo Sync** sets Δf to a tempo division and, on each new note, sets the pair's relative phase
from `beat_position`, so the throb lines up with the grid. The beat phase is also exposed as a
modulation source.
**Consequences:** This is the plugin's distinctive feature. The tests measure the beat rate
directly (Hz, sync and cents scaling). PWM/Phaser engines use the beat rate as their LFO rate
instead of detuning.

## ADR-004: Oversample only the nonlinear voice core

**Context:** Saw stacks and heavy drive/sync alias badly at 44.1/48 kHz.
**Decision:** Oscillators use PolyBLEP. The engine → filter → distortion core runs at 1x/2x/4x
(user choice, default 2x) and is decimated with **elliptic IIR filters** (2x: 10th order, 4x: 11th
order, 0.1 dB ripple to 0.45 fs, >90 dB at 0.55 fs), coefficients designed offline with scipy and
unrolled into instance-variable functions. The mangle/FX chain after the VCA runs at the base rate.
**Consequences:** Good aliasing performance where it matters at moderate cost. The crusher
aliasing is deliberate. The phase response of IIR decimation is irrelevant for a bass synth.

## ADR-005: An offline JSFX→C harness instead of testing in REAPER

**Context:** The dev container has no REAPER, and GitHub (apart from this repo) and cockos.com
are blocked, so an existing JSFX host (ysfx) could not be fetched.
**Decision:** Write `tools/jsfx2c`: a strict EEL2 parser that transpiles to C (GCC statement
expressions), a runtime that renders MIDI scripts to WAV and logs `@gfx` calls, and a PNG renderer.
The transpiler follows the documented semantics (case-insensitive names, equal `&&`/`||`
precedence, define-before-use, documented argument counts, fuzzy `==`, memory rounding).
**Consequences:** It caught real bugs that REAPER would have hit (case-clash stuck notes, a
function used before definition, a 5-argument `gfx_rect`). It is not REAPER: API behaviour the
harness doesn't model (automation writing, fonts, JIT speed) still needs checking in REAPER.

## ADR-006: Performance rules for the DSP

**Context:** EEL2 variables and memory accesses cost more than in C. The first build ran about 14×
realtime in C at 2x oversampling, which would be too heavy in EEL2.
**Decision:** Compute rate/parameter-dependent coefficients in `update_params()`. Keep per-sample
transcendental maths to what modulation needs. Use instance variables instead of memory arrays in
hot filters (the decimators went from memory to unrolled code, about 3× faster). Precompute an
active mod-slot list. Skip the voice core entirely when the amp envelope is idle, and clear its
states then.
**Consequences:** About 30–50× realtime in the C harness at 2x. Expect roughly 5–10% of one core
in REAPER (unmeasured; see the session log's open items).

## ADR-007: The custom UI is immediate-mode on a scaled logical canvas

**Decision:** `@gfx 1200 810` logical canvas scaled to fit the window. Widgets draw and handle input
in the same call. Parameters are edited through `p_set()` (records automation) and presets/mutate
use `p_put()` (only `sliderchange`). UI edits set `ui_dirty`, and `@block` runs `update_params()`
because `@slider` does not fire for code-side changes. Every parameter stays a real slider, so
REAPER's generic UI, automation, parameter modulation and MIDI learn all work.
**Consequences:** Host notifications use the documented `sliderX` form through a generated
100-way dispatch (`notify()`/`automate()`), not bit masks. The layout is fixed-proportion, so the
TCP-embedded view is tiny.

## ADR-008: Sub bypasses FX, mono-bass crossover, Reese low cut

**Context:** Every guide stresses a mono, clean sub with width and distortion only above ~120 Hz.
**Decision:** A dedicated sub oscillator added after all FX. A 24 dB HPF ("Low Cut") on the Reese
layer only. A mono-bass crossover (LR-style, complementary) summing everything below N Hz to mono.
**Consequences:** Wide, distorted Reeses stay mono-compatible by default (Mono < 120 Hz).

## ADR-009: Presets live in code and are level-matched

**Decision:** 20 presets defined as `pv()` diffs from defaults in `load_preset()`, chosen from the UI.
Each is level-matched to about −14.5 dB RMS on the test riff. Picking an engine in the UI loads
engine-specific A/B/C defaults (`ENGDEF`); presets reset A/B/C to engine 0's defaults first. User
patches use REAPER's own preset system and project state.
**Consequences:** The preset name isn't saved with the project (the UI shows "Custom / Project
Patch" after reload). Adding a preset means appending its name to `PRESETS` and a branch to
`load_preset()` (`NUM_PRESETS` is derived from the list); also bump the preset count in
`tools/test_render.py` / `tools/make_demo.py`.

## ADR-010: Never renumber sliders

**Decision:** Slider indices 1–100 are frozen. New parameters go at 101+ (the limit is 256). Enum
item order is also frozen; append new items at the end.
**Consequences:** Saved projects, automation and user presets stay valid across versions.
