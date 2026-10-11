---@meta

---Tablet: information about the player holding the tablet, as seen by the tablet's own computer.\
---Component type: `tablet`.
---@class ComponentTablet : Component
local tablet = {}

---Gets the pitch of the player holding the tablet, in degrees (-90 looking up to 90 looking down).
---@return number pitch
function tablet.getPitch() end

---Gets the yaw of the player holding the tablet, in degrees.
---@return number yaw
function tablet.getYaw() end
