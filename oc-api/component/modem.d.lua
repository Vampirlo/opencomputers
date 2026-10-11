---@meta

---Network card (wired or wireless). Received messages arrive as `modem_message` signals:\
---`localAddress, remoteAddress, port, distance, ...`. Message data may only be `nil`, booleans, numbers and strings.\
---Component type: `modem`.
---@class ComponentModem : Component
local modem = {}

---Opens the specified port (1-65535) for listening. Returns `true` if the port was opened, `false` if it was already open.
---@param port number
---@return boolean opened
function modem.open(port) end

---Closes the specified port (default: all ports). Returns `true` if ports were closed.
---@param port? number
---@return boolean closed
function modem.close(port) end

---Returns whether the specified port is open.
---@param port number
---@return boolean open
function modem.isOpen(port) end

---Returns whether this card has wireless networking capability.
---@return boolean wireless
function modem.isWireless() end

---Returns whether this card has wired networking capability (tier 1 wireless cards don't).
---@return boolean wired
function modem.isWired() end

---Sends the specified data to the specified target. Returns `true` if the message was sent (not necessarily received).
---@param address string Address of the target modem.
---@param port number
---@param ... nil|boolean|number|string Message data.
---@return boolean sent
function modem.send(address, port, ...) end

---Broadcasts the specified data on the specified port. Returns `true` if the message was sent.\
---Broadcasts are not delivered to the sending card itself.
---@param port number
---@param ... nil|boolean|number|string Message data.
---@return boolean sent
function modem.broadcast(port, ...) end

---Gets the signal strength (range) used when sending messages. Wireless cards only.
---@return number strength
function modem.getStrength() end

---Sets the signal strength (range) used when sending messages, up to the card's maximum. Returns the new strength.\
---A strength greater than zero makes messages also be sent wirelessly; more strength costs more energy. Wireless cards only.
---@param strength number
---@return number strength
function modem.setStrength(strength) end

---Gets the current wake-up message and whether it is fuzzy.\
---When the card receives this message (as first value of a packet, on any port) while the machine is off, the machine is started.
---@return string|nil message
---@return boolean fuzzy
function modem.getWakeMessage() end

---Sets the wake-up message (`nil` disables it) and whether to ignore additional data in the packet ("fuzzy"). Returns the previous values.
---@param message? string
---@param fuzzy? boolean (default: unchanged)
---@return string|nil oldMessage
---@return boolean oldFuzzy
function modem.setWakeMessage(message, fuzzy) end
