---@meta

---The terminal library (`require("term")`): text output to the screen and user input,
---without dealing with the GPU directly. Works on the terminal window of the current process
---(the GPU, screen and keyboard bound to it); also provides the functions of the `tty` library.
---@class termlib
local term = {}

---Returns whether the terminal is available, i.e. whether it has a GPU bound to a screen.
---In other words, whether `term.read` and `term.write` will actually do something.
---@return boolean available
function term.isAvailable() end

---Gets the terminal viewport: its size, its offset on the screen and the cursor position in it.
---@return integer width viewport width
---@return integer height viewport height
---@return integer dx horizontal offset of the viewport on the screen
---@return integer dy vertical offset of the viewport on the screen
---@return integer x cursor column, relative to the viewport
---@return integer y cursor row, relative to the viewport
function term.getViewport() end

---Sets the terminal viewport (the area of the screen the terminal uses) and the cursor position in it.
---@param width number
---@param height number
---@param dx? number horizontal offset on the screen (default `0`)
---@param dy? number vertical offset on the screen (default `0`)
---@param x? number cursor column, relative to the viewport (default `1`)
---@param y? number cursor row, relative to the viewport (default `1`)
function term.setViewport(width, height, dx, dy, x, y) end

---Gets the area of the screen used by the terminal, in screen coordinates.
---@return integer x left column
---@return integer y top row
---@return integer width
---@return integer height
function term.getGlobalArea() end

---Gets the GPU proxy used by the terminal (`nil` if no GPU is bound, see `term.isAvailable`).
---@return ComponentGPU gpu
function term.gpu() end

---Binds a GPU proxy (not an address) to the terminal. This is done automatically at boot when a GPU and
---a screen become available. Changes the GPU used by all terminal output (`term.write`, `io.write`, `print`, ...).
---@param gpu ComponentGPU
---@param window? table the terminal window to bind it to (internal; default: the current one)
function term.bind(gpu, window) end

---Gets the address of the screen the terminal's GPU is bound to (`nil` if there is no GPU or screen).
---@return string|nil address
function term.screen() end

---Gets the address of the keyboard the terminal accepts key events from
---(`"no_system_keyboard"` if there is none).
---@return string address
function term.keyboard() end

---Waits for an event like `event.pull`, blinking the cursor meanwhile.
---Takes the same arguments and returns the same results as `event.pull`:
---an optional timeout in seconds, an optional event name pattern and filters for the event's arguments.
---@param timeout? number maximum time to wait, in seconds
---@param name? string event name pattern
---@param ... any filters for the event's arguments (`nil` matches anything)
---@return string|nil name the event name, `nil` on timeout
---@return any ... the event's arguments
---@overload fun(name?: string, ...: any): string|nil, ...: any
function term.pull(timeout, name, ...) end

---Gets the cursor position, relative to the viewport.
---@return integer x column
---@return integer y row
function term.getCursor() end

---Sets the cursor position, relative to the viewport.
---@param col number column
---@param row number row
function term.setCursor(col, row) end

---Gets whether the cursor blinks while waiting for input.
---@return boolean enabled
function term.getCursorBlink() end

---Sets whether the cursor blinks while waiting for input.
---@param enabled boolean
function term.setCursorBlink(enabled) end

---Clears the terminal viewport and moves the cursor to (1, 1).
function term.clear() end

---Clears the line the cursor is on and moves the cursor to the start of the line.
function term.clearLine() end

---Scrolls the contents of the viewport: positive `lines` move the text up, negative move it down.
---Without `lines`, scrolls just enough to bring the cursor back into the viewport.
---@param lines? number
---@return integer scrolled number of lines scrolled
function term.scroll(lines) end

---Options for `term.read`, passed as its first argument. The array part is the input history.
---@class TermReadOptions
---@field [integer] string history entry (cycled through with the up/down arrow keys)
---@field dobreak? boolean `false` to not move to a new line when input is completed (default `true`)
---@field hint? string[]|fun(line: string, pos: integer): string[]? tab completion candidates, or a function returning them for the text and cursor position
---@field pwchar? string|fun(text: string): string mask for the echoed input, e.g. `"*"`
---@field filter? string|fun(text: string): any pattern or predicate the input must satisfy before enter is accepted
---@field nowrap? boolean `true` to scroll the input horizontally instead of wrapping it to new lines

---Reads a line of user input, with line editing, history (up/down) and tab completion.
---The first argument may instead be an options table (`TermReadOptions`): its array part is the history,
---its named keys replace the other arguments.
---Returns the entered text **including** the trailing newline (`io.read()` returns it without),
---`nil` at the end of input (^D), or `false` and `"interrupted"` if interrupted (^C).
---@param history? string[]|TermReadOptions input history (entered lines are added to it) or options
---@param dobreak? boolean `false` to not move to a new line when input is completed (`nil` means `true`)
---@param hint? string[]|fun(line: string, pos: integer): string[]? tab completion candidates, or a function returning them for the text and cursor position
---@param pwchar? string|fun(text: string): string mask for the echoed input, e.g. `"*"`
---@param filter? string|fun(text: string): any pattern or predicate the input must satisfy before enter is accepted
---@return string|false|nil line
---@return string? reason
function term.read(history, dobreak, hint, pwchar, filter) end

---Writes text at the cursor position, moving the cursor and scrolling as needed.
---Writes to the same stream as `io.stdout`, so it respects output redirection.
---@param value string|number
---@param wrap? boolean `false` to not wrap lines longer than the viewport (default: wrap)
function term.write(value, wrap) end

return term
