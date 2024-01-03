---@class utils.helper
local M = {}

---@return boolean
function M.is_tty()
	return vim.env["TERM"] == "linux"
end

return M
