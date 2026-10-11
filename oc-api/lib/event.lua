---@meta

---Signal (event) names queued by OpenComputers and OpenOS. Any other string is accepted too
---(custom signals pushed with `event.push`, other mods).\
---The text after each name lists the values that follow the name, e.g. `local name, address, x, y = event.pull("touch")`.
---@alias oc.SignalName
---| "component_added"       # address: string, componentType: string. A component was connected to the computer.
---| "component_removed"     # address: string, componentType: string. A component was disconnected.
---| "component_available"   # componentType: string. (OpenOS) A primary component of this type was set; prefer it to `component_added`.
---| "component_unavailable" # componentType: string. (OpenOS) The primary component of this type was removed.
---| "key_down"              # keyboardAddress: string, char: number, code: number, playerName: string. A key was pressed (repeats while held).
---| "key_up"                # keyboardAddress: string, char: number, code: number, playerName: string. A key was released.
---| "clipboard"             # keyboardAddress: string, value: string, playerName: string. Text was pasted (Shift+Ins or middle click).
---| "touch"                 # screenAddress: string, x: number, y: number, button: number, playerName: string. A tier 2/3 screen was clicked.
---| "drag"                  # screenAddress: string, x: number, y: number, button: number, playerName: string. The mouse moved while a button is held (GUI only).
---| "drop"                  # screenAddress: string, x: number, y: number, button: number, playerName: string. The mouse button was released after `touch`.
---| "scroll"                # screenAddress: string, x: number, y: number, direction: number, playerName: string. Mouse wheel in the screen GUI; positive is usually up.
---| "walk"                  # screenAddress: string, x: number, y: number, playerName?: string. An entity walked on a tier 2/3 screen (x, y = screen block).
---| "screen_resized"        # screenAddress: string, newWidth: number, newHeight: number. The screen resolution changed.
---| "redstone_changed"      # address: string, side: number, oldValue: number, newValue: number, color?: number. A redstone input changed (`side` is `"wireless"` for wireless redstone; `color` only for bundled input).
---| "motion"                # address: string, relativeX: number, relativeY: number, relativeZ: number, entityName?: string. The motion sensor saw a living entity move.
---| "modem_message"         # receiverAddress: string, senderAddress: string, port: number, distance: number, ...: any. A network/linked card received a message (`...` = payload; `distance` is 0 for wired).
---| "internet_ready"        # address: string, id: string. An internet card socket/request is ready.
---| "inventory_changed"     # slot: number. (Robot) The kind of item in an inventory slot changed.
---| "tank_changed"          # address: string, tank: number, amount: number. The fluid amount in a tank upgrade changed (positive: filled, negative: drained).
---| "hit"                   # x: number, z: number, y: number, entityName?: string. (Drone) The drone was hit; x, z, y is the direction of the hit.
---| "tablet_use"            # data: table. A tablet was held on a block long enough to analyze it; `data` is filled by its upgrades (e.g. a geolyzer).
---| "debug_message"         # receiverAddress: string, senderAddress: string, port: number, distance: number, ...: any. A debug card received a message.
---| "interrupted"           # uptime: number. (OpenOS) Soft interrupt: the user pressed Ctrl+C.
---| "term_available"        # (OpenOS) A GPU and a screen are bound and the terminal can be used.
---| "term_unavailable"      # (OpenOS) The terminal lost its GPU or screen.
---| "gpu_bound"             # gpuAddress: string, screenAddress: string. (OpenOS) The primary GPU was bound to the primary screen.
---| "init"                  # (OpenOS) Booting finished; libraries can use components now.
---| "shutdown"              # (OpenOS) `computer.shutdown` was called; the computer turns off (or reboots) right after.
---| "thread_exit"           # (OpenOS) A thread created with the `thread` library died.
---| string

---The event library: waiting for signals (`event.pull`) and calling functions when signals arrive or timers expire (`event.listen`, `event.timer`).
---@class eventlib
local event = {}

---Registers `callback` to be called whenever a signal named `name` arrives.\
---The callback receives the signal name followed by the signal's values. If it returns `false`, it is unregistered.\
---Returns the handler id (usable with `event.cancel`), or `false` if this callback is already registered for this signal.
---@param name oc.SignalName signal name (compared for equality, not as a pattern)
---@param callback fun(name: string, ...: any): any
---@return integer|false id
function event.listen(name, callback) end

---Unregisters a listener added with `event.listen`.\
---Returns `true` if it was removed, `false` if this callback wasn't registered for this signal.
---@param name oc.SignalName
---@param callback fun(name: string, ...: any): any
---@return boolean removed
function event.ignore(name, callback) end

---Starts a timer that calls `callback` after `interval` seconds, `times` times (default 1; `math.huge` repeats forever).\
---Returning `false` from the callback stops the timer. Returns the timer id for `event.cancel`.\
---Timers only fire while some code pulls signals (e.g. `event.pull`, `os.sleep`, the idle shell), and may be up to a tick (0.05 s) late.
---@param interval number seconds between calls, may be fractional (e.g. 0.05)
---@param callback fun(...: any): any
---@param times? number how often to call `callback` (default 1)
---@return integer id
function event.timer(interval, callback, times) end

---Cancels a timer created by `event.timer` (or any handler by its id).\
---Returns `true` if it was stopped, `false` if there is no handler with this id.
---@param timerId number
---@return boolean canceled
function event.cancel(timerId) end

---Waits for the next signal and returns its name and values.\
---If `timeout` is given, returns `nil` when no matching signal arrived within that many seconds; without it, waits forever.\
---`name` is a pattern (as in `string.match`) the signal name must match; the remaining arguments filter the signal's values
---by equality (`nil` matches anything). Signals that don't match are dropped. Event listeners and timers keep running meanwhile.
---```lua
---local name, address, x, y = event.pull("touch")
---local name2, kbd, char, code = event.pull(5, "key_down") -- name2 is nil after 5 seconds without a key press
---event.pull("touch", nil, nil, nil, nil, "Steve")        -- only touches by player "Steve"
---```
---@overload fun(name: oc.SignalName, ...: any): string, ...
---@param timeout? number maximum time to wait, in seconds (default: forever)
---@param name? oc.SignalName signal name pattern (default: any signal)
---@param ... any filters for the signal's values, in order (`nil` matches anything)
---@return string|nil name the signal name, `nil` on timeout
---@return any ... the signal's values
function event.pull(timeout, name, ...) end

---Waits for the next signal accepted by `filter` (called with the signal name and values, return a truthy value to accept).\
---If `timeout` is given, returns `nil` when no accepted signal arrived within that many seconds; without it, waits forever.
---```lua
---local name, address, x, y, button, player = event.pullFiltered(function(name, ...)
---  return name == "touch" or name == "drag"
---end)
---```
---@overload fun(filter: fun(name: string, ...: any): any): string, ...
---@param timeout? number maximum time to wait, in seconds (default: forever)
---@param filter? fun(name: string, ...: any): any
---@return string|nil name the signal name, `nil` on timeout
---@return any ... the signal's values
function event.pullFiltered(timeout, filter) end

---Waits for the next signal whose name matches any of the given names (patterns, as in `string.match`).\
---An optional leading number is a timeout in seconds; then `nil` is returned when no matching signal arrived in time.
---```lua
---local name, a, b, c = event.pullMultiple("touch", "key_down", "interrupted")
---local name2 = event.pullMultiple(10, "modem_message", "interrupted")
---```
---@overload fun(timeout: number, ...: oc.SignalName): string|nil, ...
---@param first? oc.SignalName|number a signal name pattern, or a timeout in seconds
---@param ... oc.SignalName more signal name patterns
---@return string name the signal name
---@return any ... the signal's values
function event.pullMultiple(first, ...) end

---Pushes a new signal into the queue (alias of `computer.pushSignal`).\
---Values may be `nil`, booleans, numbers, strings or tables of these; functions and coroutines are not allowed.\
---Returns `false` if the signal could not be queued (queue full).
---@param name oc.SignalName
---@param ... any
---@return boolean queued
function event.push(name, ...) end

---Called with the error message when an event listener or timer callback throws an error.
---By default it appends the message to `/tmp/event.log`. Replace it to handle such errors differently.
---@param message any
function event.onError(message) end

---Low-level handler registration used by `event.listen`, `event.timer` and the `thread` library.\
---`key`: signal name to react to, `false` for timers, `nil` for every signal. Returns the handler id (see `event.cancel`).
---@param key string|false|nil
---@param callback fun(...: any): any
---@param interval? number seconds until the callback runs regardless of signals (default `math.huge`)
---@param times? number how many times it may run (default 1)
---@param opt_handlers? table handler table to register in (default: the current one)
---@return integer id
function event.register(key, callback, interval, times, opt_handlers) end

return event
