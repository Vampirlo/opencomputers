---@meta

---Vanilla brewing stand, accessed through an adapter block.\
---Component type: `brewing_stand`.
---@class ComponentBrewingStand : Component
local brewing_stand = {}

---Gets the number of ticks remaining of the current brewing operation.
---@return integer ticks
function brewing_stand.getBrewTime() end
