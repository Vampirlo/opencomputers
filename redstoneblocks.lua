local component  = require("component")
local sides  =  require("sides")

local redControllers = 
{
    "ddac7656-d69e-40f4-82f3-4a9e4cbfc2f1",
    "34881e59-39bd-467f-8b50-f07d7a6de50c"
}

for _, adress in ipairs(redControllers) do
    local redController = component.proxy(adress)
    redController.setOutput(sides.left, 15)
    redController.setOutput(sides.right, 15)
    redController.setOutput(sides.front, 15)
    redController.setOutput(sides.back, 15)
    redController.setOutput(sides.bottom, 15)
    redController.setOutput(sides.top, 15)
end
