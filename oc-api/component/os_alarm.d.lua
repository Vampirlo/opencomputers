---@meta

---Alarm (OpenSecurity) block or upgrade. Plays a looping alarm sound while activated.
---@class ComponentOsAlarm : Component
local os_alarm = {}

---Returns a fixed greeting string (easter egg inherited by every OpenSecurity component). (signature inferred)
---@return string greeting
function os_alarm.greet()
end

---Sets the range of the alarm in blocks (max 15). Returns true and the new range.
---@param range number
---@return boolean success
---@return number newRange
function os_alarm.setRange(range)
end

---Sets the alarm sound (see `listSounds`).
---@param soundName string
---@return boolean success
function os_alarm.setAlarm(soundName)
end

---Activates the alarm.
---@return boolean success always true
function os_alarm.activate()
end

---Deactivates the alarm.
---@return boolean success always true
function os_alarm.deactivate()
end

---Returns a list of the available sounds.
---@return string[] sounds
function os_alarm.listSounds()
end

---Plays a sound once at x, y, z (relative to the alarm). `sound` defaults to the alarm sound,
---`range` (1-15 recommended) to the alarm range. Can be disabled in the OpenSecurity config.
---@param x number
---@param y number
---@param z number
---@param sound? string
---@param range? number
---@return boolean success
---@return string? reason
function os_alarm.playSoundAt(x, y, z, sound, range)
end
