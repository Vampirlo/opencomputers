---@meta

---Vanilla command block, accessed through an adapter block.\
---Only available if `enableCommandBlockDriver` is enabled in the OpenComputers config (disabled by default).\
---Component type: `command_block`.
---@class ComponentCommandBlock : Component
local command_block = {}

---Gets the command currently set in this command block.
---@return string command
function command_block.getCommand() end

---Sets the command of this command block.
---@param value string
---@return boolean success
function command_block.setCommand(value) end

---Executes the currently set command (after a slight delay to let the command block update).\
---Returns the command's success count and its last output.
---@return integer|nil successCount
---@return string? output The last output, or `"command blocks are disabled"`.
function command_block.executeCommand() end
