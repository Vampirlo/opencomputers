---@meta

---Robot component, as seen by the robot's own computer. This is the raw component behind the `robot` library (`require("robot")`):\
---methods take an explicit side (`sides.front`, `sides.top` or `sides.bottom` for actions; also `sides.back` for `move`)\
---and slot/tank indexes are 1-based.\
---A computer *next to* a robot sees a different `robot` component with only `start`, `stop`, `isRunning`, `getName` and `setName`.\
---Component type: `robot`.
---@class ComponentRobot : Component
local robot = {}

---Gets the name of the robot.
---@return string name
function robot.name() end

---Gets the current color of the activity light as an integer encoded RGB value (`0xRRGGBB`).
---@return integer color
function robot.getLightColor() end

---Sets the color of the activity light to the specified integer encoded RGB value (`0xRRGGBB`). Returns the new color.
---@param value number
---@return integer color
function robot.setLightColor(value) end

---Gets the durability of the currently equipped tool, as a fraction from 0 to 1.
---@return number|nil durability
---@return string? reason `"no tool equipped"` or `"tool cannot be damaged"`.
function robot.durability() end

---Moves the robot in the specified direction (`sides.front`, `sides.back`, `sides.top` or `sides.bottom`).
---@param direction number
---@return boolean|nil success
---@return string? reason Why the move failed, e.g. `"solid"`, `"entity"`, `"impossible move"` or `"not enough energy"`.
function robot.move(direction) end

---Rotates the robot in the specified direction.
---@param clockwise boolean
---@return boolean|nil success
---@return string? reason `"not enough energy"`.
function robot.turn(clockwise) end

---Performs a "left click" with the equipped tool towards the specified side.\
---The optional `face` allows a more precise click calibration, and is relative to the targeted block space.
---@param side number `sides.front`, `sides.top` or `sides.bottom`.
---@param face? number Face of the targeted block to click (default: `side`).
---@param sneaky? boolean Whether to sneak while clicking (default `false`).
---@return boolean success
---@return string? what What was hit: `"entity"`, `"block"`, `"fire"` or `"air"`.
function robot.swing(side, face, sneaky) end

---Performs a "right click" with the equipped item towards the specified side.\
---The optional `face` allows a more precise click calibration, and is relative to the targeted block space.
---@param side number `sides.front`, `sides.top` or `sides.bottom`.
---@param face? number Face of the targeted block to click (default: `side`).
---@param sneaky? boolean Whether to sneak while clicking (default `false`).
---@param duration? number How long to "hold" the click, in seconds (default `0`).
---@return boolean success
---@return string? what `"block_activated"`, `"item_placed"`, `"item_used"`, `"item_interacted"` or `"air"`.
function robot.use(side, face, sneaky, duration) end

---Places the block in the selected slot towards the specified side.\
---The optional `face` allows a more precise click calibration, and is relative to the targeted block space.
---@param side number `sides.front`, `sides.top` or `sides.bottom`.
---@param face? number Face of the targeted block to place against (default: `side`).
---@param sneaky? boolean Whether to sneak while placing (default `false`).
---@return boolean|nil success
---@return string? reason `"nothing selected"`.
function robot.place(side, face, sneaky) end

---Checks the contents of the block on the specified side.\
---Returns whether the robot would be blocked moving there, and what is there: `"entity"`, `"solid"`, `"replaceable"`, `"liquid"`, `"passable"` or `"air"`.
---@param side number `sides.front`, `sides.top` or `sides.bottom`.
---@return boolean blocked
---@return string kind
function robot.detect(side) end

---Returns the size of the robot's internal inventory.
---@return integer size
function robot.inventorySize() end

---Gets the currently selected slot; selects the specified slot first if given.
---@param slot? number
---@return integer slot
function robot.select(slot) end

---Gets the number of items in the specified slot (default: the selected slot).
---@param slot? number
---@return integer count
function robot.count(slot) end

---Gets the remaining space in the specified slot (default: the selected slot).
---@param slot? number
---@return integer space
function robot.space(slot) end

---Compares the contents of the selected slot to the contents of the specified slot.
---@param otherSlot number
---@param checkNBT? boolean Also compare NBT data (default `false`).
---@return boolean equal
function robot.compareTo(otherSlot, checkNBT) end

---Moves up to `amount` items (default: the whole stack) from the selected slot into the specified slot.\
---If the target slot holds different items, the stacks are swapped when the whole stack is moved.
---@param toSlot number
---@param amount? number
---@return boolean success
function robot.transferTo(toSlot, amount) end

---Compares the block on the specified side with the one in the selected slot. Returns `true` if equal.
---@param side number `sides.front`, `sides.top` or `sides.bottom`.
---@param fuzzy? boolean Ignore the block's meta/subtype (default `false`).
---@return boolean equal
function robot.compare(side, fuzzy) end

---Drops up to `count` items (default `64`) from the selected slot towards the specified side,\
---into an inventory if there is one, else into the world.
---@param side number `sides.front`, `sides.top` or `sides.bottom`.
---@param count? number
---@return boolean success
---@return string? reason `"inventory full"`.
function robot.drop(side, count) end

---Sucks up to `count` items (default `64`) from an inventory or from the item entities on the specified side into the inventory.\
---Returns the number of items picked up, or `false` if none.
---@param side number `sides.front`, `sides.top` or `sides.bottom`.
---@param count? number
---@return integer|false count
function robot.suck(side, count) end

---Returns the number of tanks installed in the robot.
---@return integer count
function robot.tankCount() end

---Gets the currently selected tank; selects the specified tank first if given.
---@param index? number
---@return integer index
function robot.selectTank(index) end

---Gets the fluid amount in the specified tank (default: the selected tank), in millibuckets.
---@param index? number
---@return integer amount
function robot.tankLevel(index) end

---Gets the remaining fluid capacity in the specified tank (default: the selected tank), in millibuckets.
---@param index? number
---@return integer space
function robot.tankSpace(index) end

---Compares the fluids in the selected and the specified tank. Returns `true` if equal.
---@param index number
---@return boolean equal
function robot.compareFluidTo(index) end

---Moves up to `count` millibuckets (default `1000`) of fluid from the selected tank into the specified tank.
---@param index number
---@param count? number
---@return boolean|nil success
---@return string? reason E.g. `"incompatible or no fluid"`.
function robot.transferFluidTo(index, count) end

---Compares the fluid in the selected tank with the fluid in the world or the tank on the specified side. Returns `true` if equal.
---@param side number `sides.front`, `sides.top` or `sides.bottom`.
---@param tank? number Index of the tank of the external fluid container to compare with (default: any).
---@return boolean equal
function robot.compareFluid(side, tank) end

---Drains up to `amount` millibuckets (default `1000`) of fluid from the world or the tank on the specified side into the selected tank.
---@param side number `sides.front`, `sides.top` or `sides.bottom`.
---@param amount? number
---@return boolean|nil success
---@return integer|string amountOrReason The amount drained, or the error message if `success` is `nil`.
function robot.drain(side, amount) end

---Ejects up to `amount` millibuckets (default `1000`) of fluid from the selected tank into the world or the tank on the specified side.
---@param side number `sides.front`, `sides.top` or `sides.bottom`.
---@param amount? number
---@return boolean|nil success
---@return integer|string amountOrReason The amount ejected, or the error message if `success` is `nil`.
function robot.fill(side, amount) end

---Starts the robot. Returns `true` if the state changed.\
---*Only on the robot block's external component, as seen by an adjacent computer.*
---@return boolean changed
function robot.start() end

---Stops the robot. Returns `true` if the state changed.\
---*Only on the robot block's external component, as seen by an adjacent computer.*
---@return boolean changed
function robot.stop() end

---Returns whether the robot is running.\
---*Only on the robot block's external component, as seen by an adjacent computer.*
---@return boolean running
function robot.isRunning() end

---Returns the robot's name.\
---*Only on the robot block's external component, as seen by an adjacent computer.*
---@return string name
function robot.getName() end

---Sets a new name and returns the old name. The robot must not be running.\
---*Only on the robot block's external component, as seen by an adjacent computer.*
---@param name string
---@return string|nil oldName
---@return string? reason `"is running"`.
function robot.setName(name) end
