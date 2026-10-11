---@meta

---IndustrialCraft 2 Reactor Chamber (OpenComputers' IC2 integration). Gives access to the reactor the chamber belongs to.
---The casing blocks of a fluid reactor (pressure vessel, access hatch, fluid port, redstone port) also show up
---with this component type.
---@class ComponentReactorChamber : Component
local reactor_chamber = {}

---Gets the reactor's heat (0 if the chamber is not attached to a reactor).
---@return integer heat
function reactor_chamber.getHeat()
end

---Gets the reactor's maximum heat before exploding (0 if the chamber is not attached to a reactor).
---@return integer maxHeat
function reactor_chamber.getMaxHeat()
end

---Gets the reactor's energy output. Not multiplied with the base EU/t value.
---@return number output
function reactor_chamber.getReactorEnergyOutput()
end

---Gets the reactor's base EU/t value.
---@return number euOutput
function reactor_chamber.getReactorEUOutput()
end

---Gets whether the reactor is active and supposed to produce energy.
---@return boolean producing
function reactor_chamber.producesEnergy()
end
