---@meta

---Vanilla mob spawner, accessed through an adapter block.\
---Component type: `mob_spawner`.
---@class ComponentMobSpawner : Component
local mob_spawner = {}

---Gets the name of the entity that is being spawned by this spawner, e.g. `"minecraft:pig"`.
---@return string|nil name
function mob_spawner.getSpawningMobName() end
