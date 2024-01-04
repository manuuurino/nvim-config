---@class utils.dependencies
local M = {}

---@param executable string
---@return boolean
function M.has_excecutable(executable)
	local is_installed = vim.fn.executable(executable) == 1

	if not is_installed then
		vim.api.nvim_create_autocmd("UIEnter", {
			callback = function()
				-- stylua: ignore
				vim.notify_once(executable .. " is not installed", vim.log.levels.WARN, {
					title = "Dependencies",
				})
			end,
		})
	end

	return is_installed
end

---@return boolean
function M.is_on_glibc()
	-- PERF: this is slow
	local result = vim.fn.system("ldd --version")
	return result:match("GNU libc") ~= nil
end

function M.is_on_alpine()
	local output = vim.fn.system("cat /etc/os-release")
	return string.find(output, "alpine") ~= nil
end

return M
