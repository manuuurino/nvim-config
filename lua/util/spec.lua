local M = {}

---@param path string
---@return LazySpec
function M.spec(path)
	return { import = path }
end

--- Loads a plugin from 'astrocommunity' or a local override based on category and plugin name which lies in 'plugins'.
--- Constructs a module path and tries to load it. If the import is unavailable, it returns the attempted import.
---
---@param category string
---@param plugin_name string
---@return LazySpec
function M.astrocommunity(category, plugin_name)
	local import = "astrocommunity." .. category .. "." .. plugin_name
	local ok, plugin = pcall(require, "plugins." .. import)
	if not ok then return { import = import } end
	return plugin
end

return M
