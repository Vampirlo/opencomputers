---@meta

---RFID Reader (OpenSecurity) block, upgrade or card. Detects RFID cards carried by players, drones and tagged entities.
---Each scan also sends one signal `rfidData(address, name, range, data, cardUUID)` per found card.
---@class ComponentOsRFIDReader : Component
local os_rfidreader = {}

---An RFID card found by `scan`.
---@class OsRFIDReaderEntry
---@field name string name of the player/entity carrying the card
---@field range number distance to the reader
---@field data string card data
---@field uuid string card UUID
---@field locked boolean whether the card is read-only

---Returns a fixed greeting string (easter egg inherited by every OpenSecurity component). (signature inferred)
---@return string greeting
function os_rfidreader.greet()
end

---Sets the name of the event that gets sent when a card is detected.
---Note: in this OpenSecurity build, `scan` always uses the signal name "rfidData".
---@param name string
---@return boolean success always true
function os_rfidreader.setEventName(name)
end

---Scans for RFID cards in range (capped by the config) and pushes an `rfidData` signal for each found card.
---Costs 5 energy per block of range.
---@param range? number
---@return OsRFIDReaderEntry[]|false cards false if there is not enough energy
---@return string? reason
function os_rfidreader.scan(range)
end
