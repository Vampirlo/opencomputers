---@meta
-- Copyright (c) 2023, FatalMerlin
-- All rights reserved.
--
-- This source code is licensed under the BSD-style license found in the
-- LICENSE file in the root directory of this source tree.

---Net splitter: connects networks like a cable, but each of its faces can be opened or closed. A redstone signal inverts the faces.\
---Component type: `net_splitter`.
---@class ComponentNetSplitter : Component
local net_splitter = {}

---Opens the specified side. Returns `true` if it changed to open.
---@param side number
---@return boolean|nil changed
---@return string? reason `"invalid direction"`.
function net_splitter.open(side) end

---Closes the specified side. Returns `true` if it changed to closed.
---@param side number
---@return boolean|nil changed
---@return string? reason `"invalid direction"`.
function net_splitter.close(side) end

---Returns the current open state of all sides, indexed by side (0-5).
---@return table<integer, boolean> sides
function net_splitter.getSides() end

---Sets the open state of all sides from a table indexed by side (0-5); missing entries mean closed. Returns the previous states.
---@param settings table<integer, boolean>
---@return table<integer, boolean> previous
function net_splitter.setSides(settings) end
