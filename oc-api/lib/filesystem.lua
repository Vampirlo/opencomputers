---@meta

---The filesystem library: one directory tree in which the file systems (hard drives, floppies, `/tmp`, ...) are mounted.\
---To read or write files use `io.open` (buffered); `filesystem.open` returns raw, unbuffered streams.
---Not to be confused with the `filesystem` component (`ComponentFilesystem`).
---@class filesystemlib
local filesystem = {}

---Returns whether autorun is enabled: newly mounted file systems are checked for an `autorun[.lua]` (or `.autorun[.lua]`)
---file in their root directory, which is then executed.
---@return boolean enabled
function filesystem.isAutorunEnabled() end

---Enables or disables autorun (see `filesystem.isAutorunEnabled`). The setting is saved in `/etc/filesystem.cfg`.
---@param value boolean
function filesystem.setAutorunEnabled(value) end

---Returns the canonical form of `path`, without `.`, `..` and duplicate slashes: `/tmp/../bin/./ls.lua` → `/bin/ls.lua`.\
---Relative paths stay relative and are truncated at their topmost known directory: `../bin/ls.lua` → `bin/ls.lua`.
---@param path string
---@return string path
function filesystem.canonical(path) end

---Returns the canonical segments of `path`: `filesystem.segments("foo/bar/../baz")` → `{"foo", "baz"}`.
---@param path string
---@return string[] segments
function filesystem.segments(path) end

---Concatenates paths and returns the canonical result. All paths after the first are treated as relative,
---even if they start with a slash: `filesystem.concat("/home", "/user", "a.lua")` → `/home/user/a.lua`.
---@param pathA string
---@param ... string more paths
---@return string path
function filesystem.concat(pathA, ...) end

---Returns the directory part of `path` (everything up to the last slash, with a trailing slash): `/home/a.lua` → `/home/`.
---@param path string
---@return string path
function filesystem.path(path) end

---Returns the last segment of `path` (the file or directory name): `/home/a.lua` → `a.lua`. Returns `nil` for `/`.
---@param path string
---@return string name
function filesystem.name(path) end

---Returns the proxy of the file system whose label is `filter` or whose address starts with `filter`,
---or `nil` and an error message.\
---`options.readonly` wraps the proxy so that writing fails; `options.bind` treats `filter` as a directory path and
---returns a proxy for that directory (as used by `mount --bind`).
---@param filter string label or (abbreviated) address; a directory path with `options.bind`
---@param options? {readonly?: boolean, bind?: boolean}
---@return ComponentFilesystem|nil proxy
---@return string? reason
function filesystem.proxy(filter, options) end

---Mounts a file system at `path` (the directory is created virtually if needed).\
---`fs` is a file system proxy, or a label or (abbreviated) address. Returns `true` on success, or `nil` and an error message.
---@param fs ComponentFilesystem|table|string
---@param path string
---@return boolean|nil success
---@return string? reason
function filesystem.mount(fs, path) end

---Returns an iterator over all mounts, yielding the file system proxy and the mount path.
---The same proxy can appear several times with different paths.
---```lua
---for proxy, path in filesystem.mounts() do print(path, proxy.address) end
---```
---@return fun(): ComponentFilesystem, string iterator
function filesystem.mounts() end

---Unmounts file systems. `fsOrPath` is a proxy or (abbreviated) address, in which case all its mounts are removed,
---or a path, in which case the file system mounted at that path is unmounted. Returns `true` if something was unmounted.
---@param fsOrPath ComponentFilesystem|table|string
---@return boolean unmounted
function filesystem.umount(fsOrPath) end

---Returns whether `path` is a symbolic link and, if so, its target.
---@param path string
---@return boolean isLink
---@return string? target
function filesystem.isLink(path) end

---Creates a symbolic link at `linkpath` that points to `target` (which doesn't need to exist).
---Links are virtual: they don't survive a reboot. Returns `true` on success, or `nil` and an error message.
---@param target string
---@param linkpath string
---@return boolean|nil success
---@return string? reason
function filesystem.link(target, linkpath) end

---Returns the proxy of the file system that contains `path` and the path it is mounted at,
---or `nil` and an error message.
---@param path string
---@return ComponentFilesystem|nil proxy
---@return string mountPathOrReason
function filesystem.get(path) end

---Returns `path` with all symbolic links resolved, or `nil` and an error message.
---@param path string
---@return string|nil path
---@return string? reason
function filesystem.realPath(path) end

---Returns whether a file or directory exists at `path`.
---@param path string
---@return boolean exists
function filesystem.exists(path) end

---Returns the size of the file at `path` in bytes, or `0` if it is a directory or doesn't exist.
---@param path string
---@return number bytes
function filesystem.size(path) end

---Returns whether `path` is a directory (`false` for files and paths that don't exist).
---@param path string
---@return boolean isDirectory
function filesystem.isDirectory(path) end

---Returns the time the file at `path` was last modified (for directories usually their creation time),
---as a real-world Unix timestamp in **milliseconds**, or `0` if it doesn't exist.
---@param path string
---@return number timestamp
function filesystem.lastModified(path) end

---Returns an iterator over the names of the entries of the directory at `path` (empty if there is none).
---Directory names end with a slash.
---```lua
---for name in filesystem.list("/home") do print(name) end
---```
---@param path string
---@return fun(): string? iterator
function filesystem.list(path) end

---Creates the directory `path`, including missing parent directories.
---Returns `true` on success, or `nil` (or `false`) and an error message.
---@param path string
---@return boolean|nil success
---@return string? reason
function filesystem.makeDirectory(path) end

---Deletes the file or directory at `path`; directories are deleted **recursively**.
---Returns `true` on success, or `nil` and an error message.
---@param path string
---@return boolean|nil success
---@return string? reason
function filesystem.remove(path) end

---Renames or moves a file or directory. Between different file systems the file is copied and then deleted,
---which only works for files. Returns `true` on success, or `nil` and an error message.
---@param oldPath string
---@param newPath string
---@return boolean|nil success
---@return string? reason
function filesystem.rename(oldPath, newPath) end

---Copies the file `fromPath` to `toPath` (the target path includes the file name). Directories are not supported.\
---Returns `true` on success, otherwise `false` and possibly an error message.
---@param fromPath string
---@param toPath string
---@return boolean success
---@return string? reason
function filesystem.copy(fromPath, toPath) end

---Opens the file at `path` and returns a raw, **unbuffered** stream (see `FileStream`), or `nil` and an error message.\
---Modes: `"r"` (default), `"rb"`, `"w"`, `"wb"`, `"a"`, `"ab"`; raw streams always work with bytes.
---Usually `io.open` is the better choice: it returns a buffered stream with `lines`, `read("a")` etc.
---Only a limited number of files can be open per file system at once, so close streams when done.
---@param path string
---@param mode? "r"|"rb"|"w"|"wb"|"a"|"ab"
---@return FileStream|nil stream
---@return string? reason
function filesystem.open(path, mode) end

---Raw, unbuffered file stream returned by `filesystem.open`: thin wrappers around the file system component's methods.
---@class FileStream
local FileStream = {}

---Reads up to `n` bytes. Returns `nil` at the end of the file, or `nil` and an error message.
---@param n number
---@return string|nil data
---@return string? reason
function FileStream:read(n) end

---Writes `data` to the file. Returns `true` on success, or `nil` and an error message.
---@param data string
---@return boolean|nil success
---@return string? reason
function FileStream:write(data) end

---Moves the position by `offset` bytes from `whence` (`"set"`: start, `"cur"`: current position, `"end"`: end of file)
---and returns the new position, or `nil` and an error message. Unlike buffered streams, both arguments are required.
---@param whence "set"|"cur"|"end"
---@param offset number
---@return number|nil position
---@return string? reason
function FileStream:seek(whence, offset) end

---Closes the stream, releasing the file handle.
function FileStream:close() end

return filesystem
