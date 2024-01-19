---@type LazySpec
return {
	-- use mason-lspconfig to configure LSP installations
	{
		"williamboman/mason-lspconfig.nvim",
		---@param opts MasonLspconfigSettings
		opts = function(_, opts)
			---@diagnostic disable-next-line: inject-field
			opts.ensure_installed = require("astrocore").list_insert_unique(
				opts.ensure_installed
				-- "lua_ls",
				-- add more arguments for adding more language servers
			)
		end,
	},
	{
		"jay-babu/mason-null-ls.nvim",
		---@param opts MasonNullLsSettings
		opts = function(_, opts)
			opts.ensure_installed = require("astrocore").list_insert_unique(
				opts.ensure_installed
				-- "prettier",
				-- "stylua",
				-- add more arguments for adding more null-ls sources
			)
		end,
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		---@param opts MasonNvimDapSettings
		opts = function(_, opts)
			opts.ensure_installed = require("astrocore").list_insert_unique(
				opts.ensure_installed
				-- "python",
				-- add more arguments for adding more debuggers
			)
		end,
	},
}
