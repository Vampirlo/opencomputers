---@meta

---Vanilla jukebox, accessed through an adapter block.\
---Component type: `jukebox`.
---@class ComponentJukebox : Component
local jukebox = {}

---Gets the title of the record currently in the jukebox.
---@return string|nil title The title, or `nil` if there is no record.
function jukebox.getRecord() end

---Starts playing the record currently in the jukebox.
---@return boolean|nil success `true`, or `nil` if there is no record.
function jukebox.play() end

---Stops playing the record currently in the jukebox.
function jukebox.stop() end
