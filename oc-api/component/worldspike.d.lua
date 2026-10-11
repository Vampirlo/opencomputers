---@meta

---Railcraft Worldspike (chunk loader), accessed through an adapter (OpenComputers' Railcraft integration).
---@class ComponentWorldspike : Component
local worldspike = {}

---Gets the amount of fuel.
---@return integer fuel
function worldspike.getFuel()
end

---Gets the worldspike owner's name, or nothing if unknown.
---@return string? owner
function worldspike.getOwner()
end

---Gets the worldspike type: "world", "admin", "personal" or "passive" ("missing" if unknown).
---@return string type
function worldspike.getType()
end

---Gets the contents of the fuel slot as an item stack table, or nothing if this worldspike type needs no fuel.
---@return table? stack
function worldspike.getFuelSlotContents()
end

---Returns whether the worldspike is disabled (powered by redstone).
---@return boolean disabled
function worldspike.isDisabled()
end
