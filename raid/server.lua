local component = require("component")
local event = require("event")
local gpu = component.gpu
local filesystem = require("filesystem")
local modem = component.modem

local transmissionLS = false
local transmissionPort = 80
local words = {}
local raidServerPath = "/mnt/3d6/"
local raidFullDiskAddress = "3d67d0da-0a5b-4156-b120-2bded8e45aaa" -- Адрес диска
local disk = component.proxy(raidFullDiskAddress) -- Получаем прокси объекта диска

local function clearScreen()
    local screenWidth, screenHeight = gpu.getResolution()
    gpu.setBackground(0x000000)  -- Черный цвет для заполнения экрана
    gpu.fill(1, 1, screenWidth, screenHeight, " ")
end

clearScreen()


  modem.open(transmissionPort)

while true do

    words = {} -- clear massive if not - attempt to index a nil value

    local eventData = {event.pull("modem_message")}
    local receiverAddress, senderAddress, port, distance, transmissionAction, fileName, fileContent = table.unpack(eventData, 2, 8) --general

    for word in string.gmatch(transmissionAction, "[^_]+") do -- transmissionAction can be == (ls scripts)
        table.insert(words, word)
      end
      if words[1] == "ls" then
        transmissionLS = true
        print(words[1], words[2])
      end

    if transmissionAction == "upload file"   then
        local file = assert(io.open(raidServerPath .. fileName, "w"))
        file:write(fileContent)
        file:close()
        modem.send(senderAddress, transmissionPort, "true")

    --ls (fileName == path to see (ls scripts then disk.list("/" .. fileName)))
    elseif transmissionLS then
        local fileList

            if (words[2] == nil) then
                fileList = disk.list("/")
            else
                fileList = disk.list("/" .. words[2])
                print(words[2], fileList)
            end

            if fileList == nil then
                modem.send(senderAddress, transmissionPort, "!!!!!!incorrect folder specified!!!!!!")
            else
                local fileListString = ""

                for _, file in ipairs(fileList) do
                    fileListString = fileListString .. file .. "\n"
                end
                modem.send(senderAddress, transmissionPort, fileListString)

            end
    elseif transmissionAction == "download file" then

        local file = assert(io.open(raidServerPath .. fileName, "r"))
        fileContent = file:read("*a")
        file:close()

        modem.open(transmissionPort)
        modem.send(senderAddress, transmissionPort, transmissionAction, fileName, fileContent)

    else
        print("else")
    end
end


-- сделать проверку, что файл существует
