local raidServerPath = "/mnt/3d6/"
local name = "name.txt"
local content = "context"

local file = assert(io.open(raidServerPath .. name, "w"))
file:write(content)
file:close()