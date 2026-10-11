---@meta

---The robot library (`require("robot")`): convenience wrappers around the robot component (`component.robot`)
---with direction-specific functions such as `forward`, `turnLeft`, `swingUp` or `dropDown`.
---Only available on robots: it is provided by the robot's ROM.
---@class robotlib
local robot = {}

-------------------------------------------------------------------------------
-- General

---Returns the robot's name. It is set when the robot is assembled and can only be changed with an anvil.
---@return string name
function robot.name() end

---Returns the experience level of the robot (the fractional part is the progress towards the next level),
---or `0` if no experience upgrade is installed. Same as `component.experience.level()`.
---@return number level
function robot.level() end

---Gets the color of the robot's activity light as an RGB integer (`0xRRGGBB`).
---@return integer color
function robot.getLightColor() end

---Sets the color of the robot's activity light (`0xRRGGBB`).
---@param value number RGB color
---@return integer color the new color
function robot.setLightColor(value) end

-------------------------------------------------------------------------------
-- World

---Detects what is directly in front of the robot.
---Returns whether it would block the robot's movement (a block or an entity) and what it is:
---`"entity"`, `"solid"`, `"replaceable"`, `"liquid"`, `"passable"` or `"air"`.
---@return boolean blocking
---@return string what
function robot.detect() end

---Like `robot.detect`, but checks the block directly above the robot.
---@return boolean blocking
---@return string what
function robot.detectUp() end

---Like `robot.detect`, but checks the block directly below the robot.
---@return boolean blocking
---@return string what
function robot.detectDown() end

-------------------------------------------------------------------------------
-- Inventory

---Returns the number of slots in the robot's internal inventory (16 per inventory upgrade).
---@return integer size
function robot.inventorySize() end

---Selects the given inventory slot (if specified) and returns the currently selected slot.
---Raises an error for an invalid slot.
---@param slot? number slot to select; omit to only query the selected slot
---@return integer slot the selected slot
function robot.select(slot) end

---Returns the number of items in the given slot, or in the selected slot.
---@param slot? number
---@return integer count
function robot.count(slot) end

---Returns how many more items fit into the given slot, or into the selected slot
---(depends on the stack size of the item in it).
---@param slot? number
---@return integer space
function robot.space(slot) end

---Compares the item in the selected slot with the item in the given slot.
---Items are equal if their type and metadata (damage) are the same; NBT is compared only if `checkNBT` is `true`.
---@param slot number
---@param checkNBT? boolean also compare the items' NBT data (default `false`)
---@return boolean equal
function robot.compareTo(slot, checkNBT) end

---Moves all (or up to `count`) items from the selected slot into the given slot.
---If the target slot holds other items, the contents are swapped, which only works if all items are moved.
---Always succeeds if the target is the selected slot.
---@param slot number target slot
---@param count? number maximum number of items to move (default: the whole stack)
---@return boolean success
function robot.transferTo(slot, count) end

-------------------------------------------------------------------------------
-- Inventory + World

---Compares the block in front of the robot with the item in the selected slot.
---Blocks are equal if their type and metadata are the same (with `fuzzy`, metadata is ignored).
---An empty slot never equals air: use `robot.detect` to check for air.
---@param fuzzy? boolean ignore the metadata (default `false`)
---@return boolean equal
function robot.compare(fuzzy) end

---Like `robot.compare`, but for the block directly above the robot.
---@param fuzzy? boolean ignore the metadata (default `false`)
---@return boolean equal
function robot.compareUp(fuzzy) end

---Like `robot.compare`, but for the block directly below the robot.
---@param fuzzy? boolean ignore the metadata (default `false`)
---@return boolean equal
function robot.compareDown(fuzzy) end

---Drops items from the selected slot in front of the robot: into an inventory there, if any, otherwise into the world.
---Returns `true` if at least one item was dropped; `false` (and `"inventory full"`) if the inventory in front
---cannot take the items, or if the selected slot is empty.
---@param count? number maximum number of items to drop (default: the whole stack)
---@return boolean success
---@return string? reason
function robot.drop(count) end

---Like `robot.drop`, but drops items upwards (e.g. into an inventory above the robot).
---@param count? number maximum number of items to drop (default: the whole stack)
---@return boolean success
---@return string? reason
function robot.dropUp(count) end

---Like `robot.drop`, but drops items downwards (e.g. into an inventory below the robot).
---@param count? number maximum number of items to drop (default: the whole stack)
---@return boolean success
---@return string? reason
function robot.dropDown(count) end

---Picks up items from the inventory or the ground in front of the robot,
---into the selected slot or the next slots after it that can hold them.
---Returns the number of items picked up, or `false` if none were.
---@param count? number maximum number of items to take (default: one stack)
---@return integer|false count
function robot.suck(count) end

---Like `robot.suck`, but takes items from above the robot.
---@param count? number maximum number of items to take (default: one stack)
---@return integer|false count
function robot.suckUp(count) end

---Like `robot.suck`, but takes items from below the robot.
---@param count? number maximum number of items to take (default: one stack)
---@return integer|false count
function robot.suckDown(count) end

---Places the block (or item) from the selected slot in front of the robot.
---`side` is the surface of the target block space to place against (see `sides`), e.g. to attach a torch to
---a specific side; if omitted, all possible sides are tried. Without an angel upgrade, blocks can only be
---placed next to another block. Returns `nil` and a reason if the selected slot is empty.
---@param side? number surface to place against (relative to the target block space)
---@param sneaky? boolean simulate sneak-placing (default `false`)
---@return boolean|nil success
---@return string? reason
function robot.place(side, sneaky) end

---Like `robot.place`, but places into the space directly above the robot.
---@param side? number surface to place against (relative to the target block space)
---@param sneaky? boolean simulate sneak-placing (default `false`)
---@return boolean|nil success
---@return string? reason
function robot.placeUp(side, sneaky) end

---Like `robot.place`, but places into the space directly below the robot.
---@param side? number surface to place against (relative to the target block space)
---@param sneaky? boolean simulate sneak-placing (default `false`)
---@return boolean|nil success
---@return string? reason
function robot.placeDown(side, sneaky) end

-------------------------------------------------------------------------------
-- Tool

---Returns the remaining durability of the equipped tool as a fraction (`1` = new, `0` = broken).
---Returns `nil` and `"no tool equipped"` or `"tool cannot be damaged"` if there is no durability to report.
---@return number|nil durability
---@return string? reason
function robot.durability() end

---Uses the equipped tool on the block or entity in front of the robot, like a player's left click
---(mining blocks, attacking entities, extinguishing fire). Waits as long as the action would take a player.
---Returns whether it succeeded and what was targeted: `"entity"`, `"block"`, `"fire"` or `"air"`.
---@param side? number surface of the target block space to click (see `sides`); omit to try all sides
---@param sneaky? boolean simulate a sneak-click (default `false`)
---@return boolean success
---@return string? what
function robot.swing(side, sneaky) end

---Like `robot.swing`, but targets the block or entity directly above the robot.
---@param side? number surface of the target block space to click (see `sides`); omit to try all sides
---@param sneaky? boolean simulate a sneak-click (default `false`)
---@return boolean success
---@return string? what
function robot.swingUp(side, sneaky) end

---Like `robot.swing`, but targets the block or entity directly below the robot.
---@param side? number surface of the target block space to click (see `sides`); omit to try all sides
---@param sneaky? boolean simulate a sneak-click (default `false`)
---@return boolean success
---@return string? what
function robot.swingDown(side, sneaky) end

---Uses the equipped item on the block or entity in front of the robot, like a player's right click.
---On success also returns what happened: `"block_activated"`, `"item_placed"`, `"item_interacted"` or `"item_used"`.
---@param side? number surface of the target block space to click (see `sides`); omit to try all sides
---@param sneaky? boolean simulate a sneak-click (default `false`); some items (e.g. buckets) behave differently
---@param duration? number how long to use the item, in seconds (e.g. to charge a bow)
---@return boolean success
---@return string? what
function robot.use(side, sneaky, duration) end

---Like `robot.use`, but targets the area directly above the robot.
---@param side? number surface of the target block space to click (see `sides`); omit to try all sides
---@param sneaky? boolean simulate a sneak-click (default `false`)
---@param duration? number how long to use the item, in seconds
---@return boolean success
---@return string? what
function robot.useUp(side, sneaky, duration) end

---Like `robot.use`, but targets the area directly below the robot.
---@param side? number surface of the target block space to click (see `sides`); omit to try all sides
---@param sneaky? boolean simulate a sneak-click (default `false`)
---@param duration? number how long to use the item, in seconds
---@return boolean success
---@return string? what
function robot.useDown(side, sneaky, duration) end

-------------------------------------------------------------------------------
-- Movement

---Moves the robot one block forward.
---Returns `true` on success, otherwise `nil` and the reason: `"impossible move"`, `"not enough energy"`
---or the obstacle as described by `robot.detect` (e.g. `"solid"`, `"entity"`).
---@return boolean|nil success
---@return string? reason
function robot.forward() end

---Like `robot.forward`, but moves the robot one block backwards.
---@return boolean|nil success
---@return string? reason
function robot.back() end

---Like `robot.forward`, but moves the robot one block up (limited by the flight height rules).
---@return boolean|nil success
---@return string? reason
function robot.up() end

---Like `robot.forward`, but moves the robot one block down.
---@return boolean|nil success
---@return string? reason
function robot.down() end

---Turns the robot 90° to the left. Can only fail if there is not enough energy.
---@return boolean|nil success
---@return string? reason
function robot.turnLeft() end

---Turns the robot 90° to the right. Can only fail if there is not enough energy.
---@return boolean|nil success
---@return string? reason
function robot.turnRight() end

---Turns the robot 180° (two turns in a random direction).
---@return boolean|nil success
function robot.turnAround() end

-------------------------------------------------------------------------------
-- Tank

---Returns the number of tanks installed in the robot (tank upgrades).
---@return integer count
function robot.tankCount() end

---Selects the given tank (if specified) and returns the currently selected tank.
---Most fluid operations work on the selected tank.
---@param tank? number tank to select; omit to only query the selected tank
---@return integer tank the selected tank
function robot.selectTank(tank) end

---Returns the amount of fluid (mB) in the given tank, or in the selected tank.
---@param tank? number
---@return integer amount
function robot.tankLevel(tank) end

---Returns the remaining capacity (mB) of the given tank, or of the selected tank.
---@param tank? number
---@return integer space
function robot.tankSpace(tank) end

---Checks whether the fluid in the selected tank is the same as the fluid in the given tank.
---@param tank number
---@return boolean equal
function robot.compareFluidTo(tank) end

---Moves fluid from the selected tank into the given tank (swapping the contents if they cannot be merged).
---Returns `nil` and a reason on failure.
---@param tank number target tank
---@param count? number amount in mB (default `1000`)
---@return boolean|nil success
---@return string? reason
function robot.transferFluidTo(tank, count) end

---Checks whether the fluid in the selected tank is the same as the fluid in the world or the tank in front of the robot.
---@return boolean equal
function robot.compareFluid() end

---Like `robot.compareFluid`, but for the block above the robot.
---@return boolean equal
function robot.compareFluidUp() end

---Like `robot.compareFluid`, but for the block below the robot.
---@return boolean equal
function robot.compareFluidDown() end

---Drains fluid from the world or the tank in front of the robot into the selected tank.
---Fails without losing fluid if a fluid block in the world does not fit completely into the selected tank.
---Returns `true` and the amount drained (mB), or a falsy value and the amount or a reason.
---@param count? number amount in mB (default `1000`)
---@return boolean|nil success
---@return integer|string amountOrReason
function robot.drain(count) end

---Like `robot.drain`, but drains from the block above the robot.
---@param count? number amount in mB (default `1000`)
---@return boolean|nil success
---@return integer|string amountOrReason
function robot.drainUp(count) end

---Like `robot.drain`, but drains from the block below the robot.
---@param count? number amount in mB (default `1000`)
---@return boolean|nil success
---@return integer|string amountOrReason
function robot.drainDown(count) end

---Puts fluid from the selected tank into the world or the tank in front of the robot.
---Fails without losing fluid if there is not enough fluid for a block, or the target tank has no room.
---Returns `true` and the amount filled (mB), or `nil` and a reason.
---@param count? number amount in mB (default `1000`)
---@return boolean|nil success
---@return integer|string amountOrReason
function robot.fill(count) end

---Like `robot.fill`, but fills into the block above the robot.
---@param count? number amount in mB (default `1000`)
---@return boolean|nil success
---@return integer|string amountOrReason
function robot.fillUp(count) end

---Like `robot.fill`, but fills into the block below the robot.
---@param count? number amount in mB (default `1000`)
---@return boolean|nil success
---@return integer|string amountOrReason
function robot.fillDown(count) end

return robot
