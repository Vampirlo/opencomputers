---@meta
-- Copyright (c) 2023, FatalMerlin
-- All rights reserved.
--
-- This source code is licensed under the BSD-style license found in the
-- LICENSE file in the root directory of this source tree.

---Generator upgrade: burns fuel items to produce energy for the robot or drone it is installed in.\
---Component type: `generator`.
---@class ComponentGenerator : Component
local generator = {}

---Inserts up to `count` fuel items (default `64`) from the selected slot into the generator's queue.\
---Failure reasons include `"selected slot is empty"`, `"selected slot does not contain fuel"`, `"different fuel type already queued"` and `"queue is full"`.
---@param count? number
---@return boolean|nil success
---@return integer|string countOrReason The number of inserted items, or why nothing was inserted.
function generator.insert(count) end

---Gets the number of fuel items in the generator's queue, and their display name.
---@return integer count
---@return string? name The display name of the queued fuel, if any.
function generator.count() end

---Removes up to `count` fuel items (default: all) from the generator's queue and puts them into the robot's inventory.
---@param count? number
---@return boolean success
---@return integer|string countOrReason The number of removed items, or why nothing was removed, e.g. `"queue is empty"`.
function generator.remove(count) end
