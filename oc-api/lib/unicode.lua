---@meta

---UTF-8 aware string functions provided by OpenComputers. Screens, the GPU and keyboard input use UTF-8,
---so use these instead of `string.len`/`string.sub` & co. for text that may contain non-ASCII characters.\
---In OpenOS this is a module: `local unicode = require("unicode")` (there is no global `unicode`).
---@class unicodelib
local unicode = {}

---UTF-8 aware version of `string.char`: returns the string made of the given Unicode code points.
---```lua
---unicode.char(0x2588, 0x2588) --> "██"
---```
---@param ... number code points
---@return string
function unicode.char(...) end

---Returns the number of characters in `value` (`string.len` counts bytes): `unicode.len("Ümläüt")` is 6, `#"Ümläüt"` is 9.
---@param value string
---@return integer length
function unicode.len(value) end

---UTF-8 aware version of `string.lower`.
---@param value string
---@return string
function unicode.lower(value) end

---UTF-8 aware version of `string.upper`.
---@param value string
---@return string
function unicode.upper(value) end

---UTF-8 aware version of `string.reverse`: `unicode.reverse("Ümläüt")` → `"tüälmÜ"`.
---@param value string
---@return string
function unicode.reverse(value) end

---UTF-8 aware version of `string.sub`: returns the characters from `i` to `j` (default: the end).
---Negative indices count from the end.
---@param value string
---@param i number
---@param j? number
---@return string
function unicode.sub(value, i, j) end

---Returns whether the first character of `value` is wide, i.e. takes two columns on the screen (e.g. `"シ"`).
---@param value string
---@return boolean wide
function unicode.isWide(value) end

---Returns the display width of the first character of `value`: 2 for wide characters such as `"シ"`, otherwise 1.
---@param value string
---@return integer width
function unicode.charWidth(value) end

---Returns the display width of `value` in screen columns (wide characters count as 2).
---@param value string
---@return integer width
function unicode.wlen(value) end

---Truncates `value` to a display width below `count`: returns the leading characters before the one that reaches
---`count` columns. Throws an error if `value` is narrower than `count`.
---@param value string
---@param count number
---@return string
function unicode.wtrunc(value, count) end

return unicode
