---@meta _

-- Global environment of programs running under OpenOS 1.8.3 (OpenComputers 1.8.3, Lua 5.3 architecture).
--
-- `component`, `computer`, `unicode` and `process` are NOT globals in OpenOS (its boot code removes them):
-- use `require("component")` etc. `bit32` is no global in Lua 5.3 either: use `require("bit32")`.
--
-- OpenComputers' sandbox lacks some standard functions, so this file replaces two of LuaLS's builtin libraries.
-- Disable them in `.luarc.json`, otherwise LuaLS shows both versions:
--   "runtime.builtin": { "basic": "disable", "debug": "disable" }
-- * basic: same as standard Lua 5.3, but without `collectgarbage` (not available in OpenComputers) and without
--   `arg` (OpenOS passes program arguments only as `...`).
-- * debug: only `getinfo`, `traceback`, `getlocal` and `getupvalue` exist, the last two return only the name.
-- The other standard libraries come from LuaLS; OpenOS changes to `os` and `io` are in lib/os.lua and lib/io.lua.
-- Type annotations of the basic library follow LuaLS's builtin definitions (lua-language-server, MIT license).

---------------------------------------------------------------------------------------------------------------------
-- OpenComputers / OpenOS globals
---------------------------------------------------------------------------------------------------------------------

---Type names as returned by `type()`.
---@alias oc.TypeName
---| "nil"
---| "number"
---| "string"
---| "boolean"
---| "table"
---| "function"
---| "thread"
---| "userdata"

---(OpenComputers) Checks the type of argument number `n`: throws `bad argument #n (string or nil expected, got number)`
---unless `type(have)` is one of the given type names.
---```lua
---local function greet(name, times)
---  checkArg(1, name, "string")
---  checkArg(2, times, "number", "nil")
---end
---```
---@param n number position of the argument, used in the error message
---@param have any the value to check
---@param ... oc.TypeName accepted type names
function checkArg(n, have, ...) end

---(OpenOS) The name and version of the operating system: `"OpenOS 1.8.3"`.
---@type string
_OSVERSION = "OpenOS 1.8.3"

---------------------------------------------------------------------------------------------------------------------
-- Basic functions (replace LuaLS's builtin "basic" library)
---------------------------------------------------------------------------------------------------------------------

---Raises an error if `v` is `nil` or `false`; otherwise returns all its arguments.
---`message` is the error object (default `"assertion failed!"`).
---@generic T
---@param v? T
---@param message? any
---@param ... any
---@return T
---@return any ...
function assert(v, message, ...) end

---(OpenOS) Loads the file `filename` (relative paths start at the working directory) and runs it as a Lua chunk.
---Returns all values returned by the chunk; errors are propagated.
---@param filename string
---@return any ...
function dofile(filename) end

---Raises an error with `message` as the error object; for strings, `level` (default 1) selects which function's position
---is prepended (1: the function calling `error`, 2: its caller, 0: none).
---@param message any
---@param level? number
function error(message, level) end

---The global environment (the table holding all global variables).
---@class _G
_G = {}

---Returns the metatable of `object`, or its `__metatable` field if set, or `nil`.
---In OpenComputers the string metatable is hidden: `getmetatable("")` returns `nil`.
---@param object any
---@return table metatable
---@nodiscard
function getmetatable(object) end

---Returns an iterator for `for i, v in ipairs(t) do`, visiting `t[1]`, `t[2]`, ... up to the first `nil`.
---@generic T: table, V
---@param t T
---@return fun(table: V[], i?: integer):integer, V
---@return T
---@return integer i
function ipairs(t) end

---Chunk modes for `load`.
---@alias oc.LoadMode
---| "b"  # Only binary chunks.
---| "t"  # Only text chunks.
---|>"bt" # Both binary and text.

---Loads a chunk from a string, or from a function returning its pieces, and returns it as a function,
---or `nil` and an error message.\
---In OpenComputers binary chunks are rejected unless enabled in the config, and in OpenOS the default `env` is the
---current program's environment.
---@param chunk string|function
---@param chunkname? string name used in error messages
---@param mode? oc.LoadMode
---@param env? table environment of the chunk
---@return function?
---@return string? error_message
---@nodiscard
function load(chunk, chunkname, mode, env) end

---(OpenOS) Loads the file `filename` (relative paths start at the working directory) as a Lua chunk and returns it as a
---function, or `nil` and an error message. Unlike standard Lua it can't read standard input.
---@param filename string
---@param mode? oc.LoadMode
---@param env? table environment of the chunk
---@return function?
---@return string? error_message
---@nodiscard
function loadfile(filename, mode, env) end

---Returns the next key and value of `table` after `index` (the first ones for `nil`), or `nil` at the end.
---`next(t) == nil` checks whether a table is empty. The order is unspecified, even for numeric keys.
---@generic K, V
---@param table table<K, V>
---@param index? K
---@return K?
---@return V?
---@nodiscard
function next(table, index) end

---Returns an iterator for `for k, v in pairs(t) do`, visiting all key–value pairs of `t` (uses `__pairs` if present).
---@generic T: table, K, V
---@param t T
---@return fun(table: table<K, V>, index?: K):K, V
---@return T
function pairs(t) end

---Calls `f(...)` in protected mode: returns `true` and the results of `f`, or `false` and the error object.
---@param f async fun(...):...
---@param arg1? any
---@param ... any
---@return boolean success
---@return any result
---@return any ...
function pcall(f, arg1, ...) end

---(OpenOS) Writes its arguments, converted with `tostring` and separated by tabs, plus a line break to standard output
---(`io.stdout`, usually the screen).
---@param ... any
function print(...) end

---Checks whether `v1` and `v2` are equal, without invoking the `__eq` metamethod.
---@param v1 any
---@param v2 any
---@return boolean
---@nodiscard
function rawequal(v1, v2) end

---Gets `table[index]` without invoking the `__index` metamethod.
---@param table table
---@param index any
---@return any
---@nodiscard
function rawget(table, index) end

---Returns the length of table or string `v` without invoking the `__len` metamethod.
---@param v table|string
---@return integer len
---@nodiscard
function rawlen(v) end

---Sets `table[index] = value` without invoking the `__newindex` metamethod. Returns `table`.
---@param table table
---@param index any
---@param value any
---@return table
function rawset(table, index, value) end

---With a number `index`, returns all arguments after argument number `index` (negative: counted from the end);
---with `"#"`, returns the number of extra arguments.
---@param index number|"#"
---@param ... any
---@return any
---@nodiscard
function select(index, ...) end

---Fields that `setmetatable` gives a special meaning.
---@class oc.Metatable
---@field __mode 'v'|'k'|'kv'|nil
---@field __metatable any|nil
---@field __tostring (fun(t):string)|nil
---@field __gc fun(t)|nil
---@field __add (fun(t1,t2):any)|nil
---@field __sub (fun(t1,t2):any)|nil
---@field __mul (fun(t1,t2):any)|nil
---@field __div (fun(t1,t2):any)|nil
---@field __mod (fun(t1,t2):any)|nil
---@field __pow (fun(t1,t2):any)|nil
---@field __unm (fun(t):any)|nil
---@field __idiv (fun(t1,t2):any)|nil
---@field __band (fun(t1,t2):any)|nil
---@field __bor (fun(t1,t2):any)|nil
---@field __bxor (fun(t1,t2):any)|nil
---@field __bnot (fun(t):any)|nil
---@field __shl (fun(t1,t2):any)|nil
---@field __shr (fun(t1,t2):any)|nil
---@field __concat (fun(t1,t2):any)|nil
---@field __len (fun(t):integer)|nil
---@field __eq (fun(t1,t2):boolean)|nil
---@field __lt (fun(t1,t2):boolean)|nil
---@field __le (fun(t1,t2):boolean)|nil
---@field __index table|(fun(t,k):any)|nil
---@field __newindex table|fun(t,k,v)|nil
---@field __call (fun(t,...):...)|nil
---@field __pairs (fun(t):((fun(t,k,v):any,any),any,any))|nil
---@field __name string|nil

---Sets the metatable of `table` (`nil` removes it) and returns `table`.
---Fails if the current metatable has a `__metatable` field.\
---In OpenComputers `__gc` metamethods are ignored unless enabled in the config.
---@param table table
---@param metatable? oc.Metatable|table
---@return table
function setmetatable(table, metatable) end

---Converts `e` to a number; returns `nil` if that's not possible.
---With `base` (2 to 36), `e` must be a string with an integer numeral in that base.
---@overload fun(e: string, base: number):integer?
---@param e any
---@return number?
---@nodiscard
function tonumber(e) end

---Converts `v` to a human-readable string (uses the `__tostring` and `__name` metafields if present).
---@param v any
---@return string
---@nodiscard
function tostring(v) end

---Returns the type of `v` as a string: `"nil"`, `"number"`, `"string"`, `"boolean"`, `"table"`, `"function"`,
---`"thread"` or `"userdata"`.
---@param v any
---@return oc.TypeName type
---@nodiscard
function type(v) end

---The running Lua version, e.g. `"Lua 5.3"` (it depends on the CPU's architecture).
---@type string
_VERSION = "Lua 5.3"

---Like `pcall`, but calls `msgh(errorObject)` on errors; its result becomes the error object
---(e.g. `xpcall(f, debug.traceback)`).
---@param f async fun(...):...
---@param msgh function
---@param arg1? any
---@param ... any
---@return boolean success
---@return any result
---@return any ...
function xpcall(f, msgh, arg1, ...) end

---------------------------------------------------------------------------------------------------------------------
-- debug (replaces LuaLS's builtin "debug" library)
---------------------------------------------------------------------------------------------------------------------

---The debug library. OpenComputers only provides `debug.getinfo` (passive information only), `debug.traceback`,
---and `debug.getlocal`/`debug.getupvalue`, which return just the variable name.
---@class debuglib
---Returns the **name** of local variable `index` of the function at stack level `f`, or of parameter `index` of
---function `f`; `nil` if there is none. In OpenComputers the value is not returned.
---Optionally the first argument is the coroutine whose stack is inspected.
---@field getlocal (fun(f: number|function, index: number): string?)|(fun(thread: thread, f: number|function, index: number): string?)
debug = {}

---Information returned by `debug.getinfo`. OpenComputers doesn't provide `func` and `activelines`.
---@class oc.DebugInfo
---@field name            string
---@field namewhat        string
---@field source          string
---@field short_src       string
---@field linedefined     integer
---@field lastlinedefined integer
---@field what            string
---@field currentline     integer
---@field istailcall      boolean
---@field nups            integer
---@field nparams         integer
---@field isvararg        boolean

---Characters selecting the fields `debug.getinfo` fills in.
---@alias oc.DebugInfoWhat string
---|+"n" # `name` and `namewhat`
---|+"S" # `source`, `short_src`, `linedefined`, `lastlinedefined` and `what`
---|+"l" # `currentline`
---|+"t" # `istailcall`
---|+"u" # `nups`, `nparams` and `isvararg`

---Returns information about function `f`, or about the function at stack level `f` (1: the function calling `getinfo`).
---Optionally the first argument is the coroutine whose stack is inspected.
---@overload fun(thread: thread, f: number|function, what?: oc.DebugInfoWhat): oc.DebugInfo
---@param f number|function
---@param what? oc.DebugInfoWhat
---@return oc.DebugInfo
---@nodiscard
function debug.getinfo(f, what) end

---Returns a traceback of the call stack, prefixed by `message`, starting at stack `level` (default 1).
---Optionally the first argument is the coroutine whose stack is used.
---@overload fun(thread: thread, message?: any, level?: number): string
---@param message? any
---@param level? number
---@return string message
---@nodiscard
function debug.traceback(message, level) end

---Returns the **name** of upvalue `up` of function `f`, or `nil` if there is none. In OpenComputers the value is not returned.
---@param f function
---@param up number
---@return string? name
---@nodiscard
function debug.getupvalue(f, up) end

---------------------------------------------------------------------------------------------------------------------
-- Additions to LuaLS's builtin libraries
---------------------------------------------------------------------------------------------------------------------

---@version >5.3
---Deprecated since Lua 5.3, but available in OpenComputers: same as `math.atan(y, x)`.
---(`math.cosh`, `math.sinh`, `math.tanh`, `math.frexp` and `math.log10` are not available.)
---@param y number
---@param x number
---@return number
---@nodiscard
function math.atan2(y, x) end

---@version >5.3
---Deprecated since Lua 5.3, but available in OpenComputers: returns `m * 2^e`.
---@param m number
---@param e number
---@return number
---@nodiscard
function math.ldexp(m, e) end

---@version >5.3
---Deprecated since Lua 5.3, but available in OpenComputers: returns `x ^ y`.
---@param x number
---@param y number
---@return number
---@nodiscard
function math.pow(x, y) end

---(OpenOS) Makes the first access to a missing field of `lib` run `file` (with `dofile`), which defines the rest of the
---library. OpenOS uses it to load rarely used parts of its libraries on demand.\
---OpenOS' `package` has no `cpath`, `config`, `loadlib`, `preload` and `searchers`.
---@param lib table
---@param file string absolute path of the file that completes `lib`
function package.delay(lib, file) end
