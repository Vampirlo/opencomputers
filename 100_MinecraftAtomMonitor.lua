local component = require("component")
local gpu = component.gpu

local w, h = 15, 2

gpu.setResolution(w, h)
while true do
    gpu.fill(1, 1, w, h, " ") -- Заполняем весь экран пробелами
    
    gpu.setForeground(0xFFFFFF) -- Устанавливаем белый цвет текста
    gpu.setBackground(0x000000) -- Устанавливаем черный цвет фона
    gpu.set(1, 1, "   Minecraft") -- Выводим первую строку текста
    gpu.set(1, 2, "     Atom") -- Выводим вторую строку текста
    os.sleep(10)
end
