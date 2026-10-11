---@meta

---Nano Fog Terminal (OpenSecurity). Builds and configures nano fog blocks (up to 256, within 32 blocks).
---All coordinates are relative to the terminal. Building a block consumes energy and one Nano DNA from the material slot.
---@class ComponentOsNanoFogTerminal : Component
local os_nanofog_terminal = {}

---Returns a fixed greeting string (easter egg inherited by every OpenSecurity component). (signature inferred)
---@return string greeting
function os_nanofog_terminal.greet()
end

---Returns the item stack in the material buffer slot.
---@return table stack item stack description
function os_nanofog_terminal.getMaterial()
end

---Returns the locations of the fog blocks managed by this terminal.
---@return table locations
function os_nanofog_terminal.getBlocks()
end

---Builds a fog block at the given position, camouflaged as `material` (a block name such as "minecraft:stone").
---If there already is a fog block there, only its camouflage is updated.
---@param x number
---@param y number
---@param z number
---@param material string block name
---@param metaindex? number block metadata, default 0
---@return boolean success
---@return string? reason
function os_nanofog_terminal.set(x, y, z, material, metaindex)
end

---Builds fog blocks in the area between the two corners, camouflaged as `material`.
---@param x1 number
---@param y1 number
---@param z1 number
---@param x2 number
---@param y2 number
---@param z2 number
---@param material string block name
---@param metaindex? number block metadata, default 0
---@return table|false results one `{success, reason?}` table per block
---@return string? reason
function os_nanofog_terminal.setArea(x1, y1, z1, x2, y2, z2, material, metaindex)
end

---Disassembles the fog blocks in the area between the two corners.
---The terminal requires at least 7 arguments, so pass a (ignored) material name.
---@param x1 number
---@param y1 number
---@param z1 number
---@param x2 number
---@param y2 number
---@param z2 number
---@param material string ignored, but must be present
---@param metaindex? number ignored
---@return table|false results one boolean per block (true if a fog block was removed)
---@return string? reason
function os_nanofog_terminal.resetArea(x1, y1, z1, x2, y2, z2, material, metaindex)
end

---Sets a fog block to solid.
---@param x number
---@param y number
---@param z number
---@return boolean success false if there is no fog block
function os_nanofog_terminal.setSolid(x, y, z)
end

---Sets a fog block to shield mode (entities can pass according to its filters).
---@param x number
---@param y number
---@param z number
---@return boolean success false if there is no fog block
function os_nanofog_terminal.setShield(x, y, z)
end

---Sets the knockback power of a fog block (0-2).
---@param x number
---@param y number
---@param z number
---@param power number
---@return boolean success false if there is no fog block
function os_nanofog_terminal.setKnockback(x, y, z, power)
end

---Sets the damage power of a fog block (0-5).
---@param x number
---@param y number
---@param z number
---@param power number
---@return boolean success false if there is no fog block
function os_nanofog_terminal.setDamage(x, y, z, power)
end

---Returns the names of all available entity classes (usable as filter type in `setFilter`).
---@return string[] names
function os_nanofog_terminal.getEntityClassNames()
end

---Sets an entity filter on a fog block. `filterType` is "player", "hostile", "animal", "item", "all" or an entity class name.
---`passEntity` adds (true) or removes (false) the pass permission, `damageEntity` does the same for the damage filter.
---`name` restricts the filter to entities with that name.
---@param x number
---@param y number
---@param z number
---@param filterType string
---@param passEntity boolean
---@param damageEntity? boolean default false
---@param name? string default ""
---@return boolean success false if there is no fog block
function os_nanofog_terminal.setFilter(x, y, z, filterType, passEntity, damageEntity, name)
end

---Returns the pass filter of a fog block: one `{className, names}` table per filtered entity class
---(as separate return values), or false and a message if there is no fog block.
---@param x number
---@param y number
---@param z number
---@return any ...
function os_nanofog_terminal.getFilterPass(x, y, z)
end

---Returns the damage filter of a fog block: one `{className, names}` table per filtered entity class
---(as separate return values), or false and a message if there is no fog block.
---@param x number
---@param y number
---@param z number
---@return any ...
function os_nanofog_terminal.getFilterDamage(x, y, z)
end

---Returns the block type at the given position: "nanoFog" or "unknown".
---@param x number
---@param y number
---@param z number
---@return string blockType
function os_nanofog_terminal.get(x, y, z)
end

---Disassembles a fog block.
---@param x number
---@param y number
---@param z number
---@return boolean success
---@return string? reason
function os_nanofog_terminal.reset(x, y, z)
end

---Disassembles all fog blocks of this terminal.
---@return boolean success
function os_nanofog_terminal.resetAll()
end
