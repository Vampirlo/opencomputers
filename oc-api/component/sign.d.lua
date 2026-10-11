---@meta
-- Copyright (c) 2023, FatalMerlin
-- All rights reserved.
--
-- This source code is licensed under the BSD-style license found in the
-- LICENSE file in the root directory of this source tree.

---Sign upgrade: reads and writes the text of signs.\
---In robots, drones and tablets it accesses the sign in front of the device; in an adapter, the sign on the given side.\
---Component type: `sign`.
---@class ComponentSign : Component
local sign = {}

---Gets the text on the sign in front of the device, or (in an adapter) on the specified side. Lines are separated by `\n`.
---@param side? number Side of the adapter (adapter only, required there).
---@return string|nil text
---@return string? reason `"no sign"`.
function sign.getValue(side) end

---Sets the text on the sign in front of the device (at most 4 lines of 15 characters). Returns the new text.\
---In an adapter, pass the side of the sign first: `setValue(side, value)`.
---@param value string
---@return string|nil text
---@return string? reason `"no sign"` or `"not allowed"`.
---@overload fun(side: number, value: string): string|nil, string?
function sign.setValue(value) end
