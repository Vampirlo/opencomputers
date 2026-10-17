
local component = require("component")
local event = require("event")
local sides = require("sides")

local sensor = component.motion_sensor
local redstone = component.redstone

local side = sides.east
local timerId = nil
local running = false

local function onMotion()
    -- Выключаем сигнал при движении
    redstone.setOutput(side, 0)

    -- Сбрасываем предыдущий таймер
    if timerId then
        event.cancel(timerId)
        timerId = nil
    end

    -- Через 5 секунд включаем сигнал обратно
    timerId = event.timer(5, function()
        timerId = nil

        if running then
            redstone.setOutput(side, 15)
        end
    end, 1)
end

function start()
    if running then
        return true
    end

    sensor.setSensitivity(0.1)

    running = true
    redstone.setOutput(side, 15)
    event.listen("motion", onMotion)

    print("Defense started")
    return true
end

function stop()
    if not running then
        return true
    end

    running = false
    event.ignore("motion", onMotion)

    if timerId then
        event.cancel(timerId)
        timerId = nil
    end

    redstone.setOutput(side, 0)

    print("Defense stopped")
    return true
end
