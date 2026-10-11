---@meta

---The transforms library (`require("transforms")`): utilities for sequences (arrays), used by `text` and `sh`
---for parsing. `first`/`last` work like the arguments of `string.sub`: negative values count from the end,
---and they default to the whole sequence. Predicates are called as `predicate(element, index, tbl)`,
---where `tbl` is a view of the sequence limited to the [`first`, `last`] range.
---@class transformslib
local transforms = {}

---Finds the first match of `pred` between `first` and `last`; returns its start and end index.
---`pred` is either a predicate `fun(e, i, tbl)` returning a truthy value (and optionally the length of the match),
---or a list of sequences, which matches where any of them begins (see `transforms.begins`).
---Returns nothing if there is no match.
---@param tbl table
---@param pred table|fun(e: any, i: integer, tbl: table): any, integer?
---@param first? number
---@param last? number
---@return integer|nil startIndex
---@return integer|nil endIndex
function transforms.first(tbl, pred, first, last) end

---Checks whether the sequence `v` occurs in `tbl` starting at index `first` (and ending at or before `last`).
---Returns `true` or `nil`.
---@param tbl table
---@param v table
---@param first? number
---@param last? number
---@return boolean|nil
function transforms.begins(tbl, v, first, last) end

---Concatenates sequences into a new table. If any of them has an `n` field, the result gets one too.
---Returns `nil` and an error message if an argument is not a table.
---@param ... table
---@return table|nil result
---@return string? reason
function transforms.concat(...) end

---Returns the elements from `first` to `last` as a new sequence, like `string.sub` does for strings.
---@param tbl table
---@param first? number
---@param last? number
---@return table
function transforms.sub(tbl, first, last) end

---Splits `tbl` into a list of sub-sequences at the delimiters found by `partitioner`.
---`partitioner(e, i, tbl)` returns the start and end index of a delimiter (or `true` for the current element),
---or `partitioner` is a list of delimiter sequences. With `dropEnds`, delimiters are left out of the result.
---@param tbl table
---@param partitioner table|fun(e: any, i: integer, tbl: table): any, integer?
---@param dropEnds? boolean
---@param first? number
---@param last? number
---@return table[]
function transforms.partition(tbl, partitioner, dropEnds, first, last) end

---Maps the elements from `first` to `last` through `adapter(e, i, tbl)` into a new table; `nil` results are skipped.
---If the adapter returns a second value, it is used as the key in the result instead of the next index.
---If `adapter` is a string, the field with that name of each element is taken.
---@param tbl table
---@param adapter string|fun(e: any, i: integer, tbl: table): any, any
---@param first? number
---@param last? number
---@return table
function transforms.foreach(tbl, adapter, first, last) end

---Returns the elements from `first` to `last` for which `pred(e, i, tbl)` is truthy, as a new sequence.
---@param tbl table
---@param pred fun(e: any, i: integer, tbl: table): any
---@param first? number
---@param last? number
---@return table
function transforms.where(tbl, pred, first, last) end

---Returns the `index`-th key and value in the order of `pairs(tbl)`.
---If there are fewer pairs, returns `nil` and the number of pairs.
---@param tbl table
---@param index? number
---@return any key
---@return any value
function transforms.at(tbl, index) end

return transforms
