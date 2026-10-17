local component = require("component")
local robot = require("robot")
local sides = require("sides")

---@class FarmChest
local chest = {}

local CHEST = "minecraft:chest"
local MAX_TURNS = 5 -- сколько раз робот повернётся в поисках сундука, прежде чем сдаться

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

---Поворачивается направо, пока не увидит перед собой сундук (не больше MAX_TURNS раз),
---и только тогда выгружает в него инвентарь — все слоты, кроме keep_slot.
---Без сундука ничего не выгружает: robot.drop() выбросил бы урожай на землю.
---@param keep_slot integer слот, который остаётся у робота (семена для посадки)
---@return boolean unloaded false, если сундук так и не нашёлся
function chest.findAndUnload(keep_slot)
    for _ = 1, MAX_TURNS do
        -- assert остановит программу, если геоанализатор не ответил (например, не хватило энергии)
        local block = assert(component.geolyzer.analyze(sides.front))

        if block.name == CHEST then
            chest.unloadStorage(keep_slot)
            return true
        end
        robot.turnRight()
    end
    return false
end

return chest
