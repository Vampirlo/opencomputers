---@meta

---Transposer: moves items and fluids between the inventories and tanks adjacent to it, and inspects them.\
---Sides are absolute (`sides.north`, `sides.up`, ...); slot and tank indexes are 1-based; fluid amounts are in millibuckets.\
---Component type: `transposer`.
---@class ComponentTransposer : Component
local transposer = {}

---Transfers up to `count` items (default `64`) from the inventory on `sourceSide` to the inventory on `sinkSide`.\
---If `sourceSlot` is given, only items from that slot are moved; if `sinkSlot` is given, only into that slot.\
---Returns the number of items moved.
---@param sourceSide number
---@param sinkSide number
---@param count? number
---@param sourceSlot? number
---@param sinkSlot? number
---@return integer|nil count
---@return string? reason E.g. `"not enough energy"` or `"no inventory"`.
function transposer.transferItem(sourceSide, sinkSide, count, sourceSlot, sinkSlot) end

---Transfers up to `count` millibuckets (default `1000`) of fluid from the tank on `sourceSide` to the tank on `sinkSide`,\
---optionally only from the specified tank of the source. Returns whether fluid was moved and the moved amount.
---@param sourceSide number
---@param sinkSide number
---@param count? number
---@param sourceTank? number
---@return boolean|nil success
---@return integer|string amountOrReason The moved amount, or the error message if `success` is `nil`.
function transposer.transferFluid(sourceSide, sinkSide, count, sourceTank) end

---Gets the number of slots in the inventory on the specified side.
---@param side number
---@return integer|nil size
---@return string? reason `"no inventory"`.
function transposer.getInventorySize(side) end

---Gets the number of items in the specified slot of the inventory on the specified side.
---@param side number
---@param slot number
---@return integer|nil count
---@return string? reason `"no inventory"`.
function transposer.getSlotStackSize(side, slot) end

---Gets the maximum number of items in the specified slot of the inventory on the specified side.
---@param side number
---@param slot number
---@return integer|nil maxSize
---@return string? reason `"no inventory"`.
function transposer.getSlotMaxStackSize(side, slot) end

---Gets whether the items in the two specified slots of the inventory on the specified side are of the same type.
---@param side number
---@param slotA number
---@param slotB number
---@param checkNBT? boolean Also compare NBT data (default `false`).
---@return boolean|nil equal
---@return string? reason `"no inventory"`.
function transposer.compareStacks(side, slotA, slotB, checkNBT) end

---Compares the item in the specified slot of the inventory on the specified side with the one in the specified slot of a database.
---@param side number
---@param slot number
---@param dbAddress string
---@param dbSlot number
---@param checkNBT? boolean Also compare NBT data (default `false`).
---@return boolean|nil equal
---@return string? reason `"no inventory"`.
function transposer.compareStackToDatabase(side, slot, dbAddress, dbSlot, checkNBT) end

---Gets whether the items in the two specified slots of the inventory on the specified side are equivalent (have shared OreDictionary IDs).
---@param side number
---@param slotA number
---@param slotB number
---@return boolean|nil equivalent
---@return string? reason `"no inventory"`.
function transposer.areStacksEquivalent(side, slotA, slotB) end

---Gets a description of the item stack in the specified slot of the inventory on the specified side.\
---Can be disabled with the `misc.allowItemStackInspection` config setting.
---@param side number
---@param slot number
---@return ItemStackInfo|nil stack The stack, or `nil` if the slot is empty or on failure.
---@return string? reason E.g. `"no inventory"` or `"not enabled in config"`.
function transposer.getStackInSlot(side, slot) end

---Gets a description of all item stacks in the inventory on the specified side, as an iterator object.\
---Can be disabled with the `misc.allowItemStackInspection` config setting.
---@param side number
---@return ItemStackArray|nil stacks
---@return string? reason E.g. `"no inventory"` or `"not enabled in config"`.
function transposer.getAllStacks(side) end

---Gets the registry name of the inventory block (or entity) on the specified side, e.g. `"minecraft:chest"`.\
---Can be disabled with the `misc.allowItemStackInspection` config setting.
---@param side number
---@return string|nil name
---@return string? reason E.g. `"no inventory"` or `"not enabled in config"`.
function transposer.getInventoryName(side) end

---Stores a description of the item stack in the specified slot of the inventory on the specified side in the specified slot of a database.\
---Returns `true` if the database slot was occupied before.
---@param side number
---@param slot number
---@param dbAddress string
---@param dbSlot number
---@return boolean|nil overwritten
---@return string? reason `"no inventory"`.
function transposer.store(side, slot, dbAddress, dbSlot) end

---Gets the amount of fluid in the specified tank of the fluid container on the specified side (default: all its tanks combined).
---@param side number
---@param tank? number
---@return integer|nil amount
---@return string? reason `"no tank"`.
function transposer.getTankLevel(side, tank) end

---Gets the capacity of the specified tank of the fluid container on the specified side (default: its largest tank).
---@param side number
---@param tank? number
---@return integer|nil capacity
---@return string? reason `"no tank"`.
function transposer.getTankCapacity(side, tank) end

---Gets a description of the specified tank of the fluid container on the specified side.\
---Without `tank`, returns an array with the descriptions of all its tanks.\
---Can be disabled with the `misc.allowItemStackInspection` config setting.
---@param side number
---@param tank number
---@return FluidTankInfo|nil info
---@return string? reason E.g. `"no tank"` or `"not enabled in config"`.
---@overload fun(side: number): FluidTankInfo[]|nil, string?
function transposer.getFluidInTank(side, tank) end

---Gets the number of tanks of the fluid container on the specified side.
---@param side number
---@return integer|nil count
---@return string? reason `"no tank"`.
function transposer.getTankCount(side) end
