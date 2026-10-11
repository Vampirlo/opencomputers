---@meta

---Biometric Reader (OpenSecurity). When a player uses it, it sends the signal
---`<eventName>(address, playerUUID)` (default event name "bioReader").
---@class ComponentOsBiometric : Component
local os_biometric = {}

---Returns a fixed greeting string (easter egg inherited by every OpenSecurity component). (signature inferred)
---@return string greeting
function os_biometric.greet()
end

---Sets the name of the event that gets sent (default "bioReader").
---@param name string
---@return boolean success always true
function os_biometric.setEventName(name)
end
