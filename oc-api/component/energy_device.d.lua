---@meta

---Any block that stores Forge Energy (RF), accessed through an adapter block (the side touching the adapter).\
---Component type: `energy_device` (unless another driver for the block provides a more specific name).
---@class ComponentEnergyDevice : Component
local energy_device = {}

---Returns the amount of stored energy on the connected side.
---@return integer energy
function energy_device.getEnergyStored() end

---Returns the maximum amount of stored energy on the connected side.
---@return integer energy
function energy_device.getMaxEnergyStored() end

---Returns whether this block can have energy extracted from the connected side.
---@return boolean canExtract
function energy_device.canExtract() end

---Returns whether this block can receive energy on the connected side.
---@return boolean canReceive
function energy_device.canReceive() end
