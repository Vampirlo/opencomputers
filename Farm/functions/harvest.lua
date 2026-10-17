local component = require("component")
local robot = require("robot")
local sides = require("sides")

---@class FarmHarvest
local harvest = {}

local WHEAT = "minecraft:wheat"
local RIPE_AGE = 7 -- у пшеницы metadata — это возраст от 0 до 7; 7 значит «созрела»

---Если под роботом созревшая пшеница — собирает её и сразу сажает на её место семена.
local function harvestIfRipe()
    -- assert прервёт обход, если геоанализатор не ответил (например, не хватило энергии)
    local block = assert(component.geolyzer.analyze(sides.down))

    if block.name == WHEAT and block.metadata == RIPE_AGE then
        robot.swingDown()
        robot.placeDown()
    end
end

---Переходит на соседний ряд «змейкой»:
---после нечётного ряда поворачивает направо, после чётного — налево.
local function moveToNextRow(row)
    local turn = (row % 2 == 1) and robot.turnRight or robot.turnLeft
    turn()
    robot.forward()
    turn()
end

---Облетает поле size × size «змейкой» и собирает созревшую пшеницу.
---Робот должен висеть над первой клеткой поля и смотреть вдоль первого ряда.
---@param size integer сторона поля, в клетках
---@param seed_slot integer слот с семенами для посадки
function harvest.harvestField(size, seed_slot)
    robot.select(seed_slot)

    for row = 1, size do
        harvestIfRipe() -- первая клетка ряда

        for _ = 1, size - 1 do
            robot.forward()
            harvestIfRipe()
        end

        if row < size then
            moveToNextRow(row)
        end
    end
end

return harvest
