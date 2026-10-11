---@meta

---Rolldoor Controller (OpenSecurity). Controls the attached rolldoor; position 0 is fully open,
---the door height is fully closed. Most methods require the controller password (if one is set).
---@class ComponentOsRolldoorController : Component
local os_rolldoorcontroller = {}

---Returns a fixed greeting string (easter egg inherited by every OpenSecurity component). (signature inferred)
---@return string greeting
function os_rolldoorcontroller.greet()
end

---Returns true if the door is open.
---@return boolean open
function os_rolldoorcontroller.isOpen()
end

---Returns true if the door is moving.
---@return boolean moving
function os_rolldoorcontroller.isMoving()
end

---Returns the current position.
---@return number position
function os_rolldoorcontroller.getPosition()
end

---Sets a new position the rolldoor should move to (clamped to 0..height). Returns the new target position.
---@param position? number default: the current position
---@param password? string
---@return number|false target false if the password is wrong
---@return string? reason
function os_rolldoorcontroller.setPosition(position, password)
end

---Toggles the rolldoor between open and closed.
---@param password? string
---@return boolean success
---@return string message
function os_rolldoorcontroller.toggle(password)
end

---Opens the rolldoor.
---@param password? string
---@return boolean success
---@return string? reason
function os_rolldoorcontroller.open(password)
end

---Closes the rolldoor.
---@param password? string
---@return boolean success
---@return string? reason
function os_rolldoorcontroller.close(password)
end

---Sets the speed of the rolldoor (0.1-3) and returns the new speed.
---@param speed? number default: the current speed
---@param password? string
---@return number|false speed false if the password is wrong
---@return string? reason
function os_rolldoorcontroller.setSpeed(speed, password)
end

---Checks for space below the rolldoor and returns the new height.
---@param password? string
---@return integer|false height false if the password is wrong
---@return string? reason
function os_rolldoorcontroller.calibrate(password)
end

---Returns the heights of the rolldoor elements.
---@return integer[] heights
function os_rolldoorcontroller.getHeight()
end

---Sets a password for controlling the door; requires the old password if one is set.
---@param newPassword string
---@param oldPassword? string
---@return boolean success
---@return string? reason
function os_rolldoorcontroller.setPassword(newPassword, oldPassword)
end
