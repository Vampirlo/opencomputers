---@meta

---OpenOS process management. Every program runs as a process: a coroutine with its own environment, standard streams
---(`io.stdin`/`io.stdout`/`io.stderr`), environment variables and open handles, inherited from its parent process.\
---In OpenOS this is a module: `local process = require("process")` (there is no global `process`).
---@class processlib
local process = {}

---Loads a program and sets it up as a new process, returning its coroutine; resume it to run the program
---(arguments passed to the first resume become the program's `...`).\
---`path` is a program path, resolved like the shell does (`.lua` may be omitted), or a function (then `env` must be `nil`).
---`env` is the environment the program sees (default: the current process' environment). `init` is called first with the
---arguments and its results are passed to the program instead. `name` is the command name reported by `process.info`.
---@param path string|function
---@param env? table
---@param init? fun(...: any): ...
---@param name? string
---@return thread coroutine
function process.load(path, env, init, name) end

---Returns information about a process, or `nil` if there is none: the current process for `nil` or 1, its parent for 2,
---and so on, or the process owning the given coroutine.
---@param levelOrThread? number|thread
---@return ProcessInfo|nil info
function process.info(levelOrThread) end

---Deprecated, use `process.info`. Returns the path, environment and command name of the current process
---(`level` 2 for its parent, and so on, or the process owning a coroutine), or nothing if there is no such process.
---@param level? number|thread
---@return string|function|nil path
---@return table? env
---@return string? command
function process.running(level) end

---Returns the internal process record that owns coroutine `co` (default: the running coroutine), or `nil`.
---Low-level, prefer `process.info`.
---@param co? thread
---@return table|nil process
function process.findProcess(co) end

---Registers `handle` (an object with a `close` method, e.g. a stream) with process `proc` (default: the current one),
---so that it is closed automatically when the process ends. Returns `handle`.
---@generic T: table
---@param handle T
---@param proc? table process record (see `process.findProcess`)
---@return T handle
function process.addHandle(handle, proc) end

---Unregisters a handle registered with `process.addHandle`. Returns it, or `nil` if it wasn't registered.
---@param handle table
---@param proc? table process record (see `process.findProcess`)
---@return table|nil handle
function process.removeHandle(handle, proc) end

---Information about a process, returned by `process.info`.
---@class ProcessInfo
---@field path string|function the program path the process was loaded from (or the function)
---@field env table the process environment (its global variables)
---@field command string the command name, e.g. `"ls -l"` for programs started by the shell
---@field data table process data: `vars` (environment variables), `io` (file descriptors), `handles` (open handles), ...

return process
