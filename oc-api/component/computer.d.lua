---@meta

---A computer's machine: computer cases, servers, robots, drones, tablets and microcontrollers.\
---Can be used by the computer itself or by computers next to it.\
---Not to be confused with the `computer` API (`require("computer")`).\
---Component type: `computer`.
---@class ComponentComputer : Component
local computer = {}

---Starts the computer. Returns `true` if the state changed, i.e. `false` if it was already running.\
---If the computer is currently shutting down, this makes it reboot instead.
---@return boolean changed
function computer.start() end

---Stops the computer. Returns `true` if the state changed, i.e. `false` if it was already stopped.
---@return boolean changed
function computer.stop() end

---Returns whether the computer is running.
---@return boolean running
function computer.isRunning() end

---Plays a tone, useful to alert users via audible feedback.\
---`frequency` is in Hz (20-2000, default 440), `duration` in seconds (0.05-5, default 0.1).\
---Alternatively pass a single string of `.` and `-` to play a pattern of short and long beeps, e.g. `"-.."`.
---@param frequency? number|string Frequency in Hz, or a beep pattern string.
---@param duration? number Duration in seconds.
function computer.beep(frequency, duration) end

---Collects information on all connected devices, as a table mapping component addresses to device info tables\
---(with string keys such as `class`, `description`, `vendor`, `product`, `capacity`, `width`, `clock`).
---@return table<string, table<string, string>> devices
function computer.getDeviceInfo() end

---Returns the known programs and the loot disks that provide them, as an array of `{programName, diskLabel}` pairs.
---@return string[][] locations
function computer.getProgramLocations() end
