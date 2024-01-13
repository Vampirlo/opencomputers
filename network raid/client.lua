--[[

    example of sending and receiving data through a raid server
    upload - file name: ip.lua, file path: /mnt/1ba/home/
    download - files will be downloaded along the way /mnt/1ba/home/
    ]]




local component = require("component")
local event = require("event")
local gpu = component.gpu
local modem = component.modem

local raidServerAddress = "4f68506e-873f-454e-996c-576c30bb6e07"
local transmissionPort = 80
local transmissionAction = nil

local fileName = nil
local filePath =nil
local fileContent = nil
local run = true

local words = {}
local extendedls = false

local function clearScreen()
    local screenWidth, screenHeight = gpu.getResolution()
    gpu.setBackground(0x000000)
    gpu.fill(1, 1, screenWidth, screenHeight, " ")
  end

local function readInput()
    local input = io.read()
    return input
end

local function uploadFile(fileName, filePath, PathToSave)
end

local function uploadFolder()
end

local function downloadFile()
end

local function downloadFolder()
end

clearScreen()

--main program

while run do
    print("enter 'help' to see all comands")

    local userInput = readInput()
    words = {}

    for word in userInput:gmatch("%S+") do -- if userInput == ("ls .. something")
        table.insert(words, word)
    end

    if words[1] == "ls" then
        extendedls = true
    end

    ---------------------------------------- userinputs
    if userInput == 'help' then
        print("\n\nupload file \nupload folder\ndownload file\ndownload folder\nls\ndel\nexit\n\n")

    elseif userInput == 'upload file' then

        print("Enter file_name, file_path, path_to_save(if  you not enter path, file will be uploaded in default folder)")

        -- реализовать парсер из строки (имя, путь, путь)
        fileName = readInput()
        filePath = readInput()
        fileContent = nil

        transmissionAction = "upload file"

        local file = assert(io.open(filePath .. fileName, "r"))
        fileContent = file:read("*a")
        file:close()
        -- потом реализовать передачу файлу в указанную папку
        modem.open(transmissionPort)
        modem.send(raidServerAddress, transmissionPort, transmissionAction, fileName, fileContent)

        local eventData = {event.pull("modem_message")}
        local receiverAddress, senderAddress, port, distance, successful = table.unpack(eventData, 2, 6)

        if successful == "true" then
            gpu.setForeground(0x00FF00) -- RGB цвет: 0x00FF00 (зеленый)
            print("\n\nsuccessful\n\n")
            gpu.setForeground(0xFFFFFF) -- RGB цвет: 0xFFFFFF (белый)
        else
            print("the file was not transferred")
        end

    elseif userInput == 'upload path' then

    elseif userInput == 'download file' then

        print("\nВведите путь к файлу на сервере")
        transmissionAction = "download file"
        fileName = readInput()

        modem.send(raidServerAddress, transmissionPort ,transmissionAction, fileName)

        local eventData = {event.pull("modem_message")}
        local receiverAddress, senderAddress, port, distance, transmissionAction, fileName, fileContent = table.unpack(eventData, 2, 8)

        local file = assert(io.open(fileName, "w"))
        file:write(fileContent)
        file:close()

        gpu.setForeground(0x00FF00) -- RGB цвет: 0x00FF00 (зеленый)
        print("\n\nsuccessful\n\n")
        gpu.setForeground(0xFFFFFF) -- RGB цвет: 0xFFFFFF (белый)

    elseif userInput == 'download path' then

    elseif extendedls then

        transmissionAction = "ls"

        local correctToTransmit = string.gsub(userInput, " ", "_") -- no space

        modem.send(raidServerAddress, transmissionPort, correctToTransmit)
        local eventData = {event.pull("modem_message")}
        local senderAddress, receiverAddress, port, distance, files = table.unpack(eventData, 2, 6)
        print("\n")
        print(files)

        extendedls = false

    elseif userInput == "exit" then
        run = false

    elseif userInput == 'del' then
        transmissionAction = "del"

        print("enter file/folder name on the server")
        local delFileName = readInput()
        print("enter path(if main then enter nil), if main then enter nothing")
        local delFilePath = readInput()
        modem.send(raidServerAddress, transmissionPort, transmissionAction, delFileName, delFilePath)

        local eventData = {event.pull("modem_message")}
        local senderAddress, receiverAddress, port, distance, message, error = table.unpack(eventData, 2, 7)
        if error then
            gpu.setForeground(0xFF0000) -- RGB цвет: 0xFF0000 (red)
            print(message)
            gpu.setForeground(0xFFFFFF) -- RGB цвет: 0xFFFFFF (белый)
        else
            gpu.setForeground(0x00FF00) -- RGB цвет: 0xFF0000 (зелёный)
            print("\n\nsuccessful\n\n")
            gpu.setForeground(0xFFFFFF) -- RGB цвет: 0xFFFFFF (белый)
        end

    else
        print("invalid command")
    end

end

-- сделать проверку, что файл существует
