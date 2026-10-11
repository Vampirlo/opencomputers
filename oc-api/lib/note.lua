---@meta

---The note library (`require("note")`): converts between note names, MIDI codes and frequencies,
---and plays notes with `computer.beep`. Note names are a letter, an optional `#` or `b` and an octave,
---e.g. `"A4"`, `"C#3"` or `"Gb2"` (case-insensitive), from `A0` (MIDI code 21) to `B6` (95).
---@class notelib
local note = {}

---Converts a note name (e.g. `"A#4"`, `"Gb3"`) or a frequency in Hz into a MIDI code.
---Raises an error for an invalid note name.
---@param n string|number note name or frequency
---@return integer midi
function note.midi(n) end

---Converts a note name (e.g. `"A#4"`) or a MIDI code into a frequency in Hz.
---Raises an error for an invalid note name.
---@param n string|number note name or MIDI code
---@return number frequency
function note.freq(n) end

---Converts a MIDI code into a note name, e.g. `69` into `"A4"` (semitones are named with `#`).
---For a frequency use `note.name(note.midi(frequency))`. Raises an error for codes outside 21-95.
---@param n number MIDI code
---@return string name
function note.name(n) end

---Converts note block ticks (0-24) into MIDI codes (34-58) and vice versa.
---Raises an error for values outside both ranges.
---@param n number ticks or MIDI code
---@return integer
function note.ticks(n) end

---Plays a note through `computer.beep`.
---@param tone string|number note name or MIDI code
---@param duration? number duration in seconds (default: that of `computer.beep`)
function note.play(tone, duration) end

return note
