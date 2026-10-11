---@meta

---Vanilla note block, accessed through an adapter block.\
---Component type: `note_block`.
---@class ComponentNoteBlock : Component
local note_block = {}

---Gets the currently set pitch of this note block (1-25).
---@return integer pitch
function note_block.getPitch() end

---Sets the pitch of this note block. Must be in the interval [1, 25].
---@param value number
---@return boolean success
function note_block.setPitch(value) end

---Plays the note block's note, optionally setting the pitch (1-25) first.\
---Returns whether the note could be played (the block above must be air).
---@param pitch? number
---@return boolean played
function note_block.trigger(pitch) end
