---@meta

---Information about the computer the code runs on (address, memory, energy, uptime), signals, users and power.\
---In OpenOS this is a module: `local computer = require("computer")` (there is no global `computer`).
---@class computerlib
local computer = {}

---Returns the component address of this computer.
---@return string address
function computer.address() end

---Returns the component address of this computer's temporary file system (mounted at `/tmp` by OpenOS),
---or `nil` if the computer has none (disabled in the config).
---@return string address
function computer.tmpAddress() end

---Returns the amount of unused memory, in bytes. When it gets close to zero the computer will soon crash with an out of memory error.
---@return integer bytes
function computer.freeMemory() end

---Returns the total amount of memory installed in this computer, in bytes.
---@return integer bytes
function computer.totalMemory() end

---Returns the amount of energy currently available in the computer's network. For robots and drones: their own energy buffer.
---@return number energy
function computer.energy() end

---Returns the maximum amount of energy that can be stored in the computer's network. For robots and drones: the size of their internal buffer.
---@return number energy
function computer.maxEnergy() end

---Returns the time in seconds the computer has been running, based on world time (it doesn't advance while the game is paused).
---@return number seconds
function computer.uptime() end

---Shuts the computer down, or reboots it if `reboot` is `true`. Does not return.\
---OpenOS first pushes the `shutdown` signal and sleeps 0.1 s so that listeners can clean up.
---@param reboot? boolean
function computer.shutdown(reboot) end

---Returns the address of the file system the computer tries to boot from first (stored in the EEPROM's data by the Lua BIOS).
---@return string address
function computer.getBootAddress() end

---Sets the address of the file system the computer tries to boot from first. `nil` or no argument clears it.
---@param address? string
function computer.setBootAddress(address) end

---(OpenOS) Returns the current runlevel: `"S"` while booting (single-user, nothing initialized yet), `1` once OpenOS has
---finished booting, `0` while shutting down and `6` while rebooting.
---@return string|integer runlevel
function computer.runlevel() end

---Returns all users registered on this computer, as multiple values. Use `{computer.users()}` to get a list.
---@return string ... names
function computer.users() end

---Registers a user with this computer; the player must currently be in the game. Registered users get full access;
---while at least one user is registered, other players can't use the computer.\
---Returns `true` on success, or `nil` and an error message.
---@param name string player name
---@return boolean|nil success
---@return string? reason
function computer.addUser(name) end

---Unregisters a user from this computer. Returns `true` if the user was removed, `false` if they weren't registered.\
---When the last user is removed, the computer becomes accessible to all players.
---@param name string player name
---@return boolean removed
function computer.removeUser(name) end

---Pushes a new signal into the queue. Signals are processed in FIFO order.\
---Values may be `nil`, booleans, numbers, strings or tables of these; functions and coroutines are not allowed.\
---Returns `false` if the signal could not be queued (queue full).
---@param name oc.SignalName
---@param ... any
---@return boolean queued
function computer.pushSignal(name, ...) end

---Waits for the next signal and returns its name and values, or nothing if `timeout` seconds passed first (default: wait forever).\
---In OpenOS this also runs event listeners and timers. The `event` library (`event.pull`) is usually more convenient.
---@param timeout? number seconds
---@return string|nil name the signal name, `nil` on timeout
---@return any ... the signal's values
function computer.pullSignal(timeout) end

---Plays a beep through the computer's speaker.\
---With numbers: `frequency` in Hz (20 to 2000, default 440) for `duration` seconds (default 0.1); blocks for the duration.\
---With a single string: a pattern of `.` (short) and `-` (long) beeps, e.g. `computer.beep("-.-")`.
---@param frequency? number|string frequency in Hz, or a beep pattern
---@param duration? number seconds
function computer.beep(frequency, duration) end

---Returns information about all devices installed in or connected to this computer, keyed by component address.\
---Each entry is a table of strings such as `class`, `description`, `vendor`, `product`, `capacity`, `width`, `clock`.
---@return table<string, table<string, string>> devices
function computer.getDeviceInfo() end

---Returns the known programs from loot disks: a list of `{programName, diskLabel}` pairs.
---@return string[][] locations
function computer.getProgramLocations() end

---Returns the names of the architectures the installed CPU supports, e.g. `{"Lua 5.2", "Lua 5.3"}`.
---@return string[] architectures
function computer.getArchitectures() end

---Returns the name of the architecture the computer currently runs, e.g. `"Lua 5.3"`.
---@return string architecture
function computer.getArchitecture() end

---Switches the CPU to another architecture and reboots the computer if it differs from the current one.\
---Returns nothing if the architecture is already active, or `nil` and an error message if it is unknown.
---@param architecture string e.g. `"Lua 5.3"`
---@return nil
---@return string? reason
function computer.setArchitecture(architecture) end

return computer
