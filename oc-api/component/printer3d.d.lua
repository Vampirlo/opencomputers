---@meta
-- Copyright (c) 2023, FatalMerlin
-- All rights reserved.
--
-- This source code is licensed under the BSD-style license found in the
-- LICENSE file in the root directory of this source tree.

---3D printer: prints blocks made of shapes. Configure the model, then `commit` to print.\
---Shape coordinates are in the range 0-16 per axis.\
---Component type: `printer3d`.
---@class ComponentPrinter3D : Component
local printer3d = {}

---Resets the configuration of the printer and stops printing (the current job will finish).
function printer3d.reset() end

---Sets a label for the block being printed (at most 24 characters; `nil` removes it).
---@param value? string
function printer3d.setLabel(value) end

---Gets the current label for the block being printed.
---@return string|nil label
function printer3d.getLabel() end

---Sets a tooltip for the block being printed (at most 128 characters; `nil` removes it).
---@param value? string
function printer3d.setTooltip(value) end

---Gets the current tooltip for the block being printed.
---@return string|nil tooltip
function printer3d.getTooltip() end

---Sets the light level the printed block should emit (0 to the configured maximum).
---@param value number
function printer3d.setLightLevel(value) end

---Gets the light level the printed block should emit.
---@return integer level
function printer3d.getLightLevel() end

---Sets whether the printed block should emit redstone when in its active state: `true` emits strength 15, or pass a strength (0-15).
---@param value boolean|number
function printer3d.setRedstoneEmitter(value) end

---Gets whether the printed block should emit redstone when in its active state, and the redstone strength.
---@return boolean emitsRedstone
---@return integer strength
function printer3d.isRedstoneEmitter() end

---Sets whether the printed block should automatically return to its off state, like a button.
---@param value boolean
function printer3d.setButtonMode(value) end

---Gets whether the printed block should automatically return to its off state, like a button.
---@return boolean buttonMode
function printer3d.isButtonMode() end

---Sets whether the printed block should be collidable in its off and on state.
---@param collideOff boolean
---@param collideOn boolean
function printer3d.setCollidable(collideOff, collideOn) end

---Gets whether the printed block is collidable in its off and on state.
---@return boolean collideOff
---@return boolean collideOn
function printer3d.isCollidable() end

---Adds a shape to the printer's configuration, for the off state or (if `state` is `true`) for the on state.\
---`texture` is the name of a block texture; `tint` an optional RGB color (`0xRRGGBB`), which may also be passed in place of `state`.
---@param minX number
---@param minY number
---@param minZ number
---@param maxX number
---@param maxY number
---@param maxZ number
---@param texture string
---@param state? boolean Whether the shape is for the on state (default `false`).
---@param tint? number
---@return boolean|nil success
---@return string? reason `"model too complex"`.
---@overload fun(minX: number, minY: number, minZ: number, maxX: number, maxY: number, maxZ: number, texture: string, tint: number): boolean|nil, string?
function printer3d.addShape(minX, minY, minZ, maxX, maxY, maxZ, texture, state, tint) end

---Gets the number of shapes in the current configuration, for the off and the on state.
---@return integer offCount
---@return integer onCount
function printer3d.getShapeCount() end

---Gets the maximum allowed number of shapes (per state).
---@return integer max
function printer3d.getMaxShapeCount() end

---Commits and begins printing the current configuration, `count` times (default `1`).
---@param count? number
---@return boolean|nil success
---@return string? reason `"model invalid"`.
function printer3d.commit(count) end

---Gets the current state of the printer: `"busy"` followed by the progress in percent (0-100),\
---or `"idle"` followed by whether the current model is valid.
---@return "busy"|"idle" status
---@return number|boolean progressOrValid
function printer3d.status() end
