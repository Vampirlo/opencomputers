---@meta

---OpenOS reimplements the `io` library on top of the `filesystem` and `buffer` libraries; file handles are buffered streams
---(`file*`, see the `buffer` library). Only additions and differences are declared here; they merge into LuaLS's builtin `io`.\
---Each process has its own standard streams: `io.stdin`, `io.stdout` (where `print` writes) and `io.stderr` (shown in red).
---@class iolib
local io = {}

---Opens a file and returns a buffered stream, or `nil` and an error message. Relative paths start at the working directory.\
---Modes: `"r"` (default), `"rb"`, `"w"`, `"wb"`, `"a"`, `"ab"`. The update modes with `+` are **not** supported.\
---In text mode `read(n)` counts unicode characters, in binary mode (`"b"`) bytes.
---@param path string
---@param mode? "r"|"rb"|"w"|"wb"|"a"|"ab"
---@return file*|nil file
---@return string? reason
function io.open(path, mode) end

---Runs the shell command line `prog` in a new process and returns a buffered stream connected to its standard output
---(mode `"r"`, default) or standard input (mode `"w"`), or `nil` and an error message.
---@param prog string
---@param mode? "r"|"w"
---@param env? table environment for the program
---@return file*|nil file
---@return string? reason
function io.popen(prog, mode, env) end

---(OpenOS) Sets the standard error stream of the current process if `file` is given (a stream, or a path that is opened for
---writing), and returns the current one. Same as `io.stderr`.
---@param file? string|file*
---@return file*
function io.error(file) end

---(OpenOS) Gets, or sets if `file` is given, the stream of file descriptor `fd` of the current process
---(0 = standard input, 1 = standard output, 2 = standard error). A path is opened with `mode`.
---@param fd number
---@param file? string|file*
---@param mode? "r"|"rb"|"w"|"wb"|"a"|"ab"
---@return file*
function io.stream(fd, file, mode) end

---(OpenOS) Returns a proxy of stream `fd` whose `close` only closes the proxy, not `fd`. Used to share streams with child processes.
---@param fd file*
---@return file*
function io.dup(fd) end

---Opens a new file in `$TMPDIR` (see `os.tmpname`) and returns it, or `nil` if no name could be generated.\
---Unlike standard Lua the file is opened in append mode (write only) and is not removed automatically.
---@return file*|nil file
function io.tmpfile() end

---Returns `"file"` if `obj` is an open buffered stream (as returned by `io.open`), `"closed file"` if it is a closed one,
---and `nil` otherwise (also for raw streams from `filesystem.open`).
---@param obj any
---@return "file"|"closed file"|nil
function io.type(obj) end

---OpenOS buffered stream (created by `buffer.new`), returned by `io.open`, `io.popen` and used for `io.stdin`/`io.stdout`/`io.stderr`.\
---`read` formats: a number (characters in text mode, bytes in binary mode), `"n"`, `"l"` (default), `"L"`, `"a"`;
---the `*` prefix (`"*a"`) is accepted too.
---@class file*
---@field tty? boolean `true` if the stream is connected to the terminal (e.g. `io.stdout` when it isn't redirected).
local file = {}

---Sets the write buffering mode and buffer size; `nil` keeps the current value. Returns the resulting mode and size.\
---`"no"`: write immediately, `"full"` (default): write when `size` bytes are buffered, `"line"`: also write at line ends.
---@param mode? "no"|"full"|"line"
---@param size? number buffer size in bytes
---@return "no"|"full"|"line" mode
---@return number size
function file:setvbuf(mode, size) end

---(OpenOS) Returns the read timeout in seconds (`math.huge` by default).
---@return number seconds
function file:getTimeout() end

---(OpenOS) Sets the read timeout in seconds. A read that needs several chunks from the underlying stream throws `"timeout"`
---when it takes longer.
---@param timeout number seconds
function file:setTimeout(timeout) end

return io
