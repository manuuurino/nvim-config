local util_dependencies = require("util.dependencies")
local has_excecutable = util_dependencies.has_excecutable
local is_on_alpine = util_dependencies.is_on_alpine

---@type LazySpec
return {
	--inspired by: https://github.com/chaozwn/astronvim_with_coc_or_mason/blob/4a59dea217ae9c931764bea64b2085c0a9a8e27c/plugins/community-pack.lua#L2
	{
		import = "astrocommunity.pack.angular",
		cond = has_excecutable("npm"),
	},
	{
		import = "astrocommunity.pack.ansible",
		cond = has_excecutable("npm") and has_excecutable("python3"),
	},
	{
		import = "astrocommunity.pack.bash",
		cond = has_excecutable("npm"),
	},
	{
		import = "astrocommunity.pack.cmake",
		cond = has_excecutable("cargo"),
	},
	{
		-- NOTE: even if these dependencies have been installed in alpine, mason doesnt want to install clangd or codelldb
		--       theres also an issue about it. https://github.com/williamboman/mason.nvim/issues/1402
		import = "astrocommunity.pack.cpp",
		cond = not is_on_alpine()
			and has_excecutable("unzip")
			and (
				has_excecutable("cc")
				or has_excecutable("gcc")
				or has_excecutable("clangd")
				or has_excecutable("cl")
				or has_excecutable("zig")
			),
	},
	{
		import = "astrocommunity.pack.cs",
		cond = has_excecutable("dotnet"),
	},
	{
		import = "astrocommunity.pack.docker",
		cond = has_excecutable("npm"),
	},
	{
		import = "astrocommunity.pack.html-css",
		cond = has_excecutable("npm"),
	},
	{
		import = "astrocommunity.pack.json",
		cond = has_excecutable("npm"),
	},
	{
		import = "astrocommunity.pack.lua",
		-- NOTE: needs luarocks for stylua, also luacheck is unsupported on alpine.
		--       yet have it commented so alpine has a ls atleast
		-- cond = has_excecutable("luarocks"),
	},
	{
		import = "astrocommunity.pack.markdown",
		cond = has_excecutable("npm"),
	},
	{
		import = "astrocommunity.pack.ps1",
		cond = has_excecutable("npm"),
	},
	{
		import = "astrocommunity.pack.python",
		cond = has_excecutable("npm") and has_excecutable("python3"),
	},
	{
		import = "astrocommunity.pack.rust",
		cond = has_excecutable("unzip") and has_excecutable("cargo"),
	},
	{
		import = "astrocommunity.pack.toml",
		cond = has_excecutable("npm"),
	},
	{
		import = "astrocommunity.pack.typescript-all-in-one",
		cond = has_excecutable("deno"),
	},
	{
		import = "astrocommunity.pack.yaml",
		cond = has_excecutable("npm"),
	},
	{
		import = "astrocommunity.pack.nix",
		cond = has_excecutable("cargo"),
	},
}
