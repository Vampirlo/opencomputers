---@meta

---Industrial Information Panel or Holo Panel (Energy Control). Gives access to the card in the panel's card slot.
---@class ComponentInfoPanel : Component
local info_panel = {}

---Checks if the panel has a color upgrade.
---@return boolean colored
function info_panel.hasColorUpgrade()
end

---Checks if the panel is active (powered).
---@return boolean active
function info_panel.isActive()
end

---Gets the panel range (in blocks, depends on the range upgrades).
---@return integer range
function info_panel.getRange()
end

---Gets the card data as displayed on the panel, one string per line.
---@return string[] lines
function info_panel.getCardData()
end

---Gets the raw card data, one string per line.
---@return string[] lines
function info_panel.getCardDataRaw()
end

---Gets the background color (0-15).
---@return integer color
function info_panel.getColorBack()
end

---Gets the font color (0-15).
---@return integer color
function info_panel.getColorText()
end

---Sets the background color (0-15; other values are ignored).
---@param color number
function info_panel.setColorBack(color)
end

---Sets the font color (0-15; other values are ignored).
---@param color number
function info_panel.setColorText(color)
end

---Gets the title of the card in the panel ("" if there is no card).
---@return string title
function info_panel.getCardTitle()
end

---Sets the title of the card in the panel.
---@param title string
function info_panel.setCardTitle(title)
end
