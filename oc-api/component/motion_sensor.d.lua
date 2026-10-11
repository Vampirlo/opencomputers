---@meta
-- Copyright (c) 2023, FatalMerlin
-- All rights reserved.
--
-- This source code is licensed under the BSD-style license found in the
-- LICENSE file in the root directory of this source tree.

---Motion sensor: queues a `motion` signal (`address, relativeX, relativeY, relativeZ, entityName`) when an entity\
---in its line of sight (within 8 blocks) moves faster than the sensitivity threshold.\
---Component type: `motion_sensor`.
---@class ComponentMotionSensor : Component
local motion_sensor = {}

---Gets the current sensitivity of the sensor, i.e. the speed threshold (distance / second) at which it triggers.
---@return number sensitivity
function motion_sensor.getSensitivity() end

---Sets the sensor's sensitivity (at least 0.2). Returns the old value.
---@param value number
---@return number oldValue
function motion_sensor.setSensitivity(value) end
