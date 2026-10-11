---@meta
-- Copyright (c) 2023, FatalMerlin
-- All rights reserved.
--
-- This source code is licensed under the BSD-style license found in the
-- LICENSE file in the root directory of this source tree.

---EEPROM: holds the BIOS code and a small volatile data area (usually the address of the boot filesystem).\
---Component type: `eeprom`.
---@class ComponentEEPROM : Component
local eeprom = {}

---Gets the currently stored code (byte array).
---@return string code
function eeprom.get() end

---Overwrites the currently stored code (byte array). Deliberately slow.
---@param data? string The new code (default: empty).
---@return nil result
---@return string? reason `"storage is readonly"` or `"not enough energy"`.
function eeprom.set(data) end

---Gets the label of the EEPROM.
---@return string label
function eeprom.getLabel() end

---Sets the label of the EEPROM (at most 24 characters; default `"EEPROM"`). Returns the new label.
---@param data? string
---@return string|nil label
---@return string? reason `"storage is readonly"`.
function eeprom.setLabel(data) end

---Gets the storage capacity for code of this EEPROM, in bytes.
---@return integer size
function eeprom.getSize() end

---Gets the checksum of the code on this EEPROM.
---@return string checksum
function eeprom.getChecksum() end

---Makes this EEPROM read-only if it isn't already. This process cannot be reversed!\
---`checksum` must match `getChecksum()` as a safety measure.
---@param checksum string
---@return boolean|nil success
---@return string? reason `"incorrect checksum"`.
function eeprom.makeReadonly(checksum) end

---Gets the storage capacity of the data area of this EEPROM, in bytes.
---@return integer size
function eeprom.getDataSize() end

---Gets the currently stored data (byte array), usually the address of the boot filesystem.
---@return string data
function eeprom.getData() end

---Overwrites the currently stored data (byte array). Deliberately slow.
---@param data? string The new data (default: empty).
---@return nil result
---@return string? reason `"not enough energy"`.
function eeprom.setData(data) end
