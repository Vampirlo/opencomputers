---@meta

---The uuid library (`require("uuid")`): generates random identifiers.
---@class uuidlib
local uuid = {}

---Generates a random 128 bit identifier (a version 4 UUID) as a string of hex digits grouped 8-4-4-4-12,
---e.g. `"3c44c8a9-0613-46a2-ad33-97b6ba2e9d9a"` (the format of component addresses).
---@return string uuid
function uuid.next() end

return uuid
