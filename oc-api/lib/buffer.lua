---@meta

---Buffered streams. `io.open`, `io.popen` and the standard streams return such streams (`file*`); their methods
---(`read`, `write`, `lines`, `seek`, `setvbuf`, `getTimeout`, ...) are documented on `file*`.\
---`buffer.new` wraps your own stream object, e.g. a network connection, to get the same comfortable methods.
---@class bufferlib
local buffer = {}

---Creates a buffered stream that wraps `stream`.\
---`mode` contains `"r"` to allow reading (the default), `"w"` or `"a"` to allow writing, and `"b"` for binary mode
---(`read(n)` counts bytes instead of unicode characters), e.g. `"rw"`.
---```lua
---local s = buffer.new("r", {read = function(self, n) return nil end})
---```
---@param mode? string
---@param stream BufferStream|table the stream to wrap, see `BufferStream`
---@return file*
function buffer.new(mode, stream) end

---Methods a stream must provide to be wrapped by `buffer.new` (only those needed for the chosen mode).
---@class BufferStream
---Returns up to `n` **bytes**; `nil` at the end of the stream, or `nil` and an error message. Shorter (even empty) strings are fine.
---@field read? fun(self: BufferStream, n: number): string|nil, string?
---Writes the bytes of `data`; returns a truthy value on success, or a falsy value and an error message.
---@field write? fun(self: BufferStream, data: string): any, string?
---Moves the position; returns the new position from the start of the stream, or `nil` and an error message.
---@field seek? fun(self: BufferStream, whence: "set"|"cur"|"end", offset: number): number|nil, string?
---Closes the stream and releases its resources.
---@field close? fun(self: BufferStream): any

return buffer
