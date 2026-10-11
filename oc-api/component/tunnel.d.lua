---@meta

---Linked card: sends messages to the card(s) it is linked with, regardless of distance or dimension.\
---Received messages arrive as `modem_message` signals: `localAddress, remoteAddress, port (0), distance (0), ...`.\
---Component type: `tunnel`.
---@class ComponentTunnel : Component
local tunnel = {}

---Sends the specified data to the card(s) this one is linked to. Data may only be `nil`, booleans, numbers and strings.
---@param ... nil|boolean|number|string Message data.
---@return boolean|nil success
---@return string? reason `"not enough energy"`.
function tunnel.send(...) end

---Gets the maximum packet size (config setting).
---@return integer size
function tunnel.maxPacketSize() end

---Gets this link card's shared channel address.
---@return string channel
function tunnel.getChannel() end

---Gets the current wake-up message and whether it is fuzzy.\
---When the card receives this message (as first value of a packet) while the machine is off, the machine is started.
---@return string|nil message
---@return boolean fuzzy
function tunnel.getWakeMessage() end

---Sets the wake-up message (`nil` disables it) and whether to ignore additional data in the packet ("fuzzy"). Returns the previous values.
---@param message? string
---@param fuzzy? boolean (default: unchanged)
---@return string|nil oldMessage
---@return boolean oldFuzzy
function tunnel.setWakeMessage(message, fuzzy) end
