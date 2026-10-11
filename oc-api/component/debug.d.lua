---@meta
-- Copyright (c) 2023, FatalMerlin
-- All rights reserved.
--
-- This source code is licensed under the BSD-style license found in the
-- LICENSE file in the root directory of this source tree.

---Debug card (creative only): direct access to the world, players and the scoreboard.\
---World, player and scoreboard objects are userdata; call their methods with `.`, e.g. `debug.getWorld().getTime()`.\
---Component type: `debug`.
---@class ComponentDebug : Component
local debug = {}

---Changes the component network's energy buffer by the specified delta.
---@param value number
---@return number delta The part of the delta that could not be applied.
function debug.changeBuffer(value) end

---Gets the container's X position in the world.
---@return number x
function debug.getX() end

---Gets the container's Y position in the world.
---@return number y
function debug.getY() end

---Gets the container's Z position in the world.
---@return number z
function debug.getZ() end

---Gets the world object for the specified dimension ID, or the container's world.
---@param id? number Dimension ID.
---@return DebugWorld world
function debug.getWorld(id) end

---Gets a list of all world (dimension) IDs, loaded and unloaded.
---@return integer[] ids
function debug.getWorlds() end

---Gets the object for the player with the specified name.
---@param name string
---@return DebugPlayer player
function debug.getPlayer(name) end

---Gets a list of the names of the currently logged-in players.
---@return string[] names
function debug.getPlayers() end

---Gets the scoreboard object for the container's world.
---@return DebugScoreboard scoreboard
function debug.getScoreboard() end

---Returns the contents at the location in the world with the specified dimension ID (default: the container's world).\
---Behaves like the movement check of robots and drones: the first value is `true` if a robot could *not* move there,\
---the second is the kind of obstruction (`"EntityLivingBase"`, `"EntityMinecart"`, `"air"`, `"liquid"`, `"replaceable"`, `"passable"` or `"solid"`),\
---the third describes the entity or block found there.
---@param x number
---@param y number
---@param z number
---@param worldId? number
---@return boolean blocked
---@return string kind
---@return any description
function debug.scanContentsAt(x, y, z, worldId) end

---Gets whether a mod or API is loaded.
---@param name string Mod or API ID.
---@return boolean loaded
function debug.isModLoaded(name) end

---Runs an arbitrary command (or a list of commands) using a fake player.\
---Returns the result of the (last) command, `1` usually meaning success and `0` failure, and the command's output, if any.
---@param command string|string[]
---@return integer result
---@return string|nil output
function debug.runCommand(command) end

---Connects the debug card to the OpenComputers block (component network node) at the specified coordinates, adding it to this computer's network.
---@param x number
---@param y number
---@param z number
---@return boolean|nil success
---@return string? reason `"no node found at this position"`.
function debug.connectToBlock(x, y, z) end

---Test method for user-data and general value conversion.
---@return table value
---@return userdata testValue
---@return any world
function debug.test() end

---Sends text to the specified player's clipboard if possible.
---@param player string Player name.
---@param text string
---@return boolean success
---@return string? reason `"no such player"`.
function debug.sendToClipboard(player, text) end

---Sends data to the debug card with the specified address. It receives a `debug_message` signal.
---@param address string
---@param ... any Data to send.
function debug.sendToDebugCard(address, ...) end

---A world (dimension) object returned by the debug card.
---@class DebugWorld
local DebugWorld = {}

---Gets the numeric ID of the dimension.
---@return integer id
function DebugWorld.getDimensionId() end

---Gets the name of the dimension.
---@return string name
function DebugWorld.getDimensionName() end

---Gets the seed of the world.
---@return number seed
function DebugWorld.getSeed() end

---Returns whether it is currently raining.
---@return boolean raining
function DebugWorld.isRaining() end

---Sets whether it is currently raining.
---@param value boolean
function DebugWorld.setRaining(value) end

---Returns whether it is currently thundering.
---@return boolean thundering
function DebugWorld.isThundering() end

---Sets whether it is currently thundering.
---@param value boolean
function DebugWorld.setThundering(value) end

---Gets the current world time.
---@return number time
function DebugWorld.getTime() end

---Sets the current world time.
---@param value number
function DebugWorld.setTime(value) end

---Gets the current spawn point coordinates.
---@return integer x
---@return integer y
---@return integer z
function DebugWorld.getSpawnPoint() end

---Sets the spawn point coordinates.
---@param x number
---@param y number
---@param z number
function DebugWorld.setSpawnPoint(x, y, z) end

---Plays a sound at the specified coordinates.
---@param x number
---@param y number
---@param z number
---@param sound string Sound resource name, e.g. `"minecraft:block.note.harp"`.
---@param range number
function DebugWorld.playSoundAt(x, y, z, sound, range) end

---Gets the numeric ID of the block at the specified coordinates.
---@param x number
---@param y number
---@param z number
---@return integer id
function DebugWorld.getBlockId(x, y, z) end

---Gets the metadata of the block at the specified coordinates.
---@param x number
---@param y number
---@param z number
---@return integer meta
function DebugWorld.getMetadata(x, y, z) end

---Gets the block state of the block at the specified coordinates, optionally the "actual" state including additional display related data.
---@param x number
---@param y number
---@param z number
---@param actualState? boolean (default `false`)
---@return any state
function DebugWorld.getBlockState(x, y, z, actualState) end

---Checks whether the block at the specified coordinates is loaded.
---@param x number
---@param y number
---@param z number
---@return boolean loaded
function DebugWorld.isLoaded(x, y, z) end

---Checks whether the block at the specified coordinates has a tile entity.
---@param x number
---@param y number
---@param z number
---@return boolean hasTileEntity
function DebugWorld.hasTileEntity(x, y, z) end

---Gets the NBT of the tile entity at the specified coordinates, as a table (`nil` if there is no tile entity).
---@param x number
---@param y number
---@param z number
---@return table|nil nbt
function DebugWorld.getTileNBT(x, y, z) end

---Sets the NBT of the tile entity at the specified coordinates (a table in the format returned by `getTileNBT`).
---@param x number
---@param y number
---@param z number
---@param nbt table
---@return boolean|nil success
---@return string? reason
function DebugWorld.setTileNBT(x, y, z, nbt) end

---Gets the light opacity of the block at the specified coordinates.
---@param x number
---@param y number
---@param z number
---@return integer opacity
function DebugWorld.getLightOpacity(x, y, z) end

---Gets the light value (emission) of the block at the specified coordinates.
---@param x number
---@param y number
---@param z number
---@return integer light
function DebugWorld.getLightValue(x, y, z) end

---Gets whether the block at the specified coordinates is directly under the sky.
---@param x number
---@param y number
---@param z number
---@return boolean canSeeSky
function DebugWorld.canSeeSky(x, y, z) end

---Sets the block at the specified coordinates.
---@param x number
---@param y number
---@param z number
---@param id number|string Numeric block ID or block name, e.g. `"minecraft:stone"`.
---@param meta number
---@return boolean changed
function DebugWorld.setBlock(x, y, z, id, meta) end

---Sets all blocks in the area defined by the two corner points (x1, y1, z1) and (x2, y2, z2).
---@param x1 number
---@param y1 number
---@param z1 number
---@param x2 number
---@param y2 number
---@param z2 number
---@param id number|string Numeric block ID or block name.
---@param meta number
function DebugWorld.setBlocks(x1, y1, z1, x2, y2, z2, id, meta) end

---Inserts an item stack into the inventory at the specified location. The NBT tag is expected in JSON format.
---@param id string Item name, e.g. `"minecraft:stone"`.
---@param count number
---@param damage number
---@param nbt string|nil NBT tag in JSON format, or `nil`/`""` for none.
---@param x number
---@param y number
---@param z number
---@param side number Side of the inventory to insert into.
---@return boolean|nil success
---@return string? reason `"no inventory"`.
function DebugWorld.insertItem(id, count, damage, nbt, x, y, z, side) end

---Reduces the size of the item stack in the specified slot of the inventory at the specified location. Returns the number of removed items.
---@param x number
---@param y number
---@param z number
---@param slot number
---@param count? number (default `64`)
---@return integer|nil removed
---@return string? reason `"no inventory"`.
function DebugWorld.removeItem(x, y, z, slot, count) end

---Inserts some fluid into the tank at the specified location. Returns the amount inserted.
---@param id string Fluid name, e.g. `"water"`.
---@param amount number In millibuckets.
---@param x number
---@param y number
---@param z number
---@param side number
---@return integer|nil filled
---@return string? reason `"no tank"`.
function DebugWorld.insertFluid(id, amount, x, y, z, side) end

---Removes some fluid from the tank at the specified location. Returns the drained fluid.
---@param amount number In millibuckets.
---@param x number
---@param y number
---@param z number
---@param side number
---@return FluidStackInfo|nil drained
---@return string? reason `"no tank"`.
function DebugWorld.removeFluid(amount, x, y, z, side) end

---A player object returned by the debug card. All methods return `nil, "player is offline"` if the player is offline.
---@class DebugPlayer
local DebugPlayer = {}

---Gets the player's world object.
---@return DebugWorld|nil world
---@return string? reason
function DebugPlayer.getWorld() end

---Gets the player's game type, e.g. `"survival"`.
---@return string|nil gameType
---@return string? reason
function DebugPlayer.getGameType() end

---Sets the player's game type (`"survival"`, `"creative"`, `"adventure"` or `"spectator"`).
---@param gametype string
function DebugPlayer.setGameType(gametype) end

---Gets the player's position.
---@return number|nil x
---@return number y The Y coordinate; the error message if `x` is `nil`.
---@return number z
function DebugPlayer.getPosition() end

---Sets the player's position.
---@param x number
---@param y number
---@param z number
function DebugPlayer.setPosition(x, y, z) end

---Gets the player's health.
---@return number|nil health
---@return string? reason
function DebugPlayer.getHealth() end

---Gets the player's max health.
---@return number|nil maxHealth
---@return string? reason
function DebugPlayer.getMaxHealth() end

---Sets the player's health.
---@param health number
function DebugPlayer.setHealth(health) end

---Gets the player's experience level.
---@return integer|nil level
---@return string? reason
function DebugPlayer.getLevel() end

---Gets the player's total experience.
---@return integer|nil experience
---@return string? reason
function DebugPlayer.getExperienceTotal() end

---Adds levels to the player's experience level.
---@param level number
function DebugPlayer.addExperienceLevel(level) end

---Removes levels from the player's experience level.
---@param level number
function DebugPlayer.removeExperienceLevel(level) end

---Clears the player's inventory.
function DebugPlayer.clearInventory() end

---Adds an item stack to the player's inventory.\
---Note: `nbt` is required at runtime despite the in-game documentation; pass `""` for none.
---@param id string Item name, e.g. `"minecraft:stone"`.
---@param amount number
---@param meta number
---@param nbt string NBT tag in JSON format, or `""`.
---@return boolean|nil inserted
---@return string? reason
function DebugPlayer.insertItem(id, amount, meta, nbt) end

---The scoreboard object returned by the debug card.
---@class DebugScoreboard
local DebugScoreboard = {}

---Adds a team to the scoreboard.
---@param team string
function DebugScoreboard.addTeam(team) end

---Removes a team from the scoreboard.
---@param teamName string
function DebugScoreboard.removeTeam(teamName) end

---Adds a player to a team.
---@param player string
---@param team string
---@return boolean success
function DebugScoreboard.addPlayerToTeam(player, team) end

---Removes a player from their team.
---@param player string
---@return boolean success
function DebugScoreboard.removePlayerFromTeams(player) end

---Removes a player from a specific team.
---@param player string
---@param team string
function DebugScoreboard.removePlayerFromTeam(player, team) end

---Creates a new objective for the scoreboard.
---@param objectiveName string
---@param objectiveCriteria string E.g. `"dummy"`.
function DebugScoreboard.addObjective(objectiveName, objectiveCriteria) end

---Removes an objective from the scoreboard.
---@param objectiveName string
function DebugScoreboard.removeObjective(objectiveName) end

---Sets the score of a player for a certain objective.
---@param playerName string
---@param objectiveName string
---@param score number
function DebugScoreboard.setPlayerScore(playerName, objectiveName, score) end

---Gets the score of a player for a certain objective.
---@param playerName string
---@param objectiveName string
---@return integer score
function DebugScoreboard.getPlayerScore(playerName, objectiveName) end

---Increases the score of a player for a certain objective.
---@param playerName string
---@param objectiveName string
---@param score number
function DebugScoreboard.increasePlayerScore(playerName, objectiveName, score) end

---Decreases the score of a player for a certain objective.
---@param playerName string
---@param objectiveName string
---@param score number
function DebugScoreboard.decreasePlayerScore(playerName, objectiveName, score) end
