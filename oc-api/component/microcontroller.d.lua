---@meta
-- Copyright (c) 2023, FatalMerlin
-- All rights reserved.
--
-- This source code is licensed under the BSD-style license found in the
-- LICENSE file in the root directory of this source tree.

---Microcontroller block, as seen by adjacent computers (and itself).\
---Component type: `microcontroller`.
---@class ComponentMicrocontroller : Component
local microcontroller = {}

---Starts the microcontroller. Returns `true` if the state changed.
---@return boolean changed
function microcontroller.start() end

---Stops the microcontroller. Returns `true` if the state changed.
---@return boolean changed
function microcontroller.stop() end

---Returns whether the microcontroller is running.
---@return boolean running
function microcontroller.isRunning() end

---Returns the reason the microcontroller crashed, if applicable.
---@return string|nil error
function microcontroller.lastError() end

---Gets whether network messages are sent via the specified side (any side except the front).
---@param side number
---@return boolean open
function microcontroller.isSideOpen(side) end

---Sets whether network messages are sent via the specified side (any side except the front). Returns the previous value.
---@param side number
---@param open boolean
---@return boolean wasOpen
function microcontroller.setSideOpen(side, open) end
