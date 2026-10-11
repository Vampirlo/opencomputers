---@meta

---Keypad (OpenSecurity). Pressing a key sends the signal `<eventName>(address, keyIndex, keyLabel)`
---(default event name "keypad", key indices 1-12).
---@class ComponentOsKeypad : Component
local os_keypad = {}

---Returns a fixed greeting string (easter egg inherited by every OpenSecurity component). (signature inferred)
---@return string greeting
function os_keypad.greet()
end

---Sets the name of the event that gets sent when a key is pressed (default "keypad").
---@param name string
---@return boolean success always true
function os_keypad.setEventName(name)
end

---Sets whether the keys beep when pressed.
---@param shouldBeep boolean
---@return boolean success always true
function os_keypad.setShouldBeep(shouldBeep)
end

---Sets the volume of the key beep sound.
---@param volume number
---@return boolean success always true
function os_keypad.setVolume(volume)
end

---Returns the volume of the key beep sound.
---@return number volume
function os_keypad.getVolume()
end

---Sets the display text (up to 8 characters) and optionally its color (0-7, one bit per RGB channel).
---@param text string
---@param color? number
---@return boolean success always true
function os_keypad.setDisplay(text, color)
end

---Sets the label (up to 3 characters) and optionally the color (0-7) of key `index` (1-12).
---Alternatively pass a table of labels indexed 1-12 and an optional table of colors.
---@param index number 1-12
---@param text string
---@param color? number
---@return boolean success always true
---@overload fun(labels: table<integer, string>, colors?: table<integer, number>): boolean
function os_keypad.setKey(index, text, color)
end
