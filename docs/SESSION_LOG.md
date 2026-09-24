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

**Still to confirm in REAPER:** the custom UI appears and fits the window; fonts and layout;
knob/automation behaviour; CPU while playing.
