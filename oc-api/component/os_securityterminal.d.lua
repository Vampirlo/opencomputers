---@meta

---Security Terminal (OpenSecurity). Protects the blocks within 8 * range blocks around it from players
---that are not on its allowed-user list (costs energy while protecting).
---@class ComponentOsSecurityTerminal : Component
local os_securityterminal = {}

---Returns a fixed greeting string (easter egg inherited by every OpenSecurity component). (signature inferred)
---@return string greeting
function os_securityterminal.greet()
end

---Returns whether the protection is enabled.
---@return boolean enabled
function os_securityterminal.isEnabled()
end

---Adds a Minecraft user (player name or UUID string) as an allowed user. Requires the terminal password.
---@param password string
---@param user string player name or UUID
---@return boolean success
---@return string message
function os_securityterminal.addUser(password, user)
end

---Removes a Minecraft user (player name or UUID string) from the allowed users. Requires the terminal password.
---@param password string
---@param user string player name or UUID
---@return boolean success
---@return string message
function os_securityterminal.delUser(password, user)
end

---Sets the block password, required to enable/disable the terminal and for other actions.
---If no password is set yet, `password` becomes the password; otherwise pass the current password and `newPassword`.
---@param password string new password, or the current one when changing it
---@param newPassword? string required when a password is already set
---@return boolean success
---@return string message
function os_securityterminal.setPassword(password, newPassword)
end

---Toggles particles that show the corners of the protected area. Returns the new particle state.
---@param password? string
---@return boolean particlesEnabled false and a message if the password is wrong
---@return string? reason
function os_securityterminal.toggleParticle(password)
end

---Sets the range of the protected area: 8 * range blocks in each direction, range 1-4.
---Increasing the range increases the energy cost.
---@param password? string may be nil if no password is set
---@param range number 1-4
---@return boolean success
---@return string? reason
function os_securityterminal.setRange(password, range)
end

---Enables the protection; requires the correct password.
---@param password? string
---@return boolean success
---@return string? reason
function os_securityterminal.enable(password)
end

---Disables the protection; requires the correct password.
---@param password? string
---@return boolean success
---@return string? reason
function os_securityterminal.disable(password)
end

---Returns the names of the currently allowed users; requires the correct password.
---@param password? string
---@return string[]|false users false if the password is wrong
---@return string? reason
function os_securityterminal.getAllowedUsers(password)
end
