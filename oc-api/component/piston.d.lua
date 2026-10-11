---@meta
-- Copyright (c) 2023, FatalMerlin
-- All rights reserved.
--
-- This source code is licensed under the BSD-style license found in the
-- LICENSE file in the root directory of this source tree.

---Piston upgrade (or sticky piston upgrade): pushes, and if sticky also pulls, blocks.\
---Component type: `piston`.
---@class ComponentPiston : Component
local piston = {}

---Returns `true` if the piston is sticky, i.e. it can also pull.
---@return boolean sticky
function piston.isSticky() end

---Tries to push the block on the specified side of the device (default: front).
---@param side? number
---@return boolean success
---@return string? reason E.g. `"move failed"`.
function piston.push(side) end

---Tries to pull the block on the specified side of the device (default: front), like a vanilla sticky piston. Sticky piston upgrade only.
---@param side? number
---@return boolean success
---@return string? reason E.g. `"path is obstructed"` or `"move failed"`.
function piston.pull(side) end
