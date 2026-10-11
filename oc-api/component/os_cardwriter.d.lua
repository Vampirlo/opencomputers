---@meta

---Card Writer (OpenSecurity). Writes magnetic/RFID cards and flashes EEPROMs placed in its input slot.
---Sends the signals `cardInsert` and `cardRemove` when a card is put into or taken out of the input slot.
---The block also attaches a read-only filesystem labelled "cardwriter" with helper programs.
---@class ComponentOsCardWriter : Component
local os_cardwriter = {}

---Returns a fixed greeting string (easter egg inherited by every OpenSecurity component). (signature inferred)
---@return string greeting
function os_cardwriter.greet()
end

---Writes data to the card in the input slot and moves it to the output slot.
---Data is truncated to 64 characters for RFID cards and 128 for mag cards. `displayName` changes the card's item name,
---`locked` = true makes the card read-only for good, `color` (0-15, as in the `colors` API) sets the card color.
---Costs 5 energy. Returns true and the new card's UUID, or false and an error message.
---@param data string
---@param displayName? string default ""
---@param locked? boolean default false
---@param color? number default 0 (white)
---@return boolean success
---@return string uuidOrReason card UUID on success, error message on failure
function os_cardwriter.write(data, displayName, locked, color)
end

---Flashes `data` (the code) and the label `title` to the EEPROM in the input slot and moves it to the output slot.
---If `locked` is true the EEPROM becomes read-only. (signature inferred)
---@param data string
---@param title string
---@param locked boolean
---@return boolean success
---@return string? reason
function os_cardwriter.flash(data, title, locked)
end
