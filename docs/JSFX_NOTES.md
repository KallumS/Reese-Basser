# JSFX / EEL2 notes (verified)

A condensed summary of facts checked against the JSFX Programming Reference and the
REAPER 7.79 User Guide, both supplied by the project owner in session 1. Only facts
that matter for this project are listed. "✔ used" means Reese Basser relies on it.
Where a behaviour has already caused a bug, it is marked ⚠.

## File structure
- `desc:` once, first line. `tags:` is a real directive, **not a comment**. With `tags:instrument`
  (6.74+) the plugin appears under *Instruments* in the FX browser. ⚠ (was `//tags:` in v1) ✔ used
- `sliderN:var=def<min,max,step{a,b,c}>Name`: up to **256** sliders. Enum lists need min 0 / step 1.
  A `-` prefix on the name hides the slider. Shapes (6.74+): `:log`, `:log=mid`, `:sqr`, `:sqr=exp`;
  `:log!`/`:sqr!` keep automation compatible. Changing a slider's shape later affects saved automation. ✔ used
- `in_pin:none` means no audio inputs (an optimisation for instruments). ✔ used
- `options:gfx_hz=60` (6.44+) requests a faster @gfx rate. `options:no_meter`, `options:maxmem=N`
  (default about 8M slots, max 128M).
- `import file.jsfx-inc` imports functions from @init. Not used: the plugin is deliberately a single file.

## Sections
- `@init`: runs on load, on samplerate change and on playback start. Variables and memory are
  **zeroed before @init** (unless a non-empty `@serialize` exists).
- `ext_noinit = 1` (set in @init) stops those re-runs, but then **`srate` may be wrong in @init**,
  so check for srate changes in @block/@slider. ⚠ ✔ handled by `update_params()` + `last_srate`
- `@slider` runs after @init and when a parameter changes from the host. **It does not run when
  code changes a slider**, so the UI sets `ui_dirty` and `@block` applies it. ✔ used
- `@block`: `samplesblock`, `tempo`, `play_state`, `beat_position` (at block start, in quarter notes). ✔ used
- `@gfx [w h]` runs about 30×/s **in another thread** from audio. The size is a hint; use `gfx_w/gfx_h`.
- `@serialize`: extra state via `file_var(0,x)`/`file_mem`. Sliders are saved automatically. Not used.

## Language
- Variable **names are case-insensitive** (max 127 chars, may contain `.`). ⚠ `NSTK`/`nstk` bug.
- Precedence (high→low): `[]`, unary `! - +`, `^`, `% << >>`, `/`, `*`, `-`, `+`, `| & ~` (**equal**,
  left→right), comparisons, `|| &&` (**equal**, left→right), `?:`, assignments. Parenthesise mixes.
- `==`/`!=` are fuzzy (|a−b| < 1e-5); `===`/`!==` are exact.
- `%` uses the absolute values converted to integers. `<<`/`>>` work on 32-bit values.
- Memory `a[b]` is at `floor(a + b + 0.00001)`, about 8M slots. `gmem[]` is shared between plugins.
- `loop(n, code)`; `while(code)` (do-while on the last value); `while(cond) (code)` (4.59+).
  Both are capped at about 1M iterations.
- `x ? a : b`, and `x ? a` with no else. A `(a; b; c)` block evaluates to its last value.
- Hex: `0x90` or `$x90`; `$'c'` is a char code; `$pi`, `$e`, `$phi`.
- No `tanh`. Use `sat()` (a clamped Padé approximation) in the plugin.

## User functions
- Define at top level, in any section. Ones defined in `@init` are usable everywhere; ones defined
  in other sections are local to that section.
- **Can only call functions declared before them** (no recursion). 0–40 parameters, separated by
  commas or spaces. ⚠ `engine_defaults()` was once defined before `p_set()`.
- `local(a b)` variables persist between calls, separately per section. Parameters are by value.
- `instance(x)` or `this.x`: `obj.f()` makes `x` resolve to `obj.x`. A plain `f()` uses `f` as the
  namespace. `this..x` goes up one level. Namespaces can be passed as parameters: `function f(src*)`
  then `src.value`.

## Sliders / host
- `slider(i)` reads and writes by index (`slider(i) = v` is valid). ✔ used
- `sliderchange(mask or sliderX)` refreshes the UI without automation. Called from @gfx with −1 it
  adds an undo point.
- `slider_automate(mask or sliderX[, end_touch])` records automation. `end_touch=1` (6.74+) ends a
  touch session. The mask is bit 0 = slider1. **The plugin passes the slider variable**
  (`slider_automate(cutoff)`) for all 100 sliders via a generated dispatch. ✔ used
- `slider_show(mask or sliderX[, value])` (6.30+) hides or shows sliders.
- `slider_next_chg(i, nextval)` (5.0+) gives sample-accurate automation points. Not used yet (possible upgrade).

## MIDI
- `while (midirecv(ofs, m1, m2, m3)) (...)`: once you call midirecv you must read **all** events
  and `midisend` whatever should pass through. SysEx passes through automatically. ✔ used (consumes all)

## Strings
- Literals are immutable numbers usable as variables (`x = "text"`, stored in memory too). Slots
  0–1023 are mutable; `#name` strings are mutable and persistent; bare `#` is a temporary.
  `#s = "a"` is strcpy and `#s += "b"` is strcat. ✔ used
- `strcpy/strcat/strlen/strcmp/strncpy/strcpy_substr(dst,src,ofs,maxlen)/str_getchar(s,i[,type])`
  (signed char by default), `str_setchar`, `strcpy_fromslider(dst, sliderX)` (gets the enum label).
- `sprintf` supports `%s %d %i %u %x %X %c %f %e %g`, flags `+ - 0`, width and precision, and `%%`.

## Graphics (@gfx only)
- `gfx_set(r,g,b,a)`, `gfx_rect(x,y,w,h)` (**4 args, always filled**; ⚠ v1 passed a 5th),
  `gfx_line(x,y,x2,y2[,aa])`, `gfx_circle(x,y,r[,fill,aa])`, `gfx_arc(x,y,r,a1,a2[,aa])` (radians;
  the plugin assumes 0 = up, clockwise), `gfx_roundrect(x,y,w,h,r[,aa])` (outline),
  `gfx_triangle(x1,y1,x2,y2,x3,y3,...)` (filled convex).
- `gfx_setfont(idx 1..16, face, size 8..100, flags)`, where flags is a multi-char code
  (`'b'` = 98 for bold).
- `gfx_drawstr(str[,flags,right,bottom])`: 1 = centre h, 2 = right, 4 = centre v, 8 = bottom,
  256 = no clipping. **Otherwise the text is clipped to the box.** ⚠
- `gfx_showmenu("a|!checked|#grey|>sub|<last||after separator")` returns a 1-based index (0 = none)
  and opens at `gfx_x/gfx_y`.
- `gfx_ext_retina = 1` in @init enables HiDPI. On macOS `gfx_w/h` double; elsewhere it is just a
  hint. `gfx_ext_flags & 1` means the UI is embedded in the TCP/MCP.
- `mouse_x/y`; `mouse_cap`: 1 L, 2 R, 4 Ctrl/Cmd, 8 Shift, 16 Alt, 32 Win/Ctrl(mac), 64 middle.
  **Modifiers only update when not captured if `gfx_getchar()` has been called.**
  `mouse_wheel` moves in steps of ±120 per notch; the script must reset it to 0.
- `time_precise()` gives a high-resolution clock (used for double-click detection).

## REAPER user guide bits relevant to users
- Install: copy the file to the resource path's `Effects/` folder (sub-folders are fine) and
  restart REAPER (or refresh the FX browser). Remove any `.txt` extension.
- FX browser → FX menu has Edit JS FX / Duplicate / Create new, so users can edit the source directly.
- Any JSFX slider can use REAPER's **Parameter Modulation** (LFO, audio/sidechain follower,
  MIDI link) and **FX Parameter MIDI Learn** (user guide ch. 19 and §12.17). That comes free
  with our 100 sliders.
- JSFX UIs can be shown embedded in the TCP/MCP (right-click the FX: *Show embedded UI*). Our UI
  scales to fit but is not designed for that tiny size (possible upgrade: a compact layout when
  `gfx_ext_flags & 1`).
