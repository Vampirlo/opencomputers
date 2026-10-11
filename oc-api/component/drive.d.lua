---@meta

---Unmanaged drive: a hard disk or floppy in unmanaged mode, accessed as raw bytes and sectors.\
---Offsets and sector numbers are 1-based.\
---Component type: `drive`.
---@class ComponentDrive : Component
local drive = {}

---Gets the current label of the drive.
---@return string|nil label The label, or `nil` if none is set.
function drive.getLabel() end

---Sets the label of the drive (`nil` removes it). Returns the new value, which may be truncated.
---@param value string|nil
---@return string|nil label The new label, or `nil` on failure.
---@return string? reason E.g. `"drive is read only"`.
function drive.setLabel(value) end

---Returns the total capacity of the drive, in bytes.
---@return integer capacity
function drive.getCapacity() end

---Returns the size of a single sector on the drive, in bytes.
---@return integer size
function drive.getSectorSize() end

---Returns the number of platters in the drive.
---@return integer count
function drive.getPlatterCount() end

---Reads the current contents of the specified sector.
---@param sector number
---@return string data
function drive.readSector(sector) end

---Writes the specified contents to the specified sector.
---@param sector number
---@param value string
---@return nil result
---@return string? reason E.g. `"drive is read only"`.
function drive.writeSector(sector, value) end

---Reads a single byte at the specified offset. The value is signed (-128 to 127).
---@param offset number
---@return integer value
function drive.readByte(offset) end

---Writes a single byte to the specified offset.
---@param offset number
---@param value number
---@return nil result
---@return string? reason E.g. `"drive is read only"`.
function drive.writeByte(offset, value) end
