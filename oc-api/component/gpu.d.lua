---@meta

---Graphics card. Draws on the screen it is bound to, or on its own off-screen video RAM buffers.\
---Coordinates are 1-based; colors are `0xRRGGBB` values unless a palette index is requested explicitly.\
---Component type: `gpu`.
---@class ComponentGPU : Component
local gpu = {}

---Binds the GPU to the screen with the specified address and resets the screen's settings if `reset` is `true`.\
---A GPU can only be bound to one screen at a time; all drawing operations work on the bound screen.
---@param address string Address of the screen component.
---@param reset? boolean Reset resolution, color depth and colors of the screen (default `true`).
---@return boolean|nil success `true` on success, `nil` on failure.
---@return string? reason Why binding failed, e.g. `"invalid address"` or `"not a screen"`.
function gpu.bind(address, reset) end

---Gets the address of the screen the GPU is currently bound to.
---@return string|nil address The screen address, or `nil` if the GPU is not bound.
---@return string? reason `"no screen"` if the GPU is not bound.
function gpu.getScreen() end

---Gets the current background color and whether it's from the palette or not.
---@return integer color An RGB value (`0xRRGGBB`), or a palette index if `isPaletteIndex` is `true`.
---@return boolean isPaletteIndex Whether `color` is a palette index.
function gpu.getBackground() end

---Sets the background color used by subsequent drawing operations.\
---Returns the previous color as an RGB value, and its palette index if it was a palette color.
---@param color number An RGB value (`0xRRGGBB`), or a palette index (0-15) if `isPaletteIndex` is `true`.
---@param isPaletteIndex? boolean Whether `color` is a palette index (default `false`).
---@return integer oldColor The previous color as an RGB value.
---@return integer|nil oldPaletteIndex The palette index of the previous color, or `nil` if it was not a palette color.
function gpu.setBackground(color, isPaletteIndex) end

---Gets the current foreground color and whether it's from the palette or not.
---@return integer color An RGB value (`0xRRGGBB`), or a palette index if `isPaletteIndex` is `true`.
---@return boolean isPaletteIndex Whether `color` is a palette index.
function gpu.getForeground() end

---Sets the foreground color used by subsequent drawing operations.\
---Returns the previous color as an RGB value, and its palette index if it was a palette color.
---@param color number An RGB value (`0xRRGGBB`), or a palette index (0-15) if `isPaletteIndex` is `true`.
---@param isPaletteIndex? boolean Whether `color` is a palette index (default `false`).
---@return integer oldColor The previous color as an RGB value.
---@return integer|nil oldPaletteIndex The palette index of the previous color, or `nil` if it was not a palette color.
function gpu.setForeground(color, isPaletteIndex) end

---Gets the RGB value of the palette color at the specified index.
---@param index number Palette index (0-15).
---@return integer color
function gpu.getPaletteColor(index) end

---Sets the RGB value of the palette color at the specified index. Returns the previous value.
---@param index number Palette index (0-15).
---@param color number The new RGB value (`0xRRGGBB`).
---@return integer oldColor
function gpu.setPaletteColor(index, color) end

---Gets the currently set color depth, in bits: `1`, `4` or `8`.
---@return integer depth
function gpu.getDepth() end

---Sets the color depth (`1`, `4` or `8`, up to `maxDepth()`); throws an error for unsupported values.\
---Returns the previous depth as one of the strings `"OneBit"`, `"FourBit"` or `"EightBit"`.
---@param depth number
---@return string oldDepth
function gpu.setDepth(depth) end

---Gets the maximum color depth supported by the GPU and the bound screen (the minimum of the two).
---@return integer depth
function gpu.maxDepth() end

---Gets the current screen resolution.
---@return integer width
---@return integer height
function gpu.getResolution() end

---Sets the screen resolution, up to `maxResolution()`; throws an error for unsupported values.\
---Returns `true` if the resolution changed. This also resets the viewport to the whole screen.
---@param width number
---@param height number
---@return boolean changed
function gpu.setResolution(width, height) end

---Gets the maximum resolution supported by the GPU and the bound screen (the minimum of the two).
---@return integer width
---@return integer height
function gpu.maxResolution() end

---Gets the current viewport resolution.
---@return integer width
---@return integer height
function gpu.getViewport() end

---Sets the viewport resolution; it cannot exceed the screen resolution. Returns `true` if it changed.\
---Characters outside the top-left `width` x `height` area are hidden, which can be used to keep off-screen content.
---@param width number
---@param height number
---@return boolean changed
function gpu.setViewport(width, height) end

---Gets the character displayed at the specified position, as well as its foreground and background color.\
---If a color is from the palette, its palette index is returned as fourth (foreground) or fifth (background) value.
---@param x number
---@param y number
---@return string char
---@return integer foreground RGB value of the foreground color.
---@return integer background RGB value of the background color.
---@return integer|nil foregroundIndex Palette index of the foreground color, or `nil`.
---@return integer|nil backgroundIndex Palette index of the background color, or `nil`.
function gpu.get(x, y) end

---Writes a string to the screen, starting at the specified position, in a single row (or column if `vertical` is `true`).\
---Line breaks are not interpreted.
---@param x number
---@param y number
---@param value string
---@param vertical? boolean Write the string vertically (default `false`).
---@return boolean|nil success
---@return string? reason E.g. `"not enough energy"` or `"no screen"`.
function gpu.set(x, y, value, vertical) end

---Copies the `width` x `height` area at (`x`, `y`) by the translation (`tx`, `ty`), i.e. to (`x + tx`, `y + ty`).
---@param x number
---@param y number
---@param width number
---@param height number
---@param tx number Horizontal offset of the target area.
---@param ty number Vertical offset of the target area.
---@return boolean|nil success
---@return string? reason
function gpu.copy(x, y, width, height, tx, ty) end

---Fills the `width` x `height` area at (`x`, `y`) with the specified character.\
---Filling with spaces is cheaper, as it is considered a "clear" operation.
---@param x number
---@param y number
---@param width number
---@param height number
---@param char string Exactly one character.
---@return boolean|nil success
---@return string? reason
function gpu.fill(x, y, width, height, char) end

---Returns the index of the currently selected buffer. `0` is reserved for the screen and may be returned even when there is no screen.
---@return integer index
function gpu.getActiveBuffer() end

---Sets the active buffer to `index`. `1` is the first video RAM buffer and `0` is the screen (always valid).
---@param index number
---@return integer|nil previousIndex The previously active buffer index, or `nil` for an invalid index.
---@return string? reason `"invalid buffer index"`.
function gpu.setActiveBuffer(index) end

---Returns an array of the indexes of all allocated buffers (the screen, index `0`, is not included).
---@return integer[] indexes
function gpu.buffers() end

---Allocates a new video RAM buffer of `width` x `height` (default: the GPU's maximum resolution) and returns its index.\
---Buffers can be allocated even when no screen is bound. The lowest possible buffer index is `1`.
---@param width? number
---@param height? number
---@return integer|nil index The new buffer's index, or `nil` on failure.
---@return string? reason E.g. `"not enough video memory"`.
function gpu.allocateBuffer(width, height) end

---Frees the buffer at `index` (default: the active buffer). If the active buffer is freed, the active index becomes `0` (the screen).
---@param index? number
---@return boolean|nil success
---@return string? reason `"no buffer at index"`.
function gpu.freeBuffer(index) end

---Frees all video RAM buffers and returns how many were freed. The active index becomes `0` (the screen).
---@return integer count
function gpu.freeAllBuffers() end

---Returns the total video RAM of the GPU. This does not include the screen.
---@return number memory
function gpu.totalMemory() end

---Returns the video RAM not allocated to buffers. This does not include the screen.
---@return number memory
function gpu.freeMemory() end

---Returns the size of the buffer at `index` (default: the active buffer). For index `0` this is the screen resolution.\
---Returns `nil` and an error message for an invalid index.
---@param index? number
---@return integer|nil width
---@return integer height
function gpu.getBufferSize(index) end

---Copies ("bit block transfer") a region between buffers: buffer to screen, screen to buffer or buffer to buffer. All parameters are optional.\
---Writes into buffer `dst` (default `0`, the screen) at (`col`, `row`) (default `1, 1`) an area of `width` x `height` (default: size of `dst`),\
---reading from buffer `src` (default: the active buffer) at (`fromCol`, `fromRow`) (default `1, 1`).\
---Copying a modified ("dirty") buffer to the screen has an initial cost that grows with the buffer size.
---@param dst? number Destination buffer index.
---@param col? number
---@param row? number
---@param width? number
---@param height? number
---@param src? number Source buffer index.
---@param fromCol? number
---@param fromRow? number
---@return boolean|nil success
---@return string? reason
function gpu.bitblt(dst, col, row, width, height, src, fromCol, fromRow) end
