local M = {}

---@param path string
---@return LazySpec
function M.spec(path)
	return { import = path }
end

return M
