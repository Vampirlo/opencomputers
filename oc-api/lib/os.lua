---@meta

---OpenOS additions to and changes of the standard `os` library. They merge into LuaLS's builtin `os`,
---so `os.sleep(1)` works on the global `os` without `require`.\
---Unchanged standard functions (`os.clock`, `os.difftime`) come from LuaLS. `os.setlocale` does not exist in OpenComputers.
---@class oslib
local os = {}

---(OpenOS) Pauses the program for `seconds` (default 0, i.e. just yields once).\
---Event listeners, timers and threads keep running, but signals arriving meanwhile are consumed:
---they can't be pulled with `event.pull` afterwards.
---@param seconds? number
function os.sleep(seconds) end

---(OpenOS) Returns the value of the environment (shell) variable `varname` of the current process, or `nil` if it is not set.\
---Without arguments, returns the table of all variables. Common ones: `PATH`, `PWD`, `HOME`, `TMPDIR`, `SHELL`.
---@overload fun(): table<string, string>
---@param varname string|number
---@return string|nil value
function os.getenv(varname) end

---(OpenOS) Sets the environment (shell) variable `varname` to `tostring(value)`; `nil` removes it. Returns the new value.\
---Programs started from the shell share the shell's variables.
---@param varname string|number
---@param value? any
---@return string|nil value
function os.setenv(varname, value) end

---(OpenOS) Deletes a file or a directory **including its contents** (alias of `filesystem.remove`).\
---Returns `true` on success, or `nil` and an error message.
---@param path string
---@return boolean|nil success
---@return string? reason
function os.remove(path) end

---(OpenOS) Renames or moves a file or directory (alias of `filesystem.rename`). Across file systems only files can be moved.\
---Returns `true` on success, or `nil` and an error message.
---@param oldPath string
---@param newPath string
---@return boolean|nil success
---@return string? reason
function os.rename(oldPath, newPath) end

---(OpenOS) Runs a shell command line, as if typed into the shell (e.g. `os.execute("ls -l /home")`).\
---Returns `true` if the command succeeded (exit code 0), otherwise `false` or `nil` and possibly an error message.
---Without `command`, returns `true` (a shell is available).
---@param command? string
---@return boolean|nil success
---@return string? reason
function os.execute(command) end

---(OpenOS) Terminates the current program (process or thread), **not** the computer, by throwing a special error.\
---`code` becomes the exit code (default 0). Use `computer.shutdown` to turn the computer off.
---@param code? boolean|number
function os.exit(code) end

---(OpenOS) Returns a path in `$TMPDIR` (default `/tmp`) that doesn't exist yet, or `nil` if none could be found.
---@return string|nil path
function os.tmpname() end

---(OpenComputers) Formats the **in-game** date and time (like C `strftime`). Default format: `"%d/%m/%y %H:%M:%S"`.\
---`"*t"` returns a table with `year`, `month`, `day`, `hour`, `min`, `sec`, `wday`, `yday`.
---A leading `!` is ignored (Minecraft has no time zones). `time` defaults to the current in-game time (`os.time()`).
---@param format? string
---@param time? number in-game time as returned by `os.time`
---@return string|osdate
function os.date(format, time) end

---(OpenComputers) Returns the **in-game** time in in-game seconds since the world was created (a float);
---`os.time() * 1000 / 60 / 60 - 6000` gives the world time in ticks. With a table, returns the in-game time for that date, or `nil`.\
---For real-time measurements use `computer.uptime()`.
---@overload fun(): number
---@param date osdateparam
---@return number|nil time
function os.time(date) end

return os
