---@meta
-- Copyright (c) 2023, FatalMerlin
-- All rights reserved.
--
-- This source code is licensed under the BSD-style license found in the
-- LICENSE file in the root directory of this source tree.

---Drone component, as seen by the drone's own computer. Drones can act on all six sides; slot/tank indexes are 1-based.\
---Component type: `drone`.
---@class ComponentDrone : Component
local drone = {}

---Gets the name of the drone.
---@return string name
function drone.name() end

---Gets the status text currently being displayed in the GUI.
---@return string text
function drone.getStatusText() end

---Sets the status text to display in the GUI. Returns the new value.
---@param value string
---@return string text
function drone.setStatusText(value) end

---Gets the current color of the flap lights as an integer encoded RGB value (`0xRRGGBB`).
---@return integer color
function drone.getLightColor() end

---Sets the color of the flap lights to the specified integer encoded RGB value (`0xRRGGBB`). Returns the new color.
---@param value number
---@return integer color
function drone.setLightColor(value) end

---Changes the target position by the specified offset. The drone then flies there on its own (see `getOffset`).
---@param dx number
---@param dy number
---@param dz number
function drone.move(dx, dy, dz) end

---Gets the current distance to the target position.
---@return number distance
function drone.getOffset() end

---Gets the current velocity, in m/s.
---@return number velocity
function drone.getVelocity() end

---Gets the maximum velocity, in m/s.
---@return number velocity
function drone.getMaxVelocity() end

---Gets the currently set acceleration.
---@return number acceleration
function drone.getAcceleration() end

---Tries to set the acceleration to the specified value and returns the new acceleration.
---@param value number
---@return number acceleration
function drone.setAcceleration(value) end

---Performs a "left click" with the equipped tool towards the specified side.\
---The optional `face` allows a more precise click calibration, and is relative to the targeted block space.
---@param side number
---@param face? number Face of the targeted block to click (default: `side`).
---@param sneaky? boolean Whether to sneak while clicking (default `false`).
---@return boolean success
---@return string? what What was hit: `"entity"`, `"block"`, `"fire"` or `"air"`.
function drone.swing(side, face, sneaky) end

---Performs a "right click" with the equipped item towards the specified side.\
---The optional `face` allows a more precise click calibration, and is relative to the targeted block space.
---@param side number
---@param face? number Face of the targeted block to click (default: `side`).
---@param sneaky? boolean Whether to sneak while clicking (default `false`).
---@param duration? number How long to "hold" the click, in seconds (default `0`).
---@return boolean success
---@return string? what `"block_activated"`, `"item_placed"`, `"item_used"`, `"item_interacted"` or `"air"`.
function drone.use(side, face, sneaky, duration) end

---Places the block in the selected slot towards the specified side.\
---The optional `face` allows a more precise click calibration, and is relative to the targeted block space.
---@param side number
---@param face? number Face of the targeted block to place against (default: `side`).
---@param sneaky? boolean Whether to sneak while placing (default `false`).
---@return boolean|nil success
---@return string? reason `"nothing selected"`.
function drone.place(side, face, sneaky) end

---Checks the contents of the block on the specified side.\
---Returns whether a drone would be blocked moving there, and what is there: `"entity"`, `"solid"`, `"replaceable"`, `"liquid"`, `"passable"` or `"air"`.
---@param side number
---@return boolean blocked
---@return string kind
function drone.detect(side) end

---Returns the size of the drone's internal inventory.
---@return integer size
function drone.inventorySize() end

---Gets the currently selected slot; selects the specified slot first if given.
---@param slot? number
---@return integer slot
function drone.select(slot) end

---Gets the number of items in the specified slot (default: the selected slot).
---@param slot? number
---@return integer count
function drone.count(slot) end

---Gets the remaining space in the specified slot (default: the selected slot).
---@param slot? number
---@return integer space
function drone.space(slot) end

---Compares the contents of the selected slot to the contents of the specified slot.
---@param otherSlot number
---@param checkNBT? boolean Also compare NBT data (default `false`).
---@return boolean equal
function drone.compareTo(otherSlot, checkNBT) end

---Moves up to `amount` items (default: the whole stack) from the selected slot into the specified slot.
---@param toSlot number
---@param amount? number
---@return boolean success
function drone.transferTo(toSlot, amount) end

---Compares the block on the specified side with the one in the selected slot. Returns `true` if equal.
---@param side number
---@param fuzzy? boolean Ignore the block's meta/subtype (default `false`).
---@return boolean equal
function drone.compare(side, fuzzy) end

---Drops up to `count` items (default `64`) from the selected slot towards the specified side,\
---into an inventory if there is one, else into the world.
---@param side number
---@param count? number
---@return boolean success
---@return string? reason `"inventory full"`.
function drone.drop(side, count) end

---Sucks up to `count` items (default `64`) from an inventory or from the item entities on the specified side into the inventory.\
---Returns the number of items picked up, or `false` if none.
---@param side number
---@param count? number
---@return integer|false count
function drone.suck(side, count) end

---Returns the number of tanks installed in the drone.
---@return integer count
function drone.tankCount() end

---Gets the currently selected tank; selects the specified tank first if given.
---@param index? number
---@return integer index
function drone.selectTank(index) end

---Gets the fluid amount in the specified tank (default: the selected tank), in millibuckets.
---@param index? number
---@return integer amount
function drone.tankLevel(index) end

---Gets the remaining fluid capacity in the specified tank (default: the selected tank), in millibuckets.
---@param index? number
---@return integer space
function drone.tankSpace(index) end

---Compares the fluids in the selected and the specified tank. Returns `true` if equal.
---@param index number
---@return boolean equal
function drone.compareFluidTo(index) end

---Moves up to `count` millibuckets (default `1000`) of fluid from the selected tank into the specified tank.
---@param index number
---@param count? number
---@return boolean|nil success
---@return string? reason E.g. `"incompatible or no fluid"`.
function drone.transferFluidTo(index, count) end

---Compares the fluid in the selected tank with the fluid in the world or the tank on the specified side. Returns `true` if equal.
---@param side number
---@param tank? number Index of the tank of the external fluid container to compare with (default: any).
---@return boolean equal
function drone.compareFluid(side, tank) end

---Drains up to `amount` millibuckets (default `1000`) of fluid from the world or the tank on the specified side into the selected tank.
---@param side number
---@param amount? number
---@return boolean|nil success
---@return integer|string amountOrReason The amount drained, or the error message if `success` is `nil`.
function drone.drain(side, amount) end

---Ejects up to `amount` millibuckets (default `1000`) of fluid from the selected tank into the world or the tank on the specified side.
---@param side number
---@param amount? number
---@return boolean|nil success
---@return integer|string amountOrReason The amount ejected, or the error message if `success` is `nil`.
function drone.fill(side, amount) end
