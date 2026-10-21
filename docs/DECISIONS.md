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
for A/B/C are generic ("Engine A") in automation lists.

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
in REAPER. The owner reports v1.1 running well in REAPER (session 2); no exact figure yet.

## ADR-007: The custom UI is immediate-mode on a scaled logical canvas

**Decision:** A logical canvas scaled to fit the window (originally 1200×810, one page; see ADR-012). Widgets draw and handle input
in the same call. Parameters are edited through `p_set()` (records automation) and presets/mutate
use `p_put()` (only `sliderchange`). UI edits set `ui_dirty`, and `@block` runs `update_params()`
because `@slider` does not fire for code-side changes. Every parameter stays a real slider, so
automation, parameter modulation and MIDI learn all work (see ADR-011 for why the sliders
are hidden from the plain slider view).
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

## ADR-011: Hide every slider from the plain slider view

**Status:** accepted (session 2)
**Context:** First test in REAPER (macOS, 7.x): the FX window showed only the slider list and
no custom UI. REAPER draws visible sliders **above** the `@gfx` area, and 100 rows push the
graphics out of the window.
**Decision:** Prefix every slider name with `-` (documented: hidden from the plug-in UI but
still active and automatable). The custom UI is the only in-window editor. The transpiler now
refuses a plugin with `@gfx` and more than 8 visible sliders, so this can't come back.
**Consequences:** No generic-slider fallback inside the plugin window. Parameters stay reachable
through automation envelopes, the Param button, parameter modulation and MIDI learn. If a future
version wants a few visible sliders (e.g. a compact mode), keep the count small.

## ADR-012: Paged UI (Synth / Modulation / FX + Mangle), larger controls

**Status:** accepted (session 2)
**Context:** In REAPER on macOS the single-page 1200×810 layout rendered most text at about 9–10 px,
which is too small. The owner asked for panels/pages, e.g. FX on another page and the mod matrix on its own.
**Decision:** A 960×684 logical canvas with three tabbed pages: **SYNTH** (engine, beat meter, filter,
sub/noise, play/output, big scope), **MODULATION** (envelopes, LFOs, 6-row mod matrix),
**FX + MANGLE** (distortion, movement, mangle, stereo, plus a mini scope in the tab bar). Knobs are
66×74 with r=19, and base fonts went from 9.5–12 to 11–13 px logical (about 1.5–1.6× larger on screen
in the same window). The current page is `ui_page` and is not saved with the project.
**Consequences:** Fewer controls on screen at once, with room for explanatory captions. New
controls should go on the page that matches their signal-flow stage. Test scripts click by logical
coordinates at scale 1 (preset box at 450,24; tabs at y 66).

## ADR-013: @gfx must not share writable globals with audio code

**Status:** accepted (session 2)
**Context:** REAPER runs @gfx in its own thread. The mod-matrix drawing loop used the global `mi`,
which @sample also uses every sample as a loop counter, so the UI read the wrong slots and the
dropdowns flickered between values. The single-threaded harness couldn't show this.
**Decision:** UI globals use the `ui_` prefix. The transpiler computes, through the call graph, which
globals @gfx writes and which @block/@sample/@slider write, and fails on any overlap except the
intended `ui_dirty` flag.
**Consequences:** This class of race is caught before it ships. Reading audio variables from @gfx
(scope, beat phase, f0) is still allowed, since those are display-only and may be slightly stale.

## ADR-014: The window's text follows Apple's writing guidelines

**Status:** accepted (session 3, 2026-10-14)
**Context:** The user asked for every app's text to follow Apple's Human Interface Guidelines on
writing (developer.apple.com/design/human-interface-guidelines/writing), as done for Noterator and
Miderator (Noterator's decision 0053). The window mixed lower-case captions ("never reset",
"route it in the mod matrix"), programmer shorthand ("drag = adjust", "->", "1x = light CPU"),
" - " for dashes and straight quotes.
**Decision:** Names, menu items, slider names and preset names in title-style capitalization, a verb
first where they act ("Mutate Mangle and Movement", "Nudge All (Subtle)", "Squash (Multiband)").
Captions, hints, the status line and descriptions in sentence case; complete sentences end with a
full stop, fragments do not. Em dashes between phrases, curly quotes and apostrophes ("Saunderson
’88 (CZ)", “Mod Env”), arrows in the signal flow. Modifier keys are spelled out in running text
("Shift-drag", "Ctrl/Cmd-click"), since the plugin runs on Windows too. Panel titles, tabs and knob
captions keep their capitals, a deliberate look; abbreviations that are there for width (RESO, UNI
DET, Retrig) stay.
**Consequences:** No slider renumbered, reordered or re-ranged; enum lists keep their order, only
their words changed. Loops over strings stop on `!= 0`, because `str_getchar` is signed and the
first byte of "—" reads below 0; the harness's `str_getchar` is signed now too, so it would catch
that. Popup menus double `&`. New text follows the same rules; render the pages to check it fits.

## ADR-015: The window follows the rest of Apple's HIG Foundations

**Status:** accepted (session 4, 2026-10-15). **Not yet run in REAPER.**
**Context:** After the wording (ADR-014) the user asked for the rest of Apple's Human Interface
Guidelines "Foundations" — the standard their plug-in Transient Shuffler already meets (its
decision 0010), and the ReaImGui family's (Midi Suggester 0009 and the rest). Checked against
the 19 Foundations pages (`docs/apple-hig-review.md`), the window fell short (measured by the
new checker on 1.1.1): secondary text 4.7:1, the mod matrix's slot numbers 3.9:1, the footer
4.3:1, section titles in blue, pink or purple 5.7–6.6:1 on their panels, white on a chosen
switch 4.8–7.0:1, the mod amount over its fill 3.4:1, the beat reading over the bright beat bar
down to 2.1:1; the help line at the bottom edge;
no keyboard use at all; Arial everywhere; switches 22–24 tall and some controls 2–8 apart; a
chosen tab or switch told apart by colour alone.
**Decision:**
- **Contrast.** Every line of text at least **7:1** on what it sits on (Apple's target for small
  text; its floor is 4.5:1). Secondary text `#B0B6C0` (`c_sec`). The accents stay, but
  `accent()` also makes a **text tint** of each, lightened toward white until it reads 7.2:1 on a
  panel, for titles and values. Chosen switches and tabs are filled with the accent at 35%
  (was 55% and 45%); the mod-amount bar's fill is dim with a bright edge; the beat reading sits
  on a dark plate. Disabled labels (`c_dis`) are exempt, as Apple allows.
- **Interface size**, Options → 100/125/150/200%. The canvas already grew with the window, so
  the size is the **smallest it may be drawn** (times `gfx_ext_retina`): larger windows still
  scale it up, a smaller window scrolls (scroll bars, the wheel over a gap, the keyboard focus
  scrolled into view) instead of shrinking the text below its size. **Fit Interface to Window**
  keeps the old always-shrink behaviour for small dockers, and the view embedded in a track
  panel (`gfx_ext_flags & 1`) always fits. A JSFX cannot set its own window size, so "a size
  that sets the window" was not possible.
- **Remembered as hidden sliders 101 and 102** (*Interface Size*, *Reduce Motion*), appended per
  ADR-010. Sliders, not `@serialize`: the plugin has no `@serialize` (adding one changes when
  memory is cleared), sliders are what the harness models, and a screen reader can reach them.
  The cost: they are per instance, saved in REAPER presets, and listed among the parameters.
  The built-in presets and Mutate only touch 1–100.
- **System font**: `pick_font()` asks for `.AppleSystemUIFont`, then `Segoe UI`, and reads back
  what `gfx_getfont` gave; anything else is Arial. The Mac face is tried first because a system
  without it hands back a substitute either way, while a Mac might echo a name it does not have.
  Sizes unchanged (11–13 px logical, 27 for the name), so nothing under 10 at 100%.
- **Controls**: buttons, menus, switches, bars and tabs **28 tall, at least 12 apart**. Knobs are
  their own shape — a 38 px dial, hit area 56 × 72, 12 or more apart — so they keep their size.
- **The keyboard alone**: every control registers in a focus list as it is drawn, so Tab and
  Shift+Tab follow reading order (header, tabs, then panel by panel). A near-white ring
  (`#F2F4F7`, never an accent) marks the focus; Return/Space press or open; arrows nudge (Shift
  finer) or step; Delete/Backspace reset (the keyboard's double-click); Esc or a click lets go.
  The help line names the focused control and its value. `want_all_kb` stays off: this is a
  played instrument and REAPER's shortcuts must keep working.
- **Not colour alone**: the chosen segment of a switch carries a bar along its foot; the chosen
  tab a thick bar where the others have a hairline.
- **Nothing at the bottom**: the footer's help line and readout moved to a second header row
  (pages drawn 10 lower); the version moved into the Options menu.
- **Reduce Motion** (Options) holds the pulsing beat bar still. The scopes are left moving: they
  show the sound, which is information, not decoration. No messages are time-boxed (there are
  none on a timer).
**Consequences:**
- New code: every size in logical units through `ui_s` (the primitives `RF`/`TX`/... do this);
  every control calls `focusable()` and draws `focus_ring()`; every text colour is `c_text`,
  `c_sec`, an accent's tint or measured at 7:1; controls 28 tall and 12 apart. The suite checks
  each of these on every page (`tools/ui_checks.py`).
- **Not met, because a JSFX can't**: VoiceOver, Voice Control and Switch Control cannot read a
  window a JSFX draws itself — every setting is a REAPER parameter, reachable through the FX
  parameter list (with OSARA, for example). A JSFX cannot read Dynamic Type, Increase Contrast or
  the system's Reduce Motion setting, so Interface Size and the plugin's own Reduce Motion stand
  in. It cannot be translated or mirrored for right-to-left languages.
- **Unverified in REAPER**: whether REAPER passes Tab, the arrows, Return, Space and Esc to the
  window without "Send all keyboard input to plug-in"; whether `gfx_getfont` names the face the
  system really gave (on macOS especially); `mouse_hwheel` for sideways scrolling; how the
  canvas looks at 125%/150% with REAPER's font rasteriser. The harness measures text with
  Liberation Sans (Arial's metrics) plus 8% for wider system fonts.

**Final sweep, 21 October 2026 (1.3).** Every guideline left on the Foundations pages was
decided for this window (`docs/apple-hig-review.md`, *Final sweep*). Four changes:
- **Edges 3:1.** Menus, switches, mod-amount bars, the preset box and the tabs share one edge
  colour, `c_edge()` `#6D7581` (3.6–4.0:1 on every fill and ground; they were 1.6–2.4:1); a
  button's coloured edge is drawn at 80% (MUTATE's pink was 2.7:1 on its own fill, now 3.8:1). Panel frames and the knob
  track stay faint: they group or show a range and identify nothing.
- **No flashing.** A beat faster than 3 Hz holds the beat bar still, as Reduce Motion does
  (WCAG's three flashes a second); the still bar is at half strength, 3.7:1.
- **Interface size fits the width.** A size the window is too narrow for is drawn as wide as the
  window, never below 100%, so it scrolls up and down but not sideways. This amends the
  decision above that a smaller window scrolls rather than shrinking: it still does, below 100%,
  and vertically at any size; at 200% in the default window the whole width now shows. The
  menu keeps the size chosen; a wider window brings it back.
- **Undo for presets and Mutate.** The click adds a REAPER undo point (`sliderchange(-1)`), the
  change is made in the next frame, then another point; Edit → Undo puts back the sound as it
  was. Nothing asks first, because stepping through presets is the main use. A side effect:
  REAPER's undo history shows two entries per preset or mutation.
**Unverified in REAPER**: that `sliderchange(-1)` from `@gfx` adds the undo point (the JSFX
reference says so; the harness only logs the call), and how two of them a frame apart appear
in REAPER's undo history.
