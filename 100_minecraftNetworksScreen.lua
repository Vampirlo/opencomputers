
local component = require("component")
local gpu = component.gpu

local w, h = 15, 2

local screenAddressG1 = "8c61d5ac-234b-40e3-8201-67e9490e2947"
local screenAddressG2 = "e5cbd149-5551-4f73-b2b1-e13c55c1a63c"

while true do
    gpu.bind(screenAddressG1)
    gpu.setResolution(w, h)
    gpu.fill(1, 1, w, h, " ") -- Заполняем весь экран пробелами
    gpu.setForeground(0xFFFFFF) -- Устанавливаем белый цвет текста
    gpu.setBackground(0x000000) -- Устанавливаем черный цвет фона
    gpu.set(1, 1, "   Minecraft") -- Выводим первую строку текста
    gpu.set(1, 2, "   Networks") -- Выводим вторую строку текста

    gpu.bind(screenAddressG2)
    gpu.setResolution(w, h)
    gpu.fill(1, 1, w, h, " ") -- Заполняем весь экран пробелами
    gpu.setForeground(0xFFFFFF) -- Устанавливаем белый цвет текста
    gpu.setBackground(0x000000) -- Устанавливаем черный цвет фона
    gpu.set(1, 1, "   Minecraft") -- Выводим первую строку текста
    gpu.set(1, 2, "   Networks") -- Выводим вторую строку текста

    os.sleep(10)
end
