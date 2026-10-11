---@meta

---Any fluid tank block implementing Forge's `IFluidTank`, accessed through an adapter block via OpenComputers' generic tank driver.\
---Only available if `enableTankDriver` is enabled in the OpenComputers config (disabled by default).\
---The component type is derived from the block, so use `component.proxy(address)` with this class.
---@class ComponentFluidTank : Component
local fluid_tank = {}

---Gets information about this tank.
---@return FluidTankInfo info
function fluid_tank.getInfo() end
