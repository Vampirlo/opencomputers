---@meta
-- Copyright (c) 2023, FatalMerlin
-- All rights reserved.
--
-- This source code is licensed under the BSD-style license found in the
-- LICENSE file in the root directory of this source tree.

---Database upgrade: stores item stack descriptions that other components (inventory controller, transposer, geolyzer, ...) can store into and compare against.\
---Component type: `database`.
---@class ComponentDatabase : Component
local database = {}

---Gets the representation of the item stack stored in the specified slot.
---@param slot number
---@return ItemStackInfo|nil stack The stack, or `nil` if the slot is empty.
function database.get(slot) end

---Computes a hash value for the item stack in the specified slot.\
---This value is the same for identical item stacks, allowing to compare stacks across a network.
---@param slot number
---@return string|nil hash The hash, or `nil` if the slot is empty.
function database.computeHash(slot) end

---Gets the slot of an item stack with the specified hash (see `computeHash`). Returns a negative value if no such stack was found.
---@param hash string
---@return integer slot
function database.indexOf(hash) end

---Clears the specified slot. Returns `true` if there was something in the slot before.
---@param slot number
---@return boolean hadStack
function database.clear(slot) end

---Copies an entry to another slot, optionally in another database. Returns `true` if something was overwritten.
---@param fromSlot number
---@param toSlot number
---@param address? string Address of the target database (default: this one).
---@return boolean overwritten
function database.copy(fromSlot, toSlot, address) end

---Copies the data stored in this database to the database with the specified address. Returns the number of copied slots.
---@param address string
---@return integer count
function database.clone(address) end
