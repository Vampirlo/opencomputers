---@meta
-- Copyright (c) 2023, FatalMerlin
-- All rights reserved.
--
-- This source code is licensed under the BSD-style license found in the
-- LICENSE file in the root directory of this source tree.

---Hologram projector: displays a 48x32x48 (x, y, z) voxel volume. Coordinates are 1-based.\
---Voxel values are palette indexes: `0` is empty, `1` to `maxDepth()` colors (tier 1: 1 color, tier 2: 3 colors); `true`/`false` mean `1`/`0`.\
---Component type: `hologram`.
---@class ComponentHologram : Component
local hologram = {}

---Clears the hologram.
function hologram.clear() end

---Returns the value of the specified voxel.
---@param x number
---@param y number
---@param z number
---@return integer value
function hologram.get(x, y, z) end

---Sets the value of the specified voxel.
---@param x number
---@param y number
---@param z number
---@param value number|boolean
function hologram.set(x, y, z, value) end

---Fills an interval of the column at (`x`, `z`) with the specified value: the voxels from `minY` (default `1`) to `maxY`, inclusive.\
---Voxels outside the interval are not changed.
---@param x number
---@param z number
---@param minY number
---@param maxY number
---@param value number|boolean
---@overload fun(x: number, z: number, maxY: number, value: number|boolean)
function hologram.fill(x, z, minY, maxY, value) end

---Sets the whole volume at once from a string where each byte is a voxel value. Nesting is x, z, y (y changes fastest).
---@param data string
function hologram.setRaw(data) end

---Copies an area of columns by the specified translation.
---@param x number
---@param z number
---@param sx number Width of the area (x).
---@param sz number Depth of the area (z).
---@param tx number Translation along x.
---@param tz number Translation along z.
function hologram.copy(x, z, sx, sz, tx, tz) end

---Returns the render scale of the hologram.
---@return number scale
function hologram.getScale() end

---Sets the render scale, from 0.33 (fits a single block) up to 3 (tier 1) or 4 (tier 2). A larger scale consumes more energy.
---@param value number
function hologram.setScale(value) end

---Returns the relative render projection offsets of the hologram.
---@return number x
---@return number y
---@return number z
function hologram.getTranslation() end

---Sets the relative render projection offsets of the hologram. The maximum translation depends on the tier;\
---units are the hologram's size, so the distance scales with `setScale`.
---@param x number
---@param y number
---@param z number
function hologram.setTranslation(x, y, z) end

---The color depth supported by the hologram: `1` for tier 1, `2` for tier 2.
---@return integer depth
function hologram.maxDepth() end

---Gets the RGB color defined for the specified value.
---@param index number Palette index, 1 to the number of colors.
---@return integer color
function hologram.getPaletteColor(index) end

---Sets the RGB color defined for the specified value. Returns the previous color.
---@param index number Palette index, 1 to the number of colors.
---@param value number RGB color (`0xRRGGBB`).
---@return integer oldColor
function hologram.setPaletteColor(index, value) end

---Sets the base rotation of the displayed hologram: `angle` degrees around the axis (`x`, `y`, `z`). Tier 2 only.
---@param angle number
---@param x number
---@param y number
---@param z number
---@return boolean|nil success
---@return string? reason `"not supported"`.
function hologram.setRotation(angle, x, y, z) end

---Sets the rotation speed of the displayed hologram: `speed` degrees per second around the axis (`x`, `y`, `z`). Tier 2 only.
---@param speed number
---@param x number
---@param y number
---@param z number
---@return boolean|nil success
---@return string? reason `"not supported"`.
function hologram.setRotationSpeed(speed, x, y, z) end

---Gets the dimensions of the x, y and z axes.
---@return integer x
---@return integer y
---@return integer z
function hologram.getDimensions() end
