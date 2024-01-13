local component = require("component")
local gpu = component.gpu

local w, h = 20, 2

local screenAddressG1 = "8537e86f-fc7e-4ce3-94f7-e20281eb14ab" -- Замените на правильный адрес экрана
local screenAddressG2 = "1593a78a-a7cf-46c7-b9c0-8958843db233"
local MainscreenAddress = "55440840-9866-4051-a9a8-9d5b24d2e7d3"

gpu.bind(screenAddressG2)
gpu.setResolution(w, h)
gpu.fill(1, 1, w, h, " ") -- Заполняем весь экран пробелами
    
gpu.setForeground(0xFFFFFF) -- Устанавливаем белый цвет текста
gpu.setBackground(0x000000) -- Устанавливаем черный цвет фона
gpu.set(1, 1, "<=== ПРОИЗВОДСТВО") -- Выводим первую строку текста
gpu.set(1, 2, "      СКЛАД ===>") -- Выводим вторую строку текста

gpu.bind(screenAddressG1)
gpu.setResolution(w, h)
gpu.fill(1, 1, w, h, " ")
gpu.setForeground(0xFFFFFF)
gpu.setBackground(0x000000) 
gpu.set(1, 1, "    СЕРВЕРНАЯ ===>") 

gpu.bind(MainscreenAddress)