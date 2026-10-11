---@meta

---A side as a number (see the `sides` library). Relative sides for robots and drones, absolute directions otherwise.
---@alias side
---| number
---| 0 # bottom (down, negy)
---| 1 # top (up, posy)
---| 2 # back (north, negz)
---| 3 # front (south, posz, forward)
---| 4 # right (west, negx)
---| 5 # left (east, posx)

---The sides library (`require("sides")`): side names to side numbers and back,
---e.g. `sides.top` is `1` and `sides[1]` is `"top"`. The numbers match Minecraft's internal side numbering.
---@class sideslib
---@field [integer] string name of the side with this number, e.g. `sides[3]` is `"front"`
---@field bottom integer `0` (also `down`, `negy`)
---@field top integer `1` (also `up`, `posy`)
---@field back integer `2` (also `north`, `negz`)
---@field front integer `3` (also `south`, `posz`, `forward`)
---@field right integer `4` (also `west`, `negx`)
---@field left integer `5` (also `east`, `posx`)
---@field unknown integer `6`, an unknown or invalid side
---@field down integer `0`, same as `bottom`
---@field up integer `1`, same as `top`
---@field north integer `2`, same as `back`
---@field south integer `3`, same as `front`
---@field west integer `4`, same as `right`
---@field east integer `5`, same as `left`
---@field negy integer `0`, same as `bottom`
---@field posy integer `1`, same as `top`
---@field negz integer `2`, same as `back`
---@field posz integer `3`, same as `front`
---@field negx integer `4`, same as `right`
---@field posx integer `5`, same as `left`
---@field forward integer `3`, same as `front`
local sides = {}

return sides
