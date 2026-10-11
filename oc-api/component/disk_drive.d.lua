---@meta

---Floppy disk drive, as a block or as a rack mountable. The floppy itself shows up as a separate `filesystem` component.\
---Component type: `disk_drive`.
---@class ComponentDiskDrive : Component
local disk_drive = {}

---Checks whether some medium is currently in the drive.
---@return boolean empty
function disk_drive.isEmpty() end

---Ejects the currently present medium from the drive. Returns `true` if something was ejected.
---@param velocity? number Velocity of the ejected item entity, 0-1 (default `0`).
---@return boolean ejected
function disk_drive.eject(velocity) end

---Returns the address of the filesystem component of the floppy disk in the drive.
---@return string|nil address The floppy's address, or `nil` if the drive is empty.
---@return string? reason `"drive is empty"`.
function disk_drive.media() end
