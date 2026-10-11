---@meta

---Vanilla furnace, accessed through an adapter block.\
---Component type: `furnace`.
---@class ComponentFurnace : Component
local furnace = {}

---Gets the number of ticks that the furnace will keep burning from the last consumed fuel.
---@return integer ticks
function furnace.getBurnTime() end

---Gets the number of ticks that the currently burning fuel lasts in total.
---@return integer ticks
function furnace.getCurrentItemBurnTime() end

---Gets the number of ticks that the current item has been cooking for.
---@return integer ticks
function furnace.getCookTime() end

---Gets the number of ticks that the current item needs to cook.
---@return integer ticks
function furnace.getTotalCookTime() end

---Gets whether the furnace is currently burning.
---@return boolean burning
function furnace.isBurning() end
