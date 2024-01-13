local component = require("component")
local gpu = component.gpu

local w, h = 15, 2

local screenAddressG1 = "61378376-d7e1-4b89-aa3d-bc7e4c9dd149" -- Замените на правильный адрес экрана
local MainscreenAddress = "b7ef024e-f8c4-47f2-ada0-6952f01b32c1"

gpu.bind(screenAddressG1)
gpu.setResolution(w, h)
gpu.fill(1, 1, w, h, " ") -- Заполняем весь экран пробелами
    
gpu.setForeground(0xFFFFFF) -- Устанавливаем белый цвет текста
gpu.setBackground(0x000000) -- Устанавливаем черный цвет фона
gpu.set(1, 1, "   Minecraft") -- Выводим первую строку текста
gpu.set(1, 2, "   Networks") -- Выводим вторую строку текста

gpu.bind(MainscreenAddress)