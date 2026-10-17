local component = require("component")
local robot = require("robot")
local sides = require("sides")

---@class FarmNav
local nav = {}

local WAYPOINT_SEARCH_RANGE = 40 -- в блоках

---Крутит робота направо, пока он не посмотрит в нужную сторону света (sides.north, sides.east…).
local function turnTo(side)
    while component.navigation.getFacing() ~= side do
        robot.turnRight()
    end
end

---Сдвигает робота по одной оси на offset блоков:
---при offset > 0 — в сторону positive_side, при offset < 0 — в сторону negative_side.
local function moveAlongAxis(offset, positive_side, negative_side)
    if offset > 0 then
        turnTo(positive_side)
    elseif offset < 0 then
        turnTo(negative_side)
    end

    for _ = 1, math.abs(offset) do
        robot.forward()
    end
end

---Ищет вейпоинт с подписью label. Возвращает nil, если такого рядом нет.
local function findWaypoint(label)
    -- assert остановит программу, если навигация не ответила (например, не хватило энергии)
    local waypoints = assert(component.navigation.findWaypoints(WAYPOINT_SEARCH_RANGE))

    for _, waypoint in ipairs(waypoints) do
        if waypoint.label == label then
            return waypoint
        end
    end
    return nil
end

---Поворачивает робота к полю: ищет сторону, с которой перед ним проходимый блок («passable»).
---@return boolean found false, если такого блока нет ни с одной стороны
function nav.faceField()
    for _ = 1, 4 do -- у робота четыре стороны
        local _, block_type = robot.detect()
        print("Обнаружено: " .. block_type)

        if block_type == "passable" then
            return true
        end
        robot.turnRight()
    end
    return false
end

---Летит к вейпоинту с подписью label: сначала по оси X, потом по Z.
---Высоту не меняет; в конце смотрит туда, куда летел последним.
---@param label string
function nav.returnToHome(label)
    local home = findWaypoint(label)
    if not home then
        error("Вейпоинт '" .. label .. "' не найден в радиусе " .. WAYPOINT_SEARCH_RANGE .. " блоков")
    end

    local x, y, z = table.unpack(home.position)
    print("Вейпоинт '" .. label .. "' найден!")
    print("Относительные координаты: X=" .. x .. ", Y=" .. y .. ", Z=" .. z)

    moveAlongAxis(x, sides.east, sides.west)   -- +X — восток, −X — запад
    moveAlongAxis(z, sides.south, sides.north) -- +Z — юг, −Z — север
end

return nav
