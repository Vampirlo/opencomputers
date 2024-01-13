local component = require("component")
local event = require("event")
local gpu = component.gpu
local filesystem = require("filesystem")
local modem = component.modem

local transmissionPort = 80
local messages = {}
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
    local eventData = {event.pull("modem_message")}
    local receiverAddress, senderAddress, port, distance, transmissionAction, fileName, fileContent = table.unpack(eventData, 2, 8)

    print(transmissionAction)
    print(fileName)
    print(fileContent)

    if transmissionAction == "upload file"   then
        local file = assert(io.open(raidServerPath .. fileName, "w"))
        file:write(fileContent)
        file:close()
        modem.send(senderAddress, transmissionPort, "true")

    elseif transmissionAction == "ls" then
        local fileList = disk.list("/")
        local fileListString = ""

        for _, file in ipairs(fileList) do
            fileListString = fileListString .. file .. "\n"
        end
        print(fileListString)
        print(senderAddress)
        print(receiverAddress)
        print(transmissionPort)

        modem.send(senderAddress, transmissionPort, fileListString)

    elseif transmissionAction == "download file" then 

        local file = assert(io.open(raidServerPath .. fileName, "r"))
        fileContent = file:read("*a")
        file:close()

        modem.open(transmissionPort)
        modem.send(senderAddress, transmissionPort, transmissionAction, fileName, fileContent)

      end
end
