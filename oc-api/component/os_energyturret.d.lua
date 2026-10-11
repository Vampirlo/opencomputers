---@meta

---Energy Turret (OpenSecurity). Must be powered on (`powerOn`) and armed (`setArmed(true)`) before it can fire.
---@class ComponentOsEnergyTurret : Component
local os_energyturret = {}

---Returns a fixed greeting string (easter egg inherited by every OpenSecurity component). (signature inferred)
---@return string greeting
function os_energyturret.greet()
end

---Current real yaw.
---@return number yaw
function os_energyturret.getYaw()
end

---Current real pitch.
---@return number pitch
function os_energyturret.getPitch()
end

---Returns whether the gun has reached the set position, and the remaining angle difference.
---@return boolean onTarget
---@return number delta
function os_energyturret.isOnTarget()
end

---Returns whether the gun is ready to fire again (cooled down and armed).
---@return boolean ready
function os_energyturret.isReady()
end

---Returns whether the gun is powered.
---@return boolean powered
function os_energyturret.isPowered()
end

---Extends the gun shaft (0-2, limited by the available space). Returns the new target length.
---@param length number
---@return number length
function os_energyturret.extendShaft(length)
end

---Returns the current gun shaft extension.
---@return number length
function os_energyturret.getShaftLength()
end

---Changes the gun's setpoint in degrees (yaw 0..360, pitch -45..90).
---@param yaw number
---@param pitch number
---@return boolean success false if powered off
---@return string? reason
function os_energyturret.moveTo(yaw, pitch)
end

---Changes the gun's setpoint relative to the current yaw and pitch, in degrees.
---@param yaw number
---@param pitch number
---@return boolean success false if powered off
---@return string? reason
function os_energyturret.moveBy(yaw, pitch)
end

---Changes the gun's setpoint in radians.
---@param yaw number
---@param pitch number
---@return boolean success false if powered off
---@return string? reason
function os_energyturret.moveToRadians(yaw, pitch)
end

---Arms or disarms the gun. (signature inferred)
---@param armed boolean
---@return boolean success always true
function os_energyturret.setArmed(armed)
end

---Powers the turret on. (signature inferred)
---@return boolean success always true
function os_energyturret.powerOn()
end

---Powers the turret off (resets yaw and pitch). (signature inferred)
---@return boolean success always true
function os_energyturret.powerOff()
end

---Fires the gun. More damage (upgrades) means longer cooldown and more energy draw.
---Returns true on success, or false and a message (powered off, not armed, not cooled down, not enough energy).
---@return boolean success
---@return string? reason
function os_energyturret.fire()
end
