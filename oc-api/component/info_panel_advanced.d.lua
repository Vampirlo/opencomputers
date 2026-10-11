---@meta

---Advanced Information Panel (Energy Control). Has three card slots (0-2) and adjustable thickness and rotation.
---@class ComponentInfoPanelAdvanced : Component
local info_panel_advanced = {}

---Checks if the panel is active (powered).
---@return boolean active
function info_panel_advanced.isActive()
end

---Gets the panel range (in blocks, depends on the range upgrades).
---@return integer range
function info_panel_advanced.getRange()
end

---Gets the card data as displayed on the panel, one string per line.
---@return string[] lines
function info_panel_advanced.getCardData()
end

---Gets the raw card data, one string per line.
---@return string[] lines
function info_panel_advanced.getCardDataRaw()
end

---Gets the background color (0-15).
---@return integer color
function info_panel_advanced.getColorBack()
end

---Gets the font color (0-15).
---@return integer color
function info_panel_advanced.getColorText()
end

---Sets the background color (0-15; other values are ignored).
---@param color number
function info_panel_advanced.setColorBack(color)
end

---Sets the font color (0-15; other values are ignored).
---@param color number
function info_panel_advanced.setColorText(color)
end

---Gets the title of the card in the given slot (0-2); "" if there is no card.
---@param slot number 0-2
---@return string title
function info_panel_advanced.getCardTitle(slot)
end

---Sets the title of the card in the given slot (0-2).
---@param slot number 0-2
---@param title string
function info_panel_advanced.setCardTitle(slot, title)
end

---Gets the panel thickness.
---@return integer thickness
function info_panel_advanced.getThickness()
end

---Sets the panel thickness (1-16; other values are ignored).
---@param thickness number
function info_panel_advanced.setThickness(thickness)
end

---Gets the panel horizontal rotation.
---@return integer rotation
function info_panel_advanced.getRotHor()
end

---Sets the panel horizontal rotation (-8..8; other values are ignored).
---@param rotation number
function info_panel_advanced.setRotHor(rotation)
end

---Gets the panel vertical rotation.
---@return integer rotation
function info_panel_advanced.getRotVert()
end

---Sets the panel vertical rotation (-8..8; other values are ignored).
---@param rotation number
function info_panel_advanced.setRotVert(rotation)
end
