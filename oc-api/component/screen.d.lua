---@meta
-- Copyright (c) 2023, FatalMerlin
-- All rights reserved.
--
-- This source code is licensed under the BSD-style license found in the
-- LICENSE file in the root directory of this source tree.

---Screen, either a screen block or the screen of a robot or tablet. Bind a GPU to it to draw on it.\
---Component type: `screen`.
---@class ComponentScreen : Component
local screen = {}

---Returns whether the screen is currently on.
---@return boolean isOn
function screen.isOn() end

---Turns the screen on.
---@return boolean changed `true` if the screen was off.
---@return boolean isOn The new power state.
function screen.turnOn() end

---Turns the screen off.
---@return boolean changed `true` if the screen was on.
---@return boolean isOn The new power state.
function screen.turnOff() end

---The aspect ratio of the screen. For multi-block screens this is the number of blocks, horizontal and vertical.
---@return number width
---@return number height
function screen.getAspectRatio() end

---Returns the addresses of the keyboards attached to the screen.
---@return string[] addresses
function screen.getKeyboards() end

---Returns whether the screen is in high precision mode (sub-pixel mouse event positions).
---@return boolean enabled
function screen.isPrecise() end

---Sets whether to use high precision mode (sub-pixel mouse event positions). Only supported by tier 3 screens.
---@param enabled boolean
---@return boolean|nil oldValue The previous setting, or `nil` if not supported.
---@return string? reason `"unsupported operation"`.
function screen.setPrecise(enabled) end

---Returns whether touch mode is inverted (sneak-activate opens the GUI, instead of normal activate).\
---Only available on screen blocks.
---@return boolean inverted
function screen.isTouchModeInverted() end

---Sets whether to invert touch mode (sneak-activate opens the GUI, instead of normal activate). Returns the previous value.\
---Only available on screen blocks.
---@param value boolean
---@return boolean oldValue
function screen.setTouchModeInverted(value) end
