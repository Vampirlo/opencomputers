---@meta
-- Copyright (c) 2023, FatalMerlin
-- All rights reserved.
--
-- This source code is licensed under the BSD-style license found in the
-- LICENSE file in the root directory of this source tree.

---Tank controller upgrade: inspects fluid tanks in the world and fluid containers in the device's inventory.\
---In an adapter only the methods taking a `side` are available. Robots can only access tanks in front of, above and below them.\
---Slot and tank indexes are 1-based; amounts are in millibuckets.\
---Component type: `tank_controller`.
---@class ComponentTankController : Component
local tank_controller = {}

---Gets the amount of fluid in the specified tank of the fluid container on the specified side (default: all its tanks combined).
---@param side number
---@param tank? number
---@return integer|nil amount
---@return string? reason `"no tank"`.
function tank_controller.getTankLevel(side, tank) end

---Gets the capacity of the specified tank of the fluid container on the specified side (default: its largest tank).
---@param side number
---@param tank? number
---@return integer|nil capacity
---@return string? reason `"no tank"`.
function tank_controller.getTankCapacity(side, tank) end

---Gets a description of the specified tank of the fluid container on the specified side.\
---Without `tank`, returns an array with the descriptions of all its tanks.\
---Can be disabled with the `misc.allowItemStackInspection` config setting.
---@param side number
---@param tank number
---@return FluidTankInfo|nil info
---@return string? reason E.g. `"no tank"` or `"not enabled in config"`.
---@overload fun(side: number): FluidTankInfo[]|nil, string?
function tank_controller.getFluidInTank(side, tank) end

---Gets the number of tanks of the fluid container on the specified side.
---@param side number
---@return integer|nil count
---@return string? reason `"no tank"`.
function tank_controller.getTankCount(side) end

---Gets the amount of fluid in the fluid container item in the specified slot (default: the selected slot). Robots and drones only.
---@param slot? number
---@return integer|nil amount
---@return string? reason `"item is not a fluid container"`.
function tank_controller.getTankLevelInSlot(slot) end

---Gets the capacity of the fluid container item in the specified slot (default: the selected slot). Robots and drones only.
---@param slot? number
---@return integer|nil capacity
---@return string? reason `"item is not a fluid container"`.
function tank_controller.getTankCapacityInSlot(slot) end

---Gets a description of the fluid in the fluid container item in the specified slot (default: the selected slot). Robots and drones only.\
---Can be disabled with the `misc.allowItemStackInspection` config setting.
---@param slot? number
---@return FluidStackInfo|nil fluid The fluid, or `nil` if the container is empty or on failure.
---@return string? reason E.g. `"item is not a fluid container"` or `"not enabled in config"`.
function tank_controller.getFluidInTankInSlot(slot) end

---Gets a description of the fluid in the specified internal tank (default: the selected tank). Robots and drones only.\
---Can be disabled with the `misc.allowItemStackInspection` config setting.
---@param tank? number
---@return FluidStackInfo|nil fluid The fluid, or `nil` if the tank is empty or on failure.
---@return string? reason `"not enabled in config"`.
function tank_controller.getFluidInInternalTank(tank) end

---Transfers up to `amount` millibuckets (default `1000`) of fluid from the fluid container item in the selected slot into the selected tank.\
---Robots and drones only.
---@param amount? number
---@return boolean|nil success
---@return integer|string amountOrReason The transferred amount, or why nothing was transferred.
function tank_controller.drain(amount) end

---Transfers up to `amount` millibuckets (default `1000`) of fluid from the selected tank into the fluid container item in the selected slot.\
---Robots and drones only.
---@param amount? number
---@return boolean|nil success
---@return integer|string amountOrReason The transferred amount, or why nothing was transferred.
function tank_controller.fill(amount) end

---Description of a fluid stack.
---@class FluidStackInfo
---@field name? string Fluid name, e.g. `"water"`.
---@field label? string Display name, e.g. `"Water"`.
---@field amount integer Amount in millibuckets.
---@field hasTag boolean Whether the fluid stack has an NBT tag.

---Description of a fluid tank: its capacity and, if not empty, its contents.
---@class FluidTankInfo
---@field capacity integer Capacity in millibuckets.
---@field amount integer Amount of fluid in millibuckets (`0` if empty).
---@field name? string Fluid name, e.g. `"water"` (absent if empty).
---@field label? string Display name (absent if empty).
---@field hasTag? boolean Whether the fluid has an NBT tag (absent if empty).
