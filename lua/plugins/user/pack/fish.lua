---@type LazySpec
return {
	-- TODO: use the community version after this PR https://github.com/AstroNvim/astrocommunity/pull/817
	-- { import = "astrocommunity.pack.fish" },
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			if opts.ensure_installed ~= "all" then
				opts.ensure_installed = require("astrocore").list_insert_unique(
					opts.ensure_installed,
					{ "fish" }
				)
			end
		end,
	},
	{
		"nvimtools/none-ls.nvim",
		optional = true,
		opts = function(_, opts)
			local nls = require("null-ls")
			opts.sources = vim.list_extend(opts.sources or {}, {
				nls.builtins.formatting.fish_indent,
				nls.builtins.diagnostics.fish,
			})
			return opts
		end,
	},
	{
		"stevearc/conform.nvim",
		optional = true,
		opts = {
			formatters_by_ft = {
				fish = { "fish_indent" },
			},
		},
	},
	{
		"mfussenegger/nvim-lint",
		optional = true,
		opts = {
			linters_by_ft = {
				fish = { "fish" },
			},
		},
	},
}
