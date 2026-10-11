---@meta

---A color as a number (see the `colors` library), e.g. for bundled redstone: 0 = white ... 15 = black.
---@alias colors
---| number
---| 0 # white
---| 1 # orange
---| 2 # magenta
---| 3 # lightblue
---| 4 # yellow
---| 5 # lime
---| 6 # pink
---| 7 # gray
---| 8 # silver
---| 9 # cyan
---| 10 # purple
---| 11 # blue
---| 12 # brown
---| 13 # green
---| 14 # red
---| 15 # black

---The colors library (`require("colors")`): Minecraft color names to color numbers and back,
---e.g. `colors.blue` is `11` and `colors[11]` is `"blue"`. Used e.g. for bundled redstone. Numbers start at 0.
---@class colorslib
---@field [integer] string name of the color with this number, e.g. `colors[11]` is `"blue"`
---@field white integer `0`
---@field orange integer `1`
---@field magenta integer `2`
---@field lightblue integer `3`
---@field yellow integer `4`
---@field lime integer `5`
---@field pink integer `6`
---@field gray integer `7`
---@field silver integer `8`
---@field cyan integer `9`
---@field purple integer `10`
---@field blue integer `11`
---@field brown integer `12`
---@field green integer `13`
---@field red integer `14`
---@field black integer `15`
local colors = {}

return colors
