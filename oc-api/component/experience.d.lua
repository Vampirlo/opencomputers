---@meta
-- Copyright (c) 2023, FatalMerlin
-- All rights reserved.
--
-- This source code is licensed under the BSD-style license found in the
-- LICENSE file in the root directory of this source tree.

---Experience upgrade: collects experience, which makes the robot or drone more efficient.\
---Component type: `experience`.
---@class ComponentExperience : Component
local experience = {}

---Gets the current level of experience stored in this experience upgrade (with the progress to the next level as fraction).
---@return number level
function experience.level() end

---Tries to consume an enchanted item or a bottle o' enchanting in the selected slot to add experience to the upgrade.
---@return boolean|nil success
---@return string? reason E.g. `"no item"`, `"max level"` or `"could not extract experience from item"`.
function experience.consume() end
