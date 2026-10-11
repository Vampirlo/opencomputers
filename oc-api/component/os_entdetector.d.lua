---@meta

---Entity Detector (OpenSecurity). Also available as an upgrade.
---Each scan also sends one signal `entityDetect(address, name, range, x, y, z)` per found entity.
---@class ComponentOsEntDetector : Component
local os_entdetector = {}

---An entity found by `scanPlayers`/`scanEntities`. Coordinates are relative to the detector.
---@class OsEntDetectorEntry
---@field name string player display name or entity name
---@field range number distance to the detector
---@field height number entity height
---@field x integer
---@field y integer
---@field z integer

---Returns a fixed greeting string (easter egg inherited by every OpenSecurity component). (signature inferred)
---@return string greeting
function os_entdetector.greet()
end

---Scans for players in range and pushes an `entityDetect` signal for each. The range is capped by the config
---and is remembered for later scans. Costs 5 energy per block of range.
---@param range? number
---@return OsEntDetectorEntry[]|false entities false if there is not enough energy
---@return string? reason
function os_entdetector.scanPlayers(range)
end

---Scans for entities (excluding players) in range and pushes an `entityDetect` signal for each. The range is capped
---by the config and is remembered for later scans. Costs 5 energy per block of range.
---@param range? number
---@return OsEntDetectorEntry[]|false entities false if there is not enough energy
---@return string? reason
function os_entdetector.scanEntities(range)
end
