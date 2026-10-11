---@meta

---The Lua 5.2 `bit32` library. In OpenComputers' Lua 5.3 architecture there is **no global `bit32`**:
---`require("bit32")` loads OpenOS' pure Lua implementation from `/lib/bit32.lua` (on the Lua 5.2 architecture it returns
---the native library). In Lua 5.3 code the operators `&`, `|`, `~`, `<<`, `>>` and `~x` are faster.\
---Note: in OpenOS' implementation `bnot`, `bor`, `bxor` and `replace` don't truncate their result to 32 bits,
---and `arshift` returns a float.
---@class bit32lib
local bit32 = {}

---Arithmetic right shift: returns `x // 2^disp` (a float in OpenOS' implementation). Negative `disp` shifts left.
---@param x number
---@param disp number
---@return number
function bit32.arshift(x, disp) end

---Returns the bitwise AND of its operands, truncated to 32 bits (`0xFFFFFFFF` without operands).
---@param ... number
---@return integer
function bit32.band(...) end

---Returns the bitwise negation of `x` (`~x`; OpenOS doesn't truncate it to 32 bits: `bit32.bnot(0)` is `-1`).
---@param x number
---@return integer
function bit32.bnot(x) end

---Returns the bitwise OR of its operands (`0` without operands).
---@param ... number
---@return integer
function bit32.bor(...) end

---Returns whether the bitwise AND of its operands is not zero.
---@param ... number
---@return boolean
function bit32.btest(...) end

---Returns the bitwise exclusive OR of its operands (`0` without operands).
---@param ... number
---@return integer
function bit32.bxor(...) end

---Returns the unsigned number formed by the bits `field` to `field + width - 1` of `n` (bit 0 is the least significant).
---All accessed bits must be in the range [0, 31].
---@param n number
---@param field number
---@param width? number number of bits (default 1)
---@return integer
function bit32.extract(n, field, width) end

---Returns a copy of `n` with the bits `field` to `field + width - 1` replaced by the value `v` (see `bit32.extract`).
---@param n number
---@param v number
---@param field number
---@param width? number number of bits (default 1)
---@return integer
function bit32.replace(n, v, field, width) end

---Returns `x` rotated `disp` bits to the left, as a 32-bit number. Negative `disp` rotates right.
---@param x number
---@param disp number
---@return integer
function bit32.lrotate(x, disp) end

---Returns `x` shifted `disp` bits to the left, truncated to 32 bits. Negative `disp` shifts right.
---@param x number
---@param disp number
---@return integer
function bit32.lshift(x, disp) end

---Returns `x` rotated `disp` bits to the right, as a 32-bit number. Negative `disp` rotates left.
---@param x number
---@param disp number
---@return integer
function bit32.rrotate(x, disp) end

---Logical right shift: returns `x` shifted `disp` bits to the right, truncated to 32 bits (vacant bits are filled with zeros).
---Negative `disp` shifts left.
---@param x number
---@param disp number
---@return integer
function bit32.rshift(x, disp) end

return bit32
