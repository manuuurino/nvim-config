local M = {}

local has_cache = {}

---@param executable string
---@return boolean
function M.has(executable)
	if has_cache[executable] ~= nil then return has_cache[executable] end

	local is_installed = vim.fn.executable(executable) == 1
	has_cache[executable] = is_installed

	if not is_installed then
		vim.api.nvim_create_autocmd("UIEnter", {
			callback = function()
				-- INFO: when this is triggered, it loads the notify plugins and its dependencies
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

local is_on_alpine_cache = nil
function M.is_on_alpine()
	if is_on_alpine_cache ~= nil then return is_on_alpine_cache end

	is_on_alpine_cache = string.find(
		vim.fn.system("cat /etc/os-release"),
		"alpine"
	) ~= nil

	return is_on_alpine_cache
end

local is_on_glibc_cache = nil
---@return boolean
function M.is_on_glibc()
	if is_on_glibc_cache ~= nil then return is_on_glibc_cache end

	is_on_glibc_cache = os.execute("test -f /lib/libc.so.6") == 0

	return is_on_glibc_cache
end

return M
