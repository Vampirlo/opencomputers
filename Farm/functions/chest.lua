local robot = require("robot")

---@class FarmChest
local chest = {}

---Выгружает инвентарь робота в сундук перед ним — все слоты, кроме keep_slot.
---@param keep_slot integer слот, который остаётся у робота (семена для посадки)
function chest.unloadStorage(keep_slot)
    for slot = 1, robot.inventorySize() do
        if slot ~= keep_slot then
            robot.select(slot)
            robot.drop()
        end
    end
end

return chest
