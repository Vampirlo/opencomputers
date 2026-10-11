---@meta

---Redstone card or redstone I/O block. Bundled methods need a tier 2 card (and a mod providing bundled cables);\
---wireless methods need a tier 2 card with a wireless redstone mod.\
---Sides are relative to the device (`sides.front` etc.); tables of sides are indexed by side number (0-5), colors by 0-15.\
---Changes queue a `redstone_changed` signal: `address, side, oldValue, newValue[, color]`.\
---Component type: `redstone`.
---@class ComponentRedstone : Component
local redstone = {}

---Gets the redstone input on the specified side, or on all sides if no side is given (as a table indexed by side).
---@param side number
---@return integer strength
---@overload fun(): table<integer, integer>
function redstone.getInput(side) end

---Gets the redstone output on the specified side, or on all sides if no side is given (as a table indexed by side).
---@param side number
---@return integer strength
---@overload fun(): table<integer, integer>
function redstone.getOutput(side) end

---Sets the redstone output on the specified side and returns the previous value.\
---With a single table argument (indexed by side), sets the output of several sides at once and returns the previous values.
---@param side number
---@param value number
---@return integer oldValue
---@overload fun(values: table<integer, number>): table<integer, integer>
function redstone.setOutput(side, value) end

---Gets the comparator input on the specified side, i.e. the comparator signal strength of the adjacent block.
---@param side number
---@return integer strength
function redstone.getComparatorInput(side) end

---Gets the bundled redstone input on the specified side and color.\
---With only a side, returns all colors of that side; without arguments, all sides and colors (nested tables).
---@param side number
---@param color number Color, 0-15 (see the `colors` API).
---@return integer strength
---@overload fun(side: number): table<integer, integer>
---@overload fun(): table<integer, table<integer, integer>>
function redstone.getBundledInput(side, color) end

---Gets the bundled redstone output on the specified side and color.\
---With only a side, returns all colors of that side; without arguments, all sides and colors (nested tables).
---@param side number
---@param color number Color, 0-15 (see the `colors` API).
---@return integer strength
---@overload fun(side: number): table<integer, integer>
---@overload fun(): table<integer, table<integer, integer>>
function redstone.getBundledOutput(side, color) end

---Sets the bundled redstone output on the specified side and color and returns the previous value.\
---Also accepts `(side, values)` with a table indexed by color, or `(values)` with nested tables indexed by side and color,\
---in which case the previous values are returned as a table.
---@param side number
---@param color number Color, 0-15 (see the `colors` API).
---@param value number
---@return integer oldValue
---@overload fun(side: number, values: table<integer, number>): table<integer, integer>
---@overload fun(values: table<integer, table<integer, number>>): table
function redstone.setBundledOutput(side, color, value) end

---Gets the wireless redstone input (whether a signal is received on the set frequency).
---@return boolean active
function redstone.getWirelessInput() end

---Gets the wireless redstone output.
---@return boolean active
function redstone.getWirelessOutput() end

---Sets the wireless redstone output. Returns the previous value.
---@param value boolean
---@return boolean oldValue
function redstone.setWirelessOutput(value) end

---Gets the currently set wireless redstone frequency.
---@return integer frequency
function redstone.getWirelessFrequency() end

---Sets the wireless redstone frequency to use. Returns the previous frequency.
---@param frequency number
---@return integer oldFrequency
function redstone.setWirelessFrequency(frequency) end

---Gets the current wake-up threshold: the computer starts when a redstone input changes from below to at least this value.
---@return integer threshold
function redstone.getWakeThreshold() end

---Sets the wake-up threshold (`0` disables waking up). Returns the previous threshold.
---@param threshold number
---@return integer oldThreshold
function redstone.setWakeThreshold(threshold) end
