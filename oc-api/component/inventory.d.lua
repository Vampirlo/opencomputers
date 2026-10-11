---@meta

---Any inventory block (e.g. a chest), accessed through an adapter block via OpenComputers' generic inventory driver.\
---Only available if `enableInventoryDriver` is enabled in the OpenComputers config (disabled by default).\
---The component type is derived from the block, e.g. `chest`, so use `component.proxy(address)` with this class.\
---Slot indexes are 1-based. Methods return `nil, "permission denied"` if the block is protected.
---@class ComponentInventory : Component
local inventory = {}

---Gets the name of this inventory, e.g. `"container.chest"`.
---@return string|nil name
---@return string? reason `"permission denied"`.
function inventory.getInventoryName() end

---Gets the number of slots in this inventory.
---@return integer|nil size
---@return string? reason `"permission denied"`.
function inventory.getInventorySize() end

---Gets the number of items in the specified slot.
---@param slot number
---@return integer|nil count
---@return string? reason `"permission denied"`.
function inventory.getSlotStackSize(slot) end

---Gets the maximum number of items in the specified slot.
---@param slot number
---@return integer|nil maxSize
---@return string? reason `"permission denied"`.
function inventory.getSlotMaxStackSize(slot) end

---Compares the item stacks in the two specified slots for equality.
---@param slotA number
---@param slotB number
---@return boolean|nil equal
---@return string? reason `"permission denied"`.
function inventory.compareStacks(slotA, slotB) end

---Moves up to `count` items (default: a full stack) from the first specified slot to the second; different stacks are swapped.
---@param slotA number
---@param slotB number
---@param count? number
---@return boolean|nil success
---@return string? reason `"permission denied"`.
function inventory.transferStack(slotA, slotB, count) end

---Gets a description of the item stack in the specified slot (for an empty slot, a stack of `"minecraft:air"` with `size` 0).\
---Can be disabled with the `misc.allowItemStackInspection` config setting.
---@param slot number
---@return ItemStackInfo|nil stack The stack, or `nil` on failure.
---@return string? reason E.g. `"permission denied"` or `"not enabled in config"`.
function inventory.getStackInSlot(slot) end

---Gets descriptions of all item stacks in this inventory, as an array indexed by slot (empty slots are stacks of `"minecraft:air"` with `size` 0).\
---Can be disabled with the `misc.allowItemStackInspection` config setting.
---@return ItemStackInfo[]|nil stacks
---@return string? reason E.g. `"permission denied"` or `"not enabled in config"`.
function inventory.getAllStacks() end
