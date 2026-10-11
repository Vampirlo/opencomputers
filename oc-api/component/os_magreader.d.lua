---@meta

---Magnetic Card Reader (OpenSecurity). Swiping a mag card sends the signal
---`<eventName>(address, playerName, data, cardUUID, locked, side)` (default event name "magData").
---The Secure Mag Door also registers as `os_magreader`, but only offers `setEventName` and `greet`.
---@class ComponentOsMagReader : Component
local os_magreader = {}

---Returns a fixed greeting string (easter egg inherited by every OpenSecurity component). (signature inferred)
---@return string greeting
function os_magreader.greet()
end

---Sets the name of the event that gets sent when a card is swiped (default "magData").
---@param name string
---@return boolean success always true
function os_magreader.setEventName(name)
end

---Sets whether the lights are automatic (default true) or determined by `setLightState`.
---@param active boolean
---@return boolean success always true
function os_magreader.swipeIndicator(active)
end

---Sets the light state of the reader using binary counting: 0 = no lights, 1 = red, 2 = yellow, 4 = green (sum them, 0-7).
---Only works if `swipeIndicator` was set to false; returns false otherwise or if the value is out of range.
---@param state number
---@return boolean changed
function os_magreader.setLightState(state)
end
