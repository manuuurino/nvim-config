---@type LazySpec
return {
	"nvimtools/none-ls.nvim",
	optional = true,
	---@param config NullLsParams
	opts = function(_, config)
		local null_ls = require("null-ls")

		-- Check supported formatters and linters
		-- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/formatting
		-- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics

		opts.sources = require("astrocore").list_insert_unique(opts.sources, {})
	end,
}
