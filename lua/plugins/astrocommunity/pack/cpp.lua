local checks = require("util.checks")
local has = checks.has
local is_on_alpine = checks.is_on_alpine

---@type LazySpec
return {
	-- NOTE: even if these dependencies have been installed in alpine, mason doesnt want to install clangd or codelldb
	--       theres also an issue about it. https://github.com/williamboman/mason.nvim/issues/1402
	import = "astrocommunity.pack.cpp",
	cond = not is_on_alpine()
		and has("unzip")
		and (
			has("cc")
			or has("gcc")
			or has("clangd")
			or has("cl")
			or has("zig")
		),
}
