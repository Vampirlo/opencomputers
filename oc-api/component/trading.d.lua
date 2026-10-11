---@meta

---Trading upgrade: trades with villagers (and other merchants) near the robot or drone, using the items in its inventory.\
---Component type: `trading`.
---@class ComponentTrading : Component
local trading = {}

---Returns the trades offered by the merchants in range, as an array of trade objects.
---@return MerchantTrade[] trades
function trading.getTrades() end

---A trade offered by a merchant, returned by `trading.getTrades` (userdata; call its methods with `.`).
---@class MerchantTrade
local MerchantTrade = {}

---Returns a sort index of the merchant that provides this trade (trades of the same merchant have the same ID).
---@return integer id
function MerchantTrade.getMerchantId() end

---Returns the items the merchant wants for this trade: the first item, and the second one if the trade needs two.
---@return ItemStackInfo|nil firstItem
---@return ItemStackInfo|nil secondItem
function MerchantTrade.getInput() end

---Returns the item the merchant offers for this trade.
---@return ItemStackInfo|nil item
function MerchantTrade.getOutput() end

---Returns whether the merchant currently wants to trade this.
---@return boolean enabled
function MerchantTrade.isEnabled() end

---Performs the trade, using items from the device's inventory. Returns `true` if the trade succeeded.
---@return boolean success
---@return string? reason E.g. `"trader died"`, `"out of range"`, `"trade is disabled"` or `"not enough inventory space to trade"`.
function MerchantTrade.trade() end
