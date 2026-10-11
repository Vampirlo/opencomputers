---@meta

---Door Controller (OpenSecurity). Controls the doors (vanilla or security doors) directly adjacent to it.
---Also available as an upgrade for microcontrollers.
---Methods acting on doors return one result table per door, e.g. `{ {true}, {false, "Password incorrect"} }`,
---or false and a message when no door was found.
---@class ComponentOsDoorController : Component
local os_doorcontroller = {}

---Returns a fixed greeting string (easter egg inherited by every OpenSecurity component). (signature inferred)
---@return string greeting
function os_doorcontroller.greet()
end

---Returns a table with the open state (boolean) of every connected door. (signature inferred)
---@return boolean[] states
function os_doorcontroller.isOpen()
end

---Toggles the connected doors; security doors require their password. (signature inferred)
---@param password? string default ""
---@return table|false results one `{success, reason?}` table per door
---@return string? reason
function os_doorcontroller.toggle(password)
end

---Opens the connected doors; security doors require their password. (signature inferred)
---@param password? string default ""
---@return table|false results one `{success, reason?}` table per door
---@return string? reason
function os_doorcontroller.open(password)
end

---Closes the connected doors; security doors require their password. (signature inferred)
---@param password? string default ""
---@return table|false results one `{success, reason?}` table per door
---@return string? reason
function os_doorcontroller.close(password)
end

---Removes the password of the connected security doors; requires the current password. (signature inferred)
---@param password string current password
---@return table|false results one `{success, message}` table per security door
---@return string? reason
function os_doorcontroller.removePassword(password)
end

---Sets the password of the connected security doors. Doors without a password accept any `oldPassword`. (signature inferred)
---@param oldPassword string current password ("" if none)
---@param newPassword string
---@return table|false results one `{success, message}` table per security door
---@return string? reason
function os_doorcontroller.setPassword(oldPassword, newPassword)
end
