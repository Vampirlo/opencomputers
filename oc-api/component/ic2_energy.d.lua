---@meta

---IndustrialCraft 2 energy information (OpenComputers' IC2 integration), available through an adapter on any IC2
---block with an energy buffer (BatBox, MFE, MFSU, machines, generators...).
---"ic2_energy" is only the driver's internal name: in game the component type is named after the block,
---e.g. `ic2_te_mfsu` or `ic2_te_batbox`, so get such proxies via `component.proxy(address)`.
---@class ComponentIC2Energy : Component
local ic2_energy = {}

---Gets the energy buffer capacity in EU. (signature inferred)
---@return number capacity
function ic2_energy.getCapacity()
end

---Gets the stored energy in EU. (signature inferred)
---@return number energy
function ic2_energy.getEnergy()
end

---Gets the sink (input) tier of the block. (signature inferred)
---@return integer tier
function ic2_energy.getSinkTier()
end

---Gets the source (output) tier of the block. (signature inferred)
---@return integer tier
function ic2_energy.getSourceTier()
end
