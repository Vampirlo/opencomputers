
local component = require("component")
local event = require("event")
local modem = component.modem
local redstone = component.redstone
local sides = require("sides")

local function handleMotion()
    print("Обнаружено движение!")
    redstone.setOutput(sides.down, 0)
    os.sleep(2)
    redstone.setOutput(sides.down, 15)
end

while true do
    redstone.setOutput(sides.down, 15)
    local _, _, _, _, _, motionActive = event.pull("motion")
    handleMotion()
end



