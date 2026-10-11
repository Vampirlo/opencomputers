---@meta

---Vanilla beacon, accessed through an adapter block.\
---Component type: `beacon`.
---@class ComponentBeacon : Component
local beacon = {}

---Gets the number of levels (pyramid layers) of this beacon.
---@return integer levels
function beacon.getLevels() end

---Gets the name of the active primary effect, e.g. `"effect.moveSpeed"`.
---@return string|nil effect The effect name, or `nil` if none.
function beacon.getPrimaryEffect() end

---Gets the name of the active secondary effect.
---@return string|nil effect The effect name, or `nil` if none.
function beacon.getSecondaryEffect() end
