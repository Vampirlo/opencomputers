---@meta
-- Copyright (c) 2023, FatalMerlin
-- All rights reserved.
--
-- This source code is licensed under the BSD-style license found in the
-- LICENSE file in the root directory of this source tree.

---Relay block: forwards network messages between the networks connected to its sides,\
---and with a wireless network card installed also wirelessly (replaces the access point of older versions).\
---Component type: `relay`.
---@class ComponentRelay : Component
local relay = {}

---Gets the signal strength (range) used when relaying messages wirelessly.
---@return number strength
function relay.getStrength() end

---Sets the signal strength (range) used when relaying messages wirelessly, up to the installed card's maximum. Returns the new strength.
---@param strength number
---@return number strength
function relay.setStrength(strength) end

---Gets whether the relay currently acts as a repeater (re-sends received wireless packets wirelessly).
---@return boolean repeater
function relay.isRepeater() end

---Sets whether the relay should act as a repeater (re-send received wireless packets wirelessly). Returns the new value.
---@param enabled boolean
---@return boolean repeater
function relay.setRepeater(enabled) end
