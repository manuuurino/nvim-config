local M = {}

---@param path string
---@return LazySpec
function M.spec(path)
	return { import = path }
end

---@param category string
---@param plugin_name string
function M.astrocommunity(category, plugin_name)
	local import = "astrocommunity." .. category .. "." .. plugin_name
	local ok, plugin = pcall(require, "plugins." .. import)
	if not ok then return { import = import } end
	return plugin
end

return M
