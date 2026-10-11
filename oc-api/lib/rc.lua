---@meta

---The rc library (`require("rc")`): state of the rc service controller. rc scripts (services) are files
---in `/etc/rc.d/` defining global functions such as `start` and `stop`; they are managed with the `rc` command
---and configured in `/etc/rc.cfg`. Enabled scripts are started at boot.
---@class rclib
---@field loaded table<string, table> environments of the loaded rc scripts, by script name
local rc = {}

---Removes an rc script from the cache, so that the script and its configuration are loaded again when next used.
---Provided by `/bin/rc.lua`, which runs at boot.
---@param name string script name (its file name in `/etc/rc.d/` without `.lua`)
function rc.unload(name) end

return rc
