---@meta
-- Copyright (c) 2023, FatalMerlin
-- All rights reserved.
--
-- This source code is licensed under the BSD-style license found in the
-- LICENSE file in the root directory of this source tree.

---Inventory controller upgrade: inspects and accesses inventories slot by slot.\
---In robots and drones it also inspects the internal inventory; in an adapter only the methods taking a `side` are available.\
---Robots can only access inventories in front of (`sides.front`), above and below them. Slot indexes are 1-based.\
---Component type: `inventory_controller`.
---@class ComponentInventoryController : Component
local inventory_controller = {}

---Gets the number of slots in the inventory on the specified side of the device.
---@param side number
---@return integer|nil size
---@return string? reason `"no inventory"`.
function inventory_controller.getInventorySize(side) end

---Gets the number of items in the specified slot of the inventory on the specified side of the device.
---@param side number
---@param slot number
---@return integer|nil count
---@return string? reason `"no inventory"`.
function inventory_controller.getSlotStackSize(side, slot) end

---Gets the maximum number of items in the specified slot of the inventory on the specified side of the device.
---@param side number
---@param slot number
---@return integer|nil maxSize
---@return string? reason `"no inventory"`.
function inventory_controller.getSlotMaxStackSize(side, slot) end

---Gets whether the items in the two specified slots of the inventory on the specified side of the device are of the same type.
---@param side number
---@param slotA number
---@param slotB number
---@param checkNBT? boolean Also compare NBT data (default `false`).
---@return boolean|nil equal
---@return string? reason `"no inventory"`.
function inventory_controller.compareStacks(side, slotA, slotB, checkNBT) end

---Compares the item in the specified slot of the inventory on the specified side with the one in the specified slot of a database.
---@param side number
---@param slot number
---@param dbAddress string
---@param dbSlot number
---@param checkNBT? boolean Also compare NBT data (default `false`).
---@return boolean|nil equal
---@return string? reason `"no inventory"`.
function inventory_controller.compareStackToDatabase(side, slot, dbAddress, dbSlot, checkNBT) end

---Gets whether the items in the two specified slots of the inventory on the specified side of the device are equivalent\
---(have shared OreDictionary IDs).
---@param side number
---@param slotA number
---@param slotB number
---@return boolean|nil equivalent
---@return string? reason `"no inventory"`.
function inventory_controller.areStacksEquivalent(side, slotA, slotB) end

---Gets a description of the item stack in the specified slot of the inventory on the specified side of the device.\
---Can be disabled with the `misc.allowItemStackInspection` config setting.
---@param side number
---@param slot number
---@return ItemStackInfo|nil stack The stack, or `nil` if the slot is empty or on failure.
---@return string? reason E.g. `"no inventory"` or `"not enabled in config"`.
function inventory_controller.getStackInSlot(side, slot) end

---Gets a description of all item stacks in the inventory on the specified side of the device, as an iterator object.\
---Can be disabled with the `misc.allowItemStackInspection` config setting.
---@param side number
---@return ItemStackArray|nil stacks
---@return string? reason E.g. `"no inventory"` or `"not enabled in config"`.
function inventory_controller.getAllStacks(side) end

---Gets the registry name of the inventory block (or entity) on the specified side of the device, e.g. `"minecraft:chest"`.\
---Can be disabled with the `misc.allowItemStackInspection` config setting.
---@param side number
---@return string|nil name
---@return string? reason E.g. `"no inventory"` or `"not enabled in config"`.
function inventory_controller.getInventoryName(side) end

---Stores a description of the item stack in the specified slot of the inventory on the specified side in the specified slot of a database.\
---Returns `true` if the database slot was occupied before.
---@param side number
---@param slot number
---@param dbAddress string
---@param dbSlot number
---@return boolean|nil overwritten
---@return string? reason `"no inventory"`.
function inventory_controller.store(side, slot, dbAddress, dbSlot) end

---Gets a description of the item stack in the specified slot (default: the selected slot) of the device's own inventory. Robots and drones only.\
---Can be disabled with the `misc.allowItemStackInspection` config setting.
---@param slot? number
---@return ItemStackInfo|nil stack The stack, or `nil` if the slot is empty or on failure.
---@return string? reason `"not enabled in config"`.
function inventory_controller.getStackInInternalSlot(slot) end

---Gets whether the item stack in the selected slot is equivalent to the one in the specified slot (have shared OreDictionary IDs).\
---Robots and drones only.
---@param otherSlot number
---@return boolean equivalent
function inventory_controller.isEquivalentTo(otherSlot) end

---Stores a description of the item stack in the specified slot of the device's own inventory in the specified slot of a database.\
---Returns `true` if the database slot was occupied before. Robots and drones only.
---@param slot number
---@param dbAddress string
---@param dbSlot number
---@return boolean overwritten
function inventory_controller.storeInternal(slot, dbAddress, dbSlot) end

---Compares the item stack in the specified slot of the device's own inventory with the one in the specified slot of a database.\
---Robots and drones only.
---@param slot number
---@param dbAddress string
---@param dbSlot number
---@param checkNBT? boolean Also compare NBT data (default `false`).
---@return boolean equal
function inventory_controller.compareToDatabase(slot, dbAddress, dbSlot, checkNBT) end

---Drops up to `count` items (default `64`) of the selected stack into the specified slot of the inventory on side `facing`.\
---Robots and drones only.
---@param facing number Side of the inventory.
---@param slot number Slot of the target inventory.
---@param count? number
---@param fromSide? number Side of the target inventory to access, for sided inventories (default: the side facing the device).
---@return boolean|nil success
---@return string? reason E.g. `"no inventory"` or `"inventory full/invalid slot"`.
function inventory_controller.dropIntoSlot(facing, slot, count, fromSide) end

---Sucks up to `count` items (default `64`) from the specified slot of the inventory on side `facing` into the selected slot (or the next free one).\
---Returns the number of items taken, or `false` if none. Robots and drones only.
---@param facing number Side of the inventory.
---@param slot number Slot of the source inventory.
---@param count? number
---@param fromSide? number Side of the source inventory to access, for sided inventories (default: the side facing the device).
---@return integer|false|nil count
---@return string? reason `"no inventory"`.
function inventory_controller.suckFromSlot(facing, slot, count, fromSide) end

---Gets the size of the inventory of the item (e.g. a backpack) in the specified slot of the device's own inventory.\
---Robots and drones only.
---@param slot number
---@return integer size `0` if the item has no inventory.
---@return string? reason `"no item inventory"`.
function inventory_controller.getItemInventorySize(slot) end

---Drops up to `count` items (default `64`) from the selected slot into the specified slot of the inventory of the item in slot `inventorySlot`.\
---Returns the number of items moved. Robots and drones only.
---@param inventorySlot number Slot of the device's inventory holding the item with an inventory.
---@param slot number Slot of the item's inventory.
---@param count? number
---@return integer count
---@return string? reason `"no item inventory"`.
function inventory_controller.dropIntoItemInventory(inventorySlot, slot, count) end

---Sucks up to `count` items (default `64`) out of the specified slot of the inventory of the item in slot `inventorySlot`.\
---Returns the number of items moved. Robots and drones only.
---@param inventorySlot number Slot of the device's inventory holding the item with an inventory.
---@param slot number Slot of the item's inventory.
---@param count? number
---@return integer count
---@return string? reason `"no item inventory"`.
function inventory_controller.suckFromItemInventory(inventorySlot, slot, count) end

---Swaps the content of the robot's tool slot with the content of the selected slot. Robots only.
---@return boolean success
function inventory_controller.equip() end

---Description of an item stack, as returned by `getStackInSlot` and similar methods.
---@class ItemStackInfo
---@field name string Item name, e.g. `"minecraft:stone"`.
---@field label string Display name, e.g. `"Stone"`.
---@field size integer Number of items in the stack.
---@field maxSize integer Maximum stack size.
---@field damage integer Damage value (or metadata).
---@field maxDamage integer Maximum damage before the item breaks.
---@field hasTag boolean Whether the stack has an NBT tag.
---@field id? integer Numeric item ID (only if `insertIdsInConverters` is enabled in the config).
---@field oreNames? string[] OreDictionary names (only if `insertIdsInConverters` is enabled in the config).
---@field lore? string Lore lines, separated by newlines.
---@field enchantments? ItemStackEnchantment[]
---@field customDamage? integer IndustrialCraft 2 reactor component damage.
---@field Energy? integer Stored energy from the `Energy` NBT tag, if present.
---@field tag? string Compressed NBT data (only if `allowItemStackNBTTags` is enabled in the config).

---An enchantment of an item stack.
---@class ItemStackEnchantment
---@field name string E.g. `"enchantment.durability"`.
---@field label string E.g. `"Unbreaking III"`.
---@field level integer

---Descriptions of all item stacks of an inventory (userdata). Call it to iterate: each call returns the next stack,\
---an empty table for an empty slot, or `nil` at the end. Index it with a slot number to get that slot's stack; `n` is the number of slots.
---@class ItemStackArray
---@field n integer Number of slots.
---@field [integer] ItemStackInfo|nil
---@overload fun(): ItemStackInfo|nil
local ItemStackArray = {}

---Resets the iterator, so that the next call returns the first stack again.
function ItemStackArray.reset() end

---Returns the number of slots.
---@return integer count
function ItemStackArray.count() end

---Returns all stacks as a table indexed by slot (memory intensive); empty slots are empty tables.
---@return table<integer, ItemStackInfo> stacks
function ItemStackArray.getAll() end
