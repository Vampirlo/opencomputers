---@meta

---Geolyzer, as a block or upgrade: scans block hardness in the area around it and analyzes adjacent blocks.\
---Component type: `geolyzer`.
---@class ComponentGeolyzer : Component
local geolyzer = {}

---Analyzes the hardness ("density") of the blocks in an area at the specified offset relative to the geolyzer\
---(absolute directions: offsets are not affected by a robot's facing).\
---`scan(x, z)` scans the column at (`x`, `z`) from y = -32 to 31; `scan(x, z, y, w, d, h)` scans the area starting at (`x`, `y`, `z`)\
---extending `w` blocks towards +x, `d` towards +z and `h` towards +y (at most 64 blocks).\
---The result always has 64 values, ordered x first, then z, then y; values beyond the scanned volume should be ignored.\
---Values get noisier with the distance to the geolyzer. Unloaded/air blocks are `0`.\
---The last argument is either `ignoreReplaceable` (boolean) or an options table `{includeReplaceable = boolean}`.
---@param x number
---@param z number
---@param y number
---@param w number Width (towards +x).
---@param d number Depth (towards +z).
---@param h number Height (towards +y).
---@param options? boolean|{includeReplaceable: boolean} `ignoreReplaceable`, or an options table.
---@return number[]|nil hardness
---@return string? reason E.g. `"not enough energy"`.
---@overload fun(x: number, z: number, options?: boolean|{includeReplaceable: boolean}): number[]|nil, string?
function geolyzer.scan(x, z, y, w, d, h, options) end

---Gets some information on a directly adjacent block. Consumes as much energy as a call to `scan`.\
---Can be disabled with the `misc.allowItemStackInspection` config setting.
---@param side number
---@param options? table
---@return GeolyzerBlockInfo|nil info
---@return string? reason E.g. `"not enough energy"` or `"not enabled in config"`.
function geolyzer.analyze(side, options) end

---Stores an item stack representation of the block on the specified side in the specified slot of a database component.\
---Returns `true` if the database slot was occupied before.
---@param side number
---@param dbAddress string
---@param dbSlot number
---@return boolean|nil overwritten
---@return string? reason E.g. `"not enough energy"` or `"block has no registered item representation"`.
function geolyzer.store(side, dbAddress, dbSlot) end

---Checks the contents of the block on the specified side.\
---Returns whether a robot would be blocked moving there, and what is there: `"entity"`, `"solid"`, `"replaceable"`, `"liquid"`, `"passable"` or `"air"`.
---@param side number
---@return boolean blocked
---@return string kind
function geolyzer.detect(side) end

---Returns whether there is a clear line of sight to the sky directly above. Transparent blocks, e.g. glass, don't block it.
---@return boolean canSeeSky
function geolyzer.canSeeSky() end

---Returns whether the sun is currently visible directly above: it must be day, the sky visible and it must not rain.
---@return boolean sunVisible
function geolyzer.isSunVisible() end

---Information about a block, returned by `geolyzer.analyze`.
---@class GeolyzerBlockInfo
---@field name string Block name, e.g. `"minecraft:dirt"`.
---@field metadata integer
---@field hardness number
---@field harvestLevel integer
---@field harvestTool string|nil E.g. `"pickaxe"`.
---@field color integer Map color of the block.
---@field properties table<string, any> Block state properties.
---@field growth? number Growth progress (0-1) of crops and similar plants.
---@field id? integer Numeric block ID (only if `insertIdsInConverters` is enabled in the config).
