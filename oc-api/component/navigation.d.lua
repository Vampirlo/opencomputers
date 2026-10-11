---@meta
-- Copyright (c) 2023, FatalMerlin
-- All rights reserved.
--
-- This source code is licensed under the BSD-style license found in the
-- LICENSE file in the root directory of this source tree.

---Navigation upgrade: position and facing of the device, relative to the center of the map used to craft the upgrade.\
---Component type: `navigation`.
---@class ComponentNavigation : Component
local navigation = {}

---Gets the current position of the device, relative to the center of the map used to craft the upgrade.\
---Returns `nil, "out of range"` if the device is outside the area covered by that map.
---@return number|nil x
---@return number y The Y coordinate (absolute); the error message if `x` is `nil`.
---@return number z
function navigation.getPosition() end

---Gets the current facing of the device, as one of the `sides` constants.
---@return integer side
function navigation.getFacing() end

---Gets the operational range of the upgrade: `getPosition()` fails once the X or Z coordinate exceeds it.
---@return integer range
function navigation.getRange() end

---Finds waypoint blocks within the specified range.
---@param range number
---@return NavigationWaypoint[]|nil waypoints
---@return string? reason `"not enough energy"`.
function navigation.findWaypoints(range) end

---A waypoint found by `navigation.findWaypoints`.
---@class NavigationWaypoint
---@field position number[] Offset `{x, y, z}` from the device to the waypoint.
---@field redstone integer Strength of the redstone signal the waypoint receives.
---@field label string The waypoint's label.
---@field address string The waypoint's component address.
