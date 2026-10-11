---@meta

---IndustrialCraft 2 Nuclear Reactor (OpenComputers' IC2 integration), accessed through an adapter next to the reactor.
---@class ComponentReactor : Component
local reactor = {}

---Gets the reactor's heat.
---@return integer heat
function reactor.getHeat()
end

---Gets the reactor's maximum heat before exploding.
---@return integer maxHeat
function reactor.getMaxHeat()
end

---Gets the reactor's energy output. Not multiplied with the base EU/t value.
---@return number output
function reactor.getReactorEnergyOutput()
end

---Gets the reactor's base EU/t value.
---@return number euOutput
function reactor.getReactorEUOutput()
end

---Gets whether the reactor is active and supposed to produce energy.
---@return boolean producing
function reactor.producesEnergy()
end
