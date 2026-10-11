---@meta

---Internet card: HTTP requests and TCP connections to the real internet (if enabled in the config).\
---Usually you'll want the `internet` library (`require("internet")`) instead.\
---Component type: `internet`.
---@class ComponentInternet : Component
local internet = {}

---Returns whether HTTP requests can be made (config setting).
---@return boolean enabled
function internet.isHttpEnabled() end

---Starts an HTTP request and returns a handle for it, through which the response can be read once it is available (see `finishConnect`).
---@param url string
---@param postData? string Request body; makes this a POST request by default.
---@param headers? table<string, string> Request headers.
---@param method? string HTTP method, e.g. `"PUT"` or `"DELETE"`.
---@return InternetHttpRequest|nil request The request handle, or `nil` on failure.
---@return string? reason E.g. `"http requests are unavailable"` or `"too many open connections"`.
function internet.request(url, postData, headers, method) end

---Returns whether TCP connections can be made (config setting).
---@return boolean enabled
function internet.isTcpEnabled() end

---Opens a new TCP connection and returns a handle for it. The connection is established asynchronously, see `finishConnect`.
---@param address string Host name or IP, optionally with the port, e.g. `"example.com:80"`.
---@param port? number Required if `address` does not include the port.
---@return InternetTcpSocket|nil socket The socket handle, or `nil` on failure.
---@return string? reason E.g. `"tcp connections are unavailable"` or `"too many open connections"`.
function internet.connect(address, port) end

---A TCP connection opened with `internet.connect` (userdata; call its methods with `.`).
---@class InternetTcpSocket
local InternetTcpSocket = {}

---Returns whether the connection is established. Throws an error if the connection failed.
---@return boolean connected
function InternetTcpSocket.finishConnect() end

---Reads up to `n` bytes (default: as much as is available) from the socket stream.\
---Returns an empty string if no data is available yet, and `nil` once the connection was closed.
---@param n? number
---@return string|nil data
function InternetTcpSocket.read(n) end

---Writes data to the socket stream. Returns the number of bytes written (`0` while not yet connected).
---@param data string
---@return integer written
function InternetTcpSocket.write(data) end

---Closes the socket.
function InternetTcpSocket.close() end

---Returns the connection ID, as used in `internet_ready` signals.
---@return string id
function InternetTcpSocket.id() end

---An HTTP request started with `internet.request` (userdata; call its methods with `.`).
---@class InternetHttpRequest
local InternetHttpRequest = {}

---Returns whether the response is available. Throws an error if the request failed.
---@return boolean connected
function InternetHttpRequest.finishConnect() end

---Gets the response code, message and headers, or `nil` if the response is not available yet.\
---Header values are arrays of strings.
---@return integer|nil code E.g. `200`.
---@return string? message E.g. `"OK"`.
---@return table<string, string[]>? headers
function InternetHttpRequest.response() end

---Reads up to `n` bytes (default: as much as is available) from the response.\
---Returns an empty string if no data is available yet, and `nil` once the whole response was read.
---@param n? number
---@return string|nil data
function InternetHttpRequest.read(n) end

---Closes the request.
function InternetHttpRequest.close() end
