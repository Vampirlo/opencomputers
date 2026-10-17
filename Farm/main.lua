local robot = require("robot")

local nav = require("functions.navigation")
local harvest = require("functions.harvest")
local chest = require("functions.chest")

-- Настройки
local FIELD_SIZE = 9         -- сторона квадратного поля, в клетках
local SEED_SLOT = 1          -- слот с семенами: ими засеиваем поле, в сундук их не выгружаем
local HOME_WAYPOINT = "home" -- подпись вейпоинта, к которому робот возвращается
local SLEEP_SECONDS = 600    -- пауза между обходами (10 минут)

---Один обход: вылет на поле, сбор урожая, возврат домой и выгрузка в сундук.
local function harvestCycle()
    if not nav.faceField() then
        print("Поле не найдено: рядом нет проходимого блока. Пропускаю обход")
        return
    end

    -- Поднимаемся и встаём над первой клеткой поля
    robot.up()
    robot.forward()

    -- Даже если сбор прервётся ошибкой, летим домой: returnToHome работает из любой точки поля
    local ok, err = pcall(harvest.harvestField, FIELD_SIZE, SEED_SLOT)
    if not ok then
        print("Сбор урожая прерван: " .. tostring(err))
    end

    -- Если дом не найден, returnToHome остановит программу ошибкой:
    -- выгружать урожай где попало нельзя
    nav.returnToHome(HOME_WAYPOINT)
    robot.down()
    if not chest.findAndUnload(SEED_SLOT) then
        print("Сундук не найден: урожай остаётся в роботе")
    end
end

while true do
    harvestCycle()
    os.sleep(SLEEP_SECONDS)
end
