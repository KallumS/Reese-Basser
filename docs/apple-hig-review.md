# Review against Apple's Human Interface Guidelines: Foundations

This review checks Reese Basser 1.2 against all 19 Foundations pages of Apple's Human Interface
Guidelines, read in October 2026 (the pages themselves are Apple's copyrighted text and are not
in this repository; each is at
`https://developer.apple.com/design/human-interface-guidelines/<page>`). The decision is
[ADR-015](DECISIONS.md#adr-015-the-window-follows-the-rest-of-apples-hig-foundations); the
wording was done earlier, in ADR-014.

Reese Basser draws its own window inside REAPER, so some guidance cannot apply. A JSFX cannot
reach macOS accessibility features (VoiceOver, Dynamic Type, Increase Contrast, the system's
Reduce Motion), cannot set its own window size, and cannot read the system's appearance. Where a
guideline could not be met for that reason, this review says so rather than counting it as met.

**Nothing here has been tried in REAPER yet.** It is checked by the offline harness
(`tools/test_render.py`, with `tools/ui_checks.py`), which draws the real `@gfx` code.

## What changed

| Guideline | Before (1.1.1) | Now (1.2) |
| --- | --- | --- |
| **Accessibility, Color, Dark Mode: contrast** | Secondary text (captions, hints, the readout) 4.7:1, the mod matrix's slot numbers 3.9:1, the footer 4.3:1. Section titles in blue, pink or purple 5.7–6.6:1 on their panels. White on a chosen switch 4.8–7.0:1, on a chosen tab 6.7:1, the mod amount over its fill 3.4:1, the beat reading over the bright beat bar down to 2.1:1. | Every line of text is at least 7:1 on what it sits on, Apple's target for small text in a dark window. Secondary text is `#B0B6C0`. Each section keeps its colour, but titles and values use a lighter tint of it measured to 7.2:1. Chosen fills are darker; the beat reading sits on its own dark plate; the mod-amount fill is dim with a bright edge. The suite measures every string in 38 frames. |
| **Accessibility, Typography: larger text** | The canvas grew with the window and also shrank with it, below 10 px in a small window. | **Options → Interface Size** 100%, 125%, 150% or 200% sets the smallest the contents are drawn; a smaller window scrolls instead of shrinking the text. The window still grows everything when made larger. **Fit Interface to Window** keeps the old behaviour for small dockers. Remembered with the project. |
| **Typography: system font, sizes** | Arial at 11–13 px. | The system font: San Francisco on a Mac, Segoe UI on Windows, checked with `gfx_getfont`, else Arial. Sizes 11–13 px logical (Apple's macOS default is 13 pt, its minimum 10 pt); nothing under 10 at 100%. |
| **Typography: keep truncation to a minimum** | Fitted by eye. | Every string is measured against the box it is clipped to, with 8% to spare for fonts wider than Arial. Engine and movement descriptions are checked in every variant. |
| **Accessibility: the keyboard alone** | Mouse only. | Tab and Shift+Tab move a visible focus ring through every control in reading order, page tabs and presets included. Return or Space presses a button or tab, opens a menu, steps a switch. The arrows turn a knob or a mod amount (Shift finer) and step menus and switches. Delete or Backspace resets a knob (the keyboard's double-click). Esc or a click lets go. The help line names the focused control and its value. |
| **Accessibility: control size and spacing** | Switches 22–24 tall, menus 24–26; the preset arrows 2 px from the preset box, tabs 6 apart, mod matrix columns 8 apart. | Buttons, menus, switches, bars and tabs are 28 tall (Apple's macOS default) with at least 12 between them. Knobs keep their own shape: a 38 px dial, a 56 × 72 target, 12 or more apart. |
| **Color, Accessibility: more than colour alone** | A chosen tab or switch segment was a different shade, and that was all. | A chosen switch segment carries a bar along its foot; the chosen tab a thick bar where the others have a hairline. |
| **Layout (macOS): nothing important at the bottom of a window** | The help line, the hovered value and the version sat along the bottom edge. | They moved to a second row under the title, with the note, beat and oversampling readout. The version is in the Options menu. |
| **Accessibility, Motion: Reduce Motion** | The beat bar pulses with the throb, up to several times a second. | **Options → Reduce Motion** holds it still. The scopes keep moving: they show the sound, which is information. |
| **Layout: scrolling content** | Not needed: everything shrank to fit. | When the window is smaller than the interface size, scroll bars appear at the edges; the wheel scrolls over any gap between controls, and the keyboard focus scrolls itself into view. |

## Already met

- **Purpose and hierarchy.** One instrument, three pages that follow the signal: Synth, then
  Modulation, then FX + Mangle. Panels group controls by stage, each with its colour and title.
- **Feedback.** Every control lights its edge or value as the pointer passes, the knob's value
  turns white while dragged, and the help line names what is under the pointer. The scopes and
  beat readout show the sound as it plays.
- **Every gesture has another way.** Dragging a knob: the wheel, or the arrows. Double-click to
  reset: Delete. Clicking a tab, a menu or a preset: Return or Space. Scrolling the window: the
  scroll bars, or Tab.
- **Agency and recovery.** Every change is a REAPER parameter, so REAPER's own Undo, automation
  and presets apply. Mutate only changes sound, never the window's preferences.
- **Writing** (ADR-014). Title-style names and buttons, sentence-case hints, a verb first where
  a control acts.
- **No time-boxed elements.** Nothing appears and disappears on a timer.
- **Dark Mode.** The window is always dark, as Apple allows for apps built around media; a JSFX
  cannot read the system's appearance.
- **Privacy.** Nothing is collected, stored outside the project, or sent anywhere.

## Not met, because a JSFX can't

- **VoiceOver, Voice Control and Switch Control** cannot read a window a JSFX draws itself.
  Every setting that changes the sound is a REAPER parameter, reachable through REAPER's FX
  parameter list — with the OSARA extension, for example.
- **Dynamic Type, Increase Contrast and the system's Reduce Motion** cannot be read by a JSFX.
  Interface Size, the 7:1 colours and the plug-in's own Reduce Motion stand in for them.
- **Setting the window's size.** A JSFX only suggests a size (`@gfx 960 684`); it cannot change
  it, so a larger interface size scrolls rather than enlarging the window.
- **Right to left.** A JSFX cannot be translated; the window is English only.
- **Keys REAPER keeps.** Without "Send all keyboard input to plug-in" (the FX window's **+**
  menu), REAPER may take some keys for its own shortcuts. The plug-in does not turn that option
  on, because it is played while REAPER's shortcuts are in use.

## Not relevant

These pages cover things this plug-in doesn't have: Materials (Liquid Glass), App icons, Icons
and SF Symbols, Images, Branding (beyond the name, kept small in the header), Spatial layout and
Immersive experiences (visionOS), Inclusion (no people or personal data in the window beyond
plain, direct wording).

## Checked by

- `tools/test_render.py` (the HIG sections) with `tools/ui_checks.py`: the contrast and fit of
  every string drawn on all three pages, while playing, at four moments of the beat, hovered and
  focused, in every engine, movement, detune and phase mode; the Tab order and ring on every
  page; control heights and spacing; the bar on every chosen switch and tab; arrows, Return,
  Space, Delete, Esc and a click; interface size, Retina, a small window, Fit to Window, the
  embedded view, the wheel and scrolling the focus into view; the system font with each face
  missing or present; Reduce Motion.
- Every rule above was broken on purpose in a copy of the plug-in and the suite watched to fail
  (`docs/SESSION_LOG.md`, session 4).
- The three pages, the focus ring and 200% were rendered and looked at.

What only REAPER can confirm is listed in ADR-015.

## Final sweep (21 October 2026)

Reese Basser 1.3. Every guideline the shared checklist marks as doable in a window a plug-in
draws itself was taken back to its Foundations page and decided for this window. Contrast is
WCAG's ratio at 100%, measured on the harness's drawing of the real `@gfx` code.

### Fixed now

| Guideline (page) | Before (1.2) | Now (1.3) |
| --- | --- | --- |
| Non-text contrast of controls (Accessibility ACC-11; Color; Dark Mode DRK-10) | The edges of the menus, switches, mod-amount bars and the preset box were dark greys, 1.7–2.4:1 on what is around them; the page tabs 1.6:1, on a fill only 1.1:1 off the ground. MUTATE's pink edge 2.7:1 on its own fill. | One edge colour, `#6D7581` from the house ramp (`c_edge()`): 3.6–4.0:1 on every fill, panel and the window's ground. Hover still lights the edge in the section's colour. Buttons' edges at 80% of their colour, so MUTATE's pink is 4.5:1 on the ground and 3.8:1 on its fill. The zero mark of a mod-amount bar is the edge colour too (was 2.6:1). |
| No flashing (Accessibility; Motion MOT-15; Color COL-26) | The beat bar pulsed at the beat's rate, up to 20 a second (Beat Hz goes to 20), across 576 × 24 points — at 200%, past the size where WCAG counts a flash. | A beat faster than three a second holds the bar still, as Reduce Motion does; the reading on it still says the rate. The still bar is drawn at half strength, 3.7:1 on its trough (was 2.4:1 under Reduce Motion). |
| Adapt to the window (Layout LAY-07, LAY-12) | An interface size the window could not hold scrolled both ways: at 200% in the default 960-point window, only the top-left quarter showed. | A larger size is drawn only as wide as the window allows, never below 100%, so the window scrolls up and down but never sideways. The menu still ticks the size chosen; its hint says a larger size needs a wider window. Only below 100% (a window narrower than 960 points) does it still scroll both ways. |
| Make mistakes cheap to recover from (Design principles DP-06; Accessibility ACC-43) | Choosing a preset (the menu, < or >) or a mutation replaced the sound at once. Whether REAPER's Undo could put it back depended on whether REAPER had kept an undo point for the knob tweaks before it. | The click adds an undo point (`sliderchange(-1)`, the JSFX way) before anything changes; the next frame makes the change and adds another. So **Edit → Undo** puts back the sound exactly as it was, tweaks included, and Redo brings the preset back. The hints of the preset box, < and > and MUTATE say so. Nothing asks first: browsing presets with < and > is the main use, and a question at every step would get in its way. |

### Already met

| Guideline | Why |
| --- | --- |
| Truncation (TYP-18, LAY-08/09) | No text is cut with "…" anywhere: every string is measured against its box. New in 1.3: the help line for every one of the 120 controls as Tab reaches it, and every choice of every menu (filter, both LFO shapes, distortion, movement, a mod slot's source and destination), are measured too. |
| Esc (house rule) | Esc lets go of the keyboard focus. The plug-in never closes its own window, and draws no popup to close. |
| Menus (Dark Mode DRK-14) | Every menu is REAPER's own (`gfx_showmenu`), drawn by the system. The plug-in draws no popup, tooltip or modal of its own, so no "lighter than the window" surface to set. |
| System font (Typography TYP-05/07/08) | `pick_font` asks for `.AppleSystemUIFont`, then Segoe UI, and keeps only what `gfx_getfont` says it got; Arial otherwise. One family; bold for titles. Tested with each face present and missing. |
| Reduce Motion (Motion MOT-01–06, MOT-13; Accessibility ACC-38–42) | The beat bar is the only decoration that moves, and Reduce Motion holds it still. The scopes, the level history and the mini scope show the sound — information, not decoration — and keep moving. The knobs' and edges' hover changes are instant, not animated. Nothing pulses slowly near a 5-second cycle unless the beat itself does, and then it is the sound's own rate. |
| Knob arcs (ACC-11) | The value arc is 4.4:1 or more on its panel and 3.1:1 or more on the track beside it in every section colour; the pointer is near-white. The track itself (1.4:1) is only the range the arc can fill, and is left faint so the arc stands out from it. |
| Colour never alone (ACC-02, ACC-16, COL-08/09) | Chosen switch segments and the chosen tab carry a bar; hover is not a state; a dimmed control (Unison under Supersaw) says why in words; "Voice on" / "Idle" and the preset's " *" are words. |
| Hit targets (ACC-22, ACC-24) | Buttons, menus, switches, bars and tabs 28 tall, 12 apart; the < and > buttons 28 × 28; a knob answers a 56 × 72 target. Nothing clickable is bare. |
| Text floor (ACC-08, TYP-01) | 11 points or more at 100%. |
| Every gesture has another way (ACC-26) | Drag: the arrows (Shift finer) or the wheel. Double-click or Ctrl/Command-click: Delete. Scroll bars: the wheel, or Tab. |
| Shortcuts (ACC-31) | Only Tab, Return, Space, the arrows, Delete and Esc, inside the window; `want_all_kb` stays off, so REAPER keeps its own. |
| Sound (ACC-21, ACC-35) | The plug-in only sounds when it is played; nothing plays by itself. The readout says "Voice on" or "Idle", the scopes show it. |
| No time limits (ACC-33) | Nothing appears or disappears on a timer. |
| Hover, pressed, disabled (DP-11) | Hover lights an edge or a value; a dragged knob's value turns white; disabled labels are dimmed and explained. Buttons act on the press, so there is no held state to show. |
| Words (Writing; Inclusion) | No "we", "Oops", "Click here" or idioms; every hint names its control; the new hints say what Undo does in REAPER's own words. |
| Scroll bar (ACC-11) | Its thumb is 4.0:1 on its track. |
| Window title (Branding) | REAPER's FX window names the plug-in; the plug-in cannot set it. |
| Dark only (DRK-04) | The house scheme; a media tool, which the Dark Mode page allows; a JSFX cannot read the system's appearance. |

### Not done, and why

| Guideline | Why |
| --- | --- |
| Panel frames and the knob track at 3:1 | A panel's frame only groups its controls, and each panel already has its coloured title bar; the track is discussed above. Neither is needed to see or use a control (WCAG asks it of what identifies a control or its state). |
| Show selection more softly when the window isn't key (COL-22) | A JSFX can ask whether its window has focus, but the harness cannot answer it, so it could not be checked; the chosen tab and switch segments stay true either way. |
| A minimum window size (LAY-20) | A JSFX cannot set one. Below 960 points wide the window scrolls, so nothing becomes unreachable. |
| Let people recolour (ACC-17, COL-07) | The house scheme is the user's decision. |
| VoiceOver, Dynamic Type, Increase Contrast, the system's Reduce Motion, appearance | Unchanged from 1.2: out of a JSFX's reach (see above). |

### Not relevant

Icons, SF Symbols, Images, App icons, Materials, Spatial layout, Immersive experiences, games,
right-to-left, localisation, a light page, zebra rows (the mod matrix has six rows, each a row
of framed controls).

### Checked by

`tools/test_render.py` gained ten checks, and `tools/ui_checks.py` `edges()` and `arcs()`: the
edge of every framed control on all three pages 3:1 on the ground outside it, a button's on its own fill too (62 controls); every
knob's value arc 3:1 on its panel and its track; the help line for every control Tab reaches,
and every choice of every menu, inside its box; a beat of 6 Hz holding the bar still, and the
still bar 3:1 on its trough; 200% drawn as wide as a 960, 1440 or 1920-point window and
scrolling only up and down, and growing past 200% in a larger one; a preset and a mutation each
adding an undo point before the sound changes and another after (the harness logs
`sliderchange(-1)`). Each was broken on purpose in a copy of the plug-in and the suite watched
to fail (`docs/SESSION_LOG.md`, session 5). The three pages and 200% in a 1200-point window were
rendered and looked at.
