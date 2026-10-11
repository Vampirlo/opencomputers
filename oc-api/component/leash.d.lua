---@meta
-- Copyright (c) 2023, FatalMerlin
-- All rights reserved.
--
-- This source code is licensed under the BSD-style license found in the
-- LICENSE file in the root directory of this source tree.

---Leash upgrade: leashes animals to a drone.\
---Component type: `leash`.
---@class ComponentLeash : Component
local leash = {}

---Tries to put an entity on the specified side of the device onto a leash.
---@param side number
---@return boolean|nil success
---@return string? reason `"too many leashed entities"` or `"no unleashed entity"`.
function leash.leash(side) end

---Unleashes all currently leashed entities.
function leash.unleash() end
