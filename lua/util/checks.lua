local M = {}

---@param executable string
---@return boolean
-- TODO: show what coudnt be installed
function M.has(executable)
	local is_installed = vim.fn.executable(executable) == 1

	if not is_installed then
		vim.api.nvim_create_autocmd("UIEnter", {
			callback = function()
				vim.notify_once(
					executable .. " is not installed",
					vim.log.levels.WARN
				)
			end,
		})
	end

	return is_installed
end

---@return boolean
function M.is_tty()
	return vim.env["TERM"] == "linux"
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
