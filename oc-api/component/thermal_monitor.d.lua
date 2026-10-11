---@meta

---Thermal Monitor or Remote Thermal Monitor (Energy Control). Watches the heat of a reactor and emits redstone at or above a heat level.
---@class ComponentThermalMonitor : Component
local thermal_monitor = {}

---Gets the status: 1 = heat is at or above the heat level, 0 = below, -2 = no reactor found, -1 = not checked yet.
---@return integer status
function thermal_monitor.getStatus()
end

---Gets the reactor heat level (threshold).
---@return integer heatLevel
function thermal_monitor.getHeatLevel()
end

---Sets the reactor heat level (threshold), 1-999999; other values are ignored.
---@param heatLevel number
function thermal_monitor.setHeatLevel(heatLevel)
end
