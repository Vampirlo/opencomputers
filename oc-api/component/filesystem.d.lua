---@meta

---Managed file system: hard disks, floppies, RAIDs, the OpenOS loot disks and tmpfs.\
---Paths are absolute within this file system. Usually you'll want the `filesystem` library (`require("filesystem")`) instead.\
---Component type: `filesystem`.
---@class ComponentFilesystem : Component
local filesystem = {}

---A file handle returned by `open` (userdata). Pass it to `read`, `write`, `seek` and `close` of the same file system.
---@class FilesystemHandle

---Gets the current label of the file system.
---@return string|nil label The label, or `nil` if none is set.
function filesystem.getLabel() end

---Sets the label of the file system (`nil` removes it). Returns the new value, which may be truncated.
---@param value string|nil
---@return string|nil label
---@return string? reason
function filesystem.setLabel(value) end

---Returns whether the file system is read-only.
---@return boolean readOnly
function filesystem.isReadOnly() end

---The overall capacity of the file system, in bytes (`math.huge` if unlimited).
---@return number bytes
function filesystem.spaceTotal() end

---The currently used capacity of the file system, in bytes.
---@return number bytes
function filesystem.spaceUsed() end

---Returns whether an object exists at the specified absolute path in the file system.
---@param path string
---@return boolean exists
function filesystem.exists(path) end

---Returns the size of the object at the specified absolute path in the file system, in bytes.
---@param path string
---@return integer size
function filesystem.size(path) end

---Returns whether the object at the specified absolute path in the file system is a directory.
---@param path string
---@return boolean isDirectory
function filesystem.isDirectory(path) end

---Returns the (real world) timestamp of when the object at the specified absolute path in the file system was modified,\
---in milliseconds since the UNIX epoch.
---@param path string
---@return number timestamp
function filesystem.lastModified(path) end

---Returns a list of names of objects in the directory at the specified absolute path in the file system.\
---Directory names end with a slash (`/`).
---@param path string
---@return string[]|nil names The names, or `nil` if the path is not a directory.
function filesystem.list(path) end

---Creates a directory at the specified absolute path in the file system. Creates parent directories, if necessary.
---@param path string
---@return boolean created
function filesystem.makeDirectory(path) end

---Removes the object at the specified absolute path in the file system (directories recursively).
---@param path string
---@return boolean removed
function filesystem.remove(path) end

---Renames/moves an object from the first specified absolute path in the file system to the second.
---@param from string
---@param to string
---@return boolean success
function filesystem.rename(from, to) end

---Opens a new file descriptor and returns its handle.\
---Modes: `"r"` (read), `"w"` (write, truncate), `"a"` (append); add `"b"` for binary, e.g. `"rb"`.
---@param path string
---@param mode? string (default `"r"`)
---@return FilesystemHandle|nil handle The handle, or `nil` on failure.
---@return string? reason E.g. the path if the file was not found.
function filesystem.open(path, mode) end

---Closes an open file descriptor with the specified handle.
---@param handle FilesystemHandle|number
function filesystem.close(handle) end

---Reads up to the specified amount of data from an open file descriptor with the specified handle. Returns `nil` when EOF is reached.
---@param handle FilesystemHandle|number
---@param count number Maximum number of bytes to read; also capped by the configured maximum read buffer size.
---@return string|nil data
---@return string? reason
function filesystem.read(handle, count) end

---Writes the specified data to an open file descriptor with the specified handle.
---@param handle FilesystemHandle|number
---@param value string
---@return boolean|nil success
---@return string? reason
function filesystem.write(handle, value) end

---Seeks in an open file descriptor with the specified handle. Returns the new pointer position.
---@param handle FilesystemHandle|number
---@param whence "cur"|"set"|"end" Seek relative to the current position, the start or the end of the file.
---@param offset number
---@return integer|nil position
---@return string? reason
function filesystem.seek(handle, whence, offset) end
