---@meta
-- Copyright (c) 2023, FatalMerlin
-- All rights reserved.
--
-- This source code is licensed under the BSD-style license found in the
-- LICENSE file in the root directory of this source tree.

---Chunkloader upgrade: keeps the chunk of the device loaded while it is active.\
---Component type: `chunkloader`.
---@class ComponentChunkloader : Component
local chunkloader = {}

---Gets whether the chunkloader is currently active.
---@return boolean active
function chunkloader.isActive() end

---Enables or disables the chunkloader. Returns `true` if the state changed.\
---Enabling fails (returns `false`) if no chunk loading ticket could be acquired.
---@param enabled boolean
---@return boolean|nil changed
---@return string? reason `"this dimension is blacklisted"`.
function chunkloader.setActive(enabled) end
