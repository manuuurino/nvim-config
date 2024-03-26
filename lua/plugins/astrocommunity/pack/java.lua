local has = require("util.checks").has

---@type LazySpec
return {
	{
		import = "astrocommunity.pack.java",
		cond = has("npm"),
	},

	-- TODO: this should be resolved in astrocommunity
	{
		"jay-babu/mason-null-ls.nvim",
		optional = true,
		opts = function(_, opts)
			for k, v in pairs(opts.ensure_installed) do
				if v == "clang_format" then
					opts.ensure_installed[k] = "clang-format"
					break
				end
			end
		end,
	},
	{
		"stevearc/conform.nvim",
		optional = true,
		opts = {
			formatters_by_ft = {
				java = { "clang-format" },
			},
		},
	},
}
