---@meta

---Average Counter (Energy Control). Measures the average energy flow through it.
---@class ComponentAverageCounter : Component
local average_counter = {}

---Gets the current averaging period (in seconds).
---@return integer period
function average_counter.getPeriod()
end

---Gets the average value.
---@return number average
function average_counter.getAverage()
end
