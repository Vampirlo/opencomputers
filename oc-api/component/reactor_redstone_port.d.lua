---@meta

---IndustrialCraft 2 Reactor Redstone Port of a fluid (5x5x5) reactor (OpenComputers' IC2 integration).
---Gives access to the reactor the port belongs to.
---Note: the reactor chamber driver also matches this block and wins the name tie, so in game the port is listed
---as `reactor_chamber` (with the same methods, implemented as documented here).
---@class ComponentReactorRedstonePort : Component
local reactor_redstone_port = {}

---Gets the reactor's heat (0 if the port is not part of a reactor).
---@return integer heat
function reactor_redstone_port.getHeat()
end

---Gets the reactor's maximum heat before exploding (0 if the port is not part of a reactor).
---@return integer maxHeat
function reactor_redstone_port.getMaxHeat()
end

---Gets the reactor's energy output. Not multiplied with the base EU/t value.
---@return number output
function reactor_redstone_port.getReactorEnergyOutput()
end

---Gets the reactor's base EU/t value (false if the port is not part of a reactor).
---@return number|false euOutput
function reactor_redstone_port.getReactorEUOutput()
end

---Gets whether the reactor is active and supposed to produce energy.
---@return boolean producing
function reactor_redstone_port.producesEnergy()
end
