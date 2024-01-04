---@type LazySpec
return {
	"nvimtools/none-ls.nvim",
	---@param config NullLsParams
	opts = function(_, config)
		-- local null_ls = require "null-ls"

		-- Check supported formatters and linters
		-- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/formatting
		-- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics

		---@diagnostic disable-next-line: inject-field
		config.sources = {
			-- Set a formatter
			-- null_ls.builtins.formatting.stylua,
			-- null_ls.builtins.formatting.prettier,
		}
		return config -- return final config table
	end,
}
