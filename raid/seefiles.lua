local component = require("component")

local diskAddress = "3d67d0da-0a5b-4156-b120-2bded8e45aaa" -- Адрес диска
local disk = component.proxy(diskAddress) -- Получаем прокси объекта диска

local function listFilesRecursive(path)
    local files = disk.list(path) -- Получаем список файлов и папок в указанной директории

    for _, file in ipairs(files) do
        local fullPath = path .. "/" .. file

        -- Если текущий элемент является папкой, вызываем функцию рекурсивно, чтобы просмотреть все файлы внутри
        if disk.isDirectory(fullPath) then
            listFilesRecursive(fullPath)
        else
            print(string.gsub(fullPath, "//", "/")) -- Выводим полный путь к файлу с заменой двойных черт на одиночные
        end
    end
end

listFilesRecursive("/") -- Запускаем функцию для корневой директории

