---@meta

---The text library (`require("text")`): string utilities for trimming, padding, wrapping and tokenizing.
---@class textlib
---@field syntax string[] patterns of the shell operators split off by `text.tokenize` (`>`, `>>`, `<`, `;`, `&&`, `||`, ...)
local text = {}

---Removes whitespace from the start and the end of a string.
---@param value string
---@return string
function text.trim(value) end

---Escapes the Lua pattern magic characters (`( ) . % + - * ? [ ^ $`) with `%`.
---@param txt string
---@return string escaped
---@return integer count number of escaped characters
function text.escapeMagic(txt) end

---Removes the `%` escapes added by `text.escapeMagic`.
---@param txt string
---@return string unescaped
---@return integer count number of removed escapes
function text.removeEscapes(txt) end

---Splits a string into words separated by whitespace. Quoted parts (`'...'`, `"..."`, `` `...` ``) are kept
---together (including the quotes) and shell operators (see `text.syntax`) become separate words.
---Returns `nil` and an error message for an unclosed quote.
---@param value string
---@param options? table internal, undocumented options
---@return string[]|nil words
---@return string? reason
function text.tokenize(value, options) end

---Splits a string at the given delimiter patterns, keeping all text (unlike `text.tokenize`).
---The delimiters are included in the result as separate entries unless `dropDelims` is `true`.
---@param input string
---@param delimiters string[] Lua patterns
---@param dropDelims? boolean
---@param di? number index of the first delimiter to use (internal, default `1`)
---@return string[]
function text.split(input, delimiters, dropDelims, di) end

---Replaces tab characters with spaces, aligned to multiples of the tab width.
---@param value string
---@param tabWidth? number default `8`
---@return string
function text.detab(value, tabWidth) end

---Pads a string with spaces on the left up to `length` columns (wide characters count double).
---@param value string|nil
---@param length number
---@return string
function text.padLeft(value, length) end

---Pads a string with spaces on the right up to `length` columns (wide characters count double).
---@param value string|nil
---@param length number
---@return string
function text.padRight(value, length) end

---Takes the first line of `value` and wraps it to `width` columns at a word boundary.
---If there is no word boundary within `width`, an empty line is returned (moving the text to the next line),
---unless the line is longer than `maxWidth`, in which case it is cut at `width`.
---@param value string
---@param width number preferred line width
---@param maxWidth number maximum line width
---@return string line the first (wrapped) line, without the newline
---@return string|nil rest the remaining text, `nil` if nothing is left
---@return boolean ended `true` if the line was wrapped or ended with a newline
function text.wrap(value, width, maxWidth) end

---Returns an iterator over the lines of `value` wrapped with `text.wrap`.
---@param value string
---@param width number preferred line width
---@param maxWidth number maximum line width
---@return fun(): string|nil iterator
function text.wrappedLines(value, width, maxWidth) end

return text
