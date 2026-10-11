---@meta

---IndustrialCraft 2 cable information (OpenComputers' IC2 integration), available through an adapter next to a cable.
---"energy_conductor" is only the driver's internal name: in game the component type is derived from the block name,
---so get such proxies via `component.proxy(address)`.
---@class ComponentEnergyConductor : Component
local energy_conductor = {}

---Gets the energy loss of the cable, in EU per block. (signature inferred)
---@return number loss
function energy_conductor.getConductionLoss()
end

---Gets the amount of EU/t at which the cable itself melts. (signature inferred)
---@return number energy
function energy_conductor.getConductorBreakdownEnergy()
end

---Gets the amount of EU/t at which the cable insulation breaks. (signature inferred)
---@return number energy
function energy_conductor.getInsulationBreakdownEnergy()
end

---Gets the amount of EU/t the insulation can absorb before it shocks nearby entities. (signature inferred)
---@return number energy
function energy_conductor.getInsulationEnergyAbsorption()
end
