---@meta
-- Copyright (c) 2023, FatalMerlin
-- All rights reserved.
--
-- This source code is licensed under the BSD-style license found in the
-- LICENSE file in the root directory of this source tree.

---Tractor beam upgrade: picks up item entities around the device.\
---Component type: `tractor_beam`.
---@class ComponentTractorBeam : Component
local tractor_beam = {}

---Tries to pick up a random item entity in the device's vicinity (within 3 blocks). Returns `true` if an item was picked up.
---@return boolean success
function tractor_beam.suck() end
