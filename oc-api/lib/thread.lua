---@meta

---OpenOS threads: coroutines that run autonomously (they resume themselves after `event.pull`, `os.sleep` etc.)
---without blocking the rest of the program. A thread is attached to the process that created it, which waits for its
---attached threads to finish before it closes. Event listeners and timers registered in a thread belong to it.
---@class threadlib
local thread = {}

---Creates and immediately starts a thread running `thread_proc(...)`. Returns its handle.\
---Errors inside the thread are not raised in the caller; they are logged by `event.onError` (to `/tmp/event.log`).
---```lua
---local t = thread.create(function(a, b) print(a); os.sleep(1); print(b) end, "A", "B")
---```
---@param thread_proc function
---@param ... any arguments for `thread_proc`
---@return ThreadHandle
function thread.create(thread_proc, ...) end

---Waits until all `threads` have finished (or are suspended or killed), or `timeout` seconds have passed.\
---Returns `true`, or `nil` and an error message on timeout. Threads that finished are killed.
---@param threads ThreadHandle[]
---@param timeout? number seconds
---@return boolean|nil success
---@return string? reason
function thread.waitForAll(threads, timeout) end

---Waits until any of `threads` has finished (or is suspended or killed), or `timeout` seconds have passed.\
---Returns `true`, or `nil` and an error message on timeout.
---@param threads ThreadHandle[]
---@param timeout? number seconds
---@return boolean|nil success
---@return string? reason
function thread.waitForAny(threads, timeout) end

---Returns the handle of the thread this code runs in, or `nil` if it doesn't run inside a thread.
---@return ThreadHandle|nil
function thread.current() end

---Handle of an OpenOS thread, returned by `thread.create`.
---@class ThreadHandle
local ThreadHandle = {}

---Resumes a suspended thread. Returns `true`, or `nil` and an error message if the thread isn't suspended.
---@return boolean|nil success
---@return string? reason
function ThreadHandle:resume() end

---Suspends a running thread: it ignores events (also its listeners and timers) and doesn't continue until `t:resume()`.
---Suspending the current thread yields immediately. Returns `true`, or `nil` and an error message if it isn't running.
---@return boolean|nil success
---@return string? reason
function ThreadHandle:suspend() end

---Kills the thread: it is never resumed again, and its event registrations die with it. Killing a dead thread does nothing.
function ThreadHandle:kill() end

---Returns the thread's status: `"running"` (also while it waits for events), `"suspended"` or `"dead"`.
---@return "running"|"suspended"|"dead" status
function ThreadHandle:status() end

---Attaches the thread to a process: `level` 1 or `nil` is the current process, 2 its parent, and so on
---(a coroutine of the process is accepted, too). The process won't close before the thread is done.\
---Returns the thread handle, or `nil` and an error message if there is no such process.
---@param level? number|thread
---@return ThreadHandle|nil self
---@return string? reason
function ThreadHandle:attach(level) end

---Detaches the thread from its process (attaches it to the init process): it keeps running until it finishes or the
---computer shuts down. Returns the thread handle (handy for `thread.create(f):detach()`), or `nil` and an error message.
---@return ThreadHandle|nil self
---@return string? reason
function ThreadHandle:detach() end

---Waits until the thread has finished (or is suspended or killed), or `timeout` seconds have passed.
---The thread is dead afterwards. Returns `true`, or `nil` and an error message on timeout.
---@param timeout? number seconds
---@return boolean|nil success
---@return string? reason
function ThreadHandle:join(timeout) end

return thread
