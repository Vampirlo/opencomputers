---@meta

---Electronics assembler: assembles robots, drones, tablets and microcontrollers from the parts inserted into it.\
---Component type: `assembler`.
---@class ComponentAssembler : Component
local assembler = {}

---Gets the current state of the assembler: `"busy"` followed by the progress in percent (0-100),\
---or `"idle"` followed by whether the current template is valid.
---@return "busy"|"idle" status
---@return number|boolean progressOrValid
function assembler.status() end

---Starts assembling, if possible. Returns whether assembly was started.
---@return boolean started
function assembler.start() end
