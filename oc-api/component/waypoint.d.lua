---@meta

---Waypoint block: a labeled marker that navigation upgrades can find (see `navigation.findWaypoints`).\
---Component type: `waypoint`.
---@class ComponentWaypoint : Component
local waypoint = {}

---Gets the current label of this waypoint.
---@return string label
function waypoint.getLabel() end

---Sets the label of this waypoint (at most 32 characters).
---@param value string
function waypoint.setLabel(value) end
