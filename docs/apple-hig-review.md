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
