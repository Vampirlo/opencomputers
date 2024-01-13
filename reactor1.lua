local component = require("component")
local event = require("event")
local gpu = component.gpu

local buttons = {}  -- Список кнопок

-- Функция для рисования кнопки
local function drawButton(button)
  gpu.setBackground(button.bgColor)
  gpu.setForeground(button.textColor)
  gpu.fill(button.x, button.y, button.width, button.height, " ")
  gpu.set(button.x + 1, button.y + 1, button.label)
end

-- Функция для добавления кнопки
local function addButton(label, x, y, width, height, bgColor, textColor, callback)
  local button = {
    label = label,
    x = x,
    y = y,
    width = width,
    height = height,
    bgColor = bgColor,
    textColor = textColor,
    callback = callback
  }
  table.insert(buttons, button)
  drawButton(button)
end

-- Функция для обработки событий
local function handleEvents(_, _, x, y, button)
  for _, button in ipairs(buttons) do
    if x >= button.x and x <= button.x + button.width - 1 and y >= button.y and y <= button.y + button.height - 1 then
      button.callback()
      break
    end
  end
end

-- Функция-обработчик для примера
local function buttonCallback()
  gpu.set(1, 1, "Button was clicked!")
end

-- Добавляем кнопку
addButton("Button 1", 1, 1, 10, 3, 0xFFFFFF, 0x000000, buttonCallback)

-- Регистрируем обработчик событий нажатия мыши
event.listen("touch", handleEvents)

-- Ждем событий
while true do
  event.pull()
end
