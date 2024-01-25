---@package
---@class ExecuteAsync
---@field callback function
---@field description string?
---@field delay number?

---@param callbacks ExecuteAsync[]
local function chainExecuteAsync(callbacks)
	local delay = 0
	for task_index, callback in ipairs(callbacks) do
		delay = delay + callback.delay
		vim.defer_fn(function()
			if callback.description ~= nil then
				vim.notify(
					tostring(callback.description),
					vim.log.levels.INFO,
					{
						title = "execute async task ("
							.. task_index
							.. "/"
							.. #callbacks
							.. ")",
					}
				)
			end
			callback.callback()
		end, delay)
	end
end

---@class Task
---@field default_delay number
---@field tasks ExecuteAsync[]
local Task = {
	default_delay = 0,
	tasks = {},
}

---@return Task
---@param default_delay number?
function Task.new(default_delay)
	local obj = {}
	setmetatable(obj, Task)
	Task.__index = Task
	Task.default_delay = default_delay or 0

	return obj
end

---@param callback function
---@param description string?
---@param delay number?
---@return Task
function Task:add(callback, description, delay)
	table.insert(self.tasks, {
		callback = callback,
		description = description,
		delay = delay or self.default_delay,
	})

	return self
end

function Task:run()
	chainExecuteAsync(self.tasks)
end

return Task
