---@meta

---IndustrialCraft 2 Mass Fabricator (OpenComputers' IC2 integration), accessed through an adapter.
---Also offers the IC2 energy methods (`getEnergy`, `getCapacity`, ...).
---@class ComponentMassFab : ComponentIC2Energy
local mass_fab = {}

---Gets the progress of the current UU-matter production in percent (0-100). (signature inferred)
---@return number progress
function mass_fab.getProgress()
end
