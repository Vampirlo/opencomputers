---@meta
-- Copyright (c) 2023, FatalMerlin
-- All rights reserved.
--
-- This source code is licensed under the BSD-style license found in the
-- LICENSE file in the root directory of this source tree.

---Crafting upgrade: crafts using the 3x3 area in the top left of the robot's inventory (slots 1-3, 5-7, 9-11) as crafting grid.\
---Component type: `crafting`.
---@class ComponentCrafting : Component
local crafting = {}

---Tries to craft up to `count` items (default and maximum `64`) from the recipe in the crafting grid.\
---The result is put into the selected slot, or the next free or matching slot.\
---Returns whether anything was crafted and the number of crafted items.
---@param count? number
---@return boolean success
---@return integer count
function crafting.craft(count) end
