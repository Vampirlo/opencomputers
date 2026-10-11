---@meta

---Vanilla redstone comparator, accessed through an adapter block.\
---Component type: `comparator`.
---@class ComponentComparator : Component
local comparator = {}

---Gets the strength of the comparator's output signal.
---@return integer strength
function comparator.getOutputSignal() end
