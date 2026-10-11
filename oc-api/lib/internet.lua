---@meta

---Response handle returned by `internet.request`. Iterate over it to read the body in chunks:
---`for chunk in internet.request(url) do ... end`. Each call returns the next chunk of data (waiting for it
---as needed), or `nil` at the end of the body, closing the connection. Calls raise an error if the request
---failed (e.g. the host could not be reached or the server returned an error status).
---The methods of the underlying HTTP request object are available on the handle as well.
---@class InternetResponse
---@overload fun(): string|nil
local InternetResponse = {}

---Returns `true` once the response is available, `false` while the request is still in progress.
---Raises an error if the request failed.
---@return boolean connected
function InternetResponse.finishConnect() end

---Gets the HTTP status code, status message and response headers (each header name maps to a list of values).
---Returns `nil` if the response is not available yet (see `finishConnect`).
---@return integer|nil code
---@return string message
---@return table<string, string[]> headers
function InternetResponse.response() end

---Reads up to `n` bytes of the body without waiting: returns an empty string if no data is available yet
---and `nil` at the end of the body. Calling the handle itself is usually more convenient.
---@param n? number
---@return string|nil data
function InternetResponse.read(n) end

---Closes the connection.
function InternetResponse.close() end

---File-like wrapper around a raw TCP socket, returned by `internet.socket`.
---Its `read` does not wait for data; `internet.open` gives a buffered stream instead.
---@class InternetSocketStream
---@field inet ComponentInternet the internet card the connection was opened with
---@field socket InternetTcpSocket|nil the underlying TCP socket, `nil` after `close`
local InternetSocketStream = {}

---Reads up to `n` bytes without waiting: returns an empty string if no data is available yet
---and `nil` if the connection was closed by the other side.
---Returns `nil` and `"connection is closed"` after `close`.
---@param n? number
---@return string|nil data
---@return string? reason
function InternetSocketStream:read(n) end

---Writes all of `value` to the socket, waiting until it has been sent.
---@param value string
---@return boolean|nil success
---@return string? reason
function InternetSocketStream:write(value) end

---Closes the connection.
function InternetSocketStream:close() end

---Seeking is not supported: always returns `nil` and `"bad file descriptor"`.
---@param whence? string
---@param offset? number
---@return nil
---@return string reason
function InternetSocketStream:seek(whence, offset) end

---The internet library (`require("internet")`): HTTP(S) requests and TCP connections through the primary internet card.
---See the `internet` component for lower-level access (e.g. checking whether HTTP or TCP is enabled).
---@class internetlib
local internet = {}

---Sends an HTTP or HTTPS request and returns a handle to read the response with.
---Without `data` a GET request is sent, with `data` a POST request, unless `method` is given.
---A table `data` is sent as form fields: `{a = 1, b = "x"}` becomes `a=1&b=x` (values are not URL-encoded).
---Raises an error if there is no internet card or the request cannot be started.
---@param url string
---@param data? string|table request body, or form fields
---@param headers? table<string, any> request headers
---@param method? string HTTP method, e.g. `"GET"`, `"POST"`, `"PUT"`
---@return InternetResponse response
function internet.request(url, data, headers, method) end

---Opens a TCP connection and wraps it in a file-like object with `read`, `write` and `close`.
---Its `read` does not wait for data; `internet.open` is usually more convenient.
---Returns `nil` and an error message if the connection cannot be opened.
---@param address string host name or IP address, optionally followed by `:port`
---@param port? number
---@return InternetSocketStream|nil socket
---@return string? reason
function internet.socket(address, port) end

---Opens a TCP connection as a buffered stream that works like a file opened with `io.open`
---(`read`, `write`, `lines`, `close`, ...). Its `read` waits for data; to avoid waiting forever,
---set a timeout with `stream:setTimeout(seconds)`. Returns `nil` and an error message on failure.
---@param address string host name or IP address, optionally followed by `:port`
---@param port? number
---@return file*|nil stream
---@return string? reason
function internet.open(address, port) end

return internet
