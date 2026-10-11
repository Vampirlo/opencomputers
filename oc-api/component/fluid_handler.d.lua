---@meta

---Any block with fluid tanks (Forge fluid handler capability), accessed through an adapter block via OpenComputers' generic tank driver.\
---Only available if `enableTankDriver` is enabled in the OpenComputers config (disabled by default).\
---The component type is derived from the block, so use `component.proxy(address)` with this class.
---@class ComponentFluidHandler : Component
local fluid_handler = {}

---Gets information about the tanks accessible from the side touching the adapter: one description per tank, as multiple return values.
---@return FluidTankInfo ...
function fluid_handler.getTankInfo() end
