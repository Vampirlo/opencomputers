---@meta

---The shell library (`require("shell")`): working directory, program search path, aliases,
---path resolution, running commands and parsing program arguments.
---@class shelllib
local shell = {}

---Loads the shell program named by the `SHELL` environment variable (default `/bin/sh`).
---Returns `nil` and an error message on failure.
---@return function|nil shell
---@return string? reason
function shell.getShell() end

---Gives the current process its own copy of the aliases and environment variables inherited
---from its parent (called by shells at startup).
function shell.prime() end

---Gets the value of an alias, or `nil` if there is no such alias.
---@param alias string
---@return string|nil value
function shell.getAlias(alias) end

---Defines or updates an alias; `nil` removes it. The value may include parameters,
---e.g. `view` is an alias for `edit -r`.
---@param alias string
---@param value? string
function shell.setAlias(alias, value) end

---Returns an iterator over all aliases (name, value), for use in a generic `for`.
---@return fun(aliases: table<string, string>, alias?: string): string, string iterator
---@return table<string, string> aliases
---@return nil
function shell.aliases() end

---Gets the current working directory (environment variable `PWD`, `/` if unset).
---@return string path
function shell.getWorkingDirectory() end

---Sets the current working directory (environment variable `PWD`).
---Returns `nil` and an error message if `dir` is not a directory.
---@param dir string
---@return boolean|nil success
---@return string? reason
function shell.setWorkingDirectory(dir) end

---Gets the program search path (environment variable `PATH`): directories separated by `:`.
---@return string path
function shell.getPath() end

---Sets the program search path (environment variable `PATH`), replacing the previous one.
---To add a directory: `shell.setPath(shell.getPath() .. ":/some/path")`.
---@param value string
function shell.setPath(value) end

---Resolves `path` to an absolute path, relative to the working directory.
---With `ext`, `path` is looked up as a program: a bare name is searched in the search path (see `shell.getPath`),
---trying the name as is and with `"." .. ext` appended. Returns `nil` and an error message if no such file exists.
---@param path string
---@param ext string extension to try, e.g. `"lua"`
---@return string|nil path
---@return string? reason
---@overload fun(path: string): string
function shell.resolve(path, ext) end

---Runs a command with the shell (`SHELL`, default `/bin/sh`).
---`env` is the environment for the shell and thus for the called program (e.g. a sandbox).
---Additional arguments are passed to the first program of the command, so they may be non-string values.
---Returns `true` on success, otherwise a falsy value and an error message.
---@param command string
---@param env? table
---@param ... any
---@return boolean|nil success
---@return any ...
function shell.execute(command, env, ...) end

---Parses program arguments into positional arguments and options.
---`-abc` sets the single-character options `a`, `b` and `c` to `true`; `--name` sets `name` to `true`;
---`--name=value` sets `name` to `"value"`; `--` ends option parsing. Non-string values are kept as arguments.
---Typical use: `local args, options = shell.parse(...)`.
---@param ... any
---@return string[] args
---@return table<string, string|boolean> options
function shell.parse(...) end

return shell
