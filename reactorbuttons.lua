local component = require("component")
local event = require("event")
local gpu = component.gpu

-- Список кнопок
local buttons = {}

-- Элементы интерфейса
local screenWidth, screenHeight = gpu.getResolution()
local buttonWidth = 10
local buttonHeight = 3
local buttonMarginX = 2
local buttonMarginY = 1

-- Добавление кнопки
local function addButton(name, callback, column, row)
  table.insert(buttons, {name = name, callback = callback, column = column, row = row})
end

-- Отрисовка всех кнопок
local function drawButtons()
    for i, button in ipairs(buttons) do
      local buttonX = (button.column - 1) * (buttonWidth + buttonMarginX)
      local buttonY = (button.row - 1) * (buttonHeight + buttonMarginY)
  
      gpu.setBackground(0xFFFFFF) -- Белый фон
      gpu.setForeground(0x000000) -- Чёрный текст
      gpu.fill(buttonX, buttonY, buttonWidth, buttonHeight, " ")
  
      -- Выравниваем текст внутри кнопки
      local textX = buttonX + math.floor((buttonWidth - #button.name) / 2)
      local textY = buttonY + math.floor(buttonHeight / 2)
      gpu.set(textX, textY, button.name)
    end
  end

-- Проверка, находится ли указатель мыши над кнопкой
local function isMouseOverButton(buttonX, buttonY, mouseX, mouseY)
    if component.isAvailable("mouse") and event.mouse then
      return (mouseX >= buttonX and mouseX <= buttonX + buttonWidth) and (mouseY >= buttonY and mouseY <= buttonY + buttonHeight)
    end
    return false
  end

-- Обработка событий
local function handleEvents()
  while true do
    local _, _, mouseX, mouseY, button, _ = event.pull("touch")

    -- Проверяем, подключен ли указатель мыши
    if component.isAvailable("mouse") and event.mouse then
      -- Проверяем каждую кнопку на нажатие
      for _, btn in ipairs(buttons) do
        local buttonX = (btn.column - 1) * (buttonWidth + buttonMarginX)
        local buttonY = (btn.row - 1) * (buttonHeight + buttonMarginY)

        -- Если нажата кнопка и указатель мыши находится над кнопкой
        if button == 0 and isMouseOverButton(buttonX, buttonY, mouseX, mouseY) then
          btn.callback() -- Вызываем метод кнопки
          return -- Завершаем функцию после обработки кнопки
        end
      end
    end
  end
end

-- Создание кнопок
addButton("Кнопка 1", function()
  -- Действие кнопки 1
  print("Нажата кнопка 1")
end, 1, 1)

addButton("Кнопка 2", function()
  -- Действие кнопки 2
  print("Нажата кнопка 2")
end, 2, 1)

-- Создание кнопки
addButton("Моя кнопка", function()
  -- Действие кнопки
  print("Нажата моя кнопка")
end, 1, 2)

-- Отрисовка кнопок
drawButtons()

-- Обработка событий
handleEvents()
