local component = require("component")
local event = require("event")
local gpu = component.gpu

local buttons = {}  -- Список кнопок
local temperature = 0  -- Исходное значение температуры

-- Функция для очистки экрана
local function clearScreen()
  local screenWidth, screenHeight = gpu.getResolution()
  gpu.setBackground(0x000000)  -- Черный цвет для заполнения экрана
  gpu.fill(1, 1, screenWidth, screenHeight, " ")
end

-- Функция для рисования кнопки
local function drawButton(button)
  gpu.setBackground(button.bgColor)
  gpu.setForeground(button.textColor)
  gpu.fill(button.x, button.y, button.width, button.height, " ")
  gpu.set(button.x + 1, button.y + 1, button.label)
end

-- Функция для обновления значения на кнопке
local function updateButtonLabel(button, value)
  button.label = value
  drawButton(button)
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

-- Функция-обработчик для первой кнопки
local function buttonCallback()
  gpu.set(1, 1, "Button was clicked!")
end

-- Очищаем экран перед созданием кнопок
clearScreen()

-- Добавляем первую кнопку
addButton(tostring(temperature), 1, 1, 10, 3, 0xFFFFFF, 0x000000, buttonCallback)

-- Добавляем вторую кнопку справа от первой
addButton("Button 2", 12, 1, 10, 3, 0xFFFFFF, 0x000000, button2Callback)

-- Регистрируем обработчик событий нажатия мыши
event.listen("touch", handleEvents)

-- Реализация изменения значения температуры (тестово)
-- Вместо этого вам нужно добавить свою логику для получения и обновления значения температуры
-- В данном примере используется случайный генератор чисел
math.randomseed(os.time())
while true do
  -- Генерируем случайное значение температуры
  temperature = math.random(0, 100)
  -- Обновляем значение на кнопке
  updateButtonLabel(buttons[1], tostring(temperature))
  -- Задержка перед следующим обновлением значения температуры
  os.sleep(1)
end
