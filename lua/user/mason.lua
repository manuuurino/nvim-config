---@type LazySpec
return {
	-- use mason-lspconfig to configure LSP installations
	{
		"williamboman/mason-lspconfig.nvim",
		---@param opts MasonLspconfigSettings
		opts = function(_, opts)
			---@diagnostic disable-next-line: inject-field
			opts.ensure_installed =
				require("astrocore").list_insert_unique(opts.ensure_installed)
		end,
	},
	{
		"jay-babu/mason-null-ls.nvim",
		---@param opts MasonNullLsSettings
		opts = function(_, opts)
			opts.ensure_installed =
				require("astrocore").list_insert_unique(opts.ensure_installed)
		end,
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		---@param opts MasonNvimDapSettings
		opts = function(_, opts)
			opts.ensure_installed =
				require("astrocore").list_insert_unique(opts.ensure_installed)
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		optional = true,
		opts = function(_, opts)
			opts.ensure_installed =
				require("astrocore").list_insert_unique(opts.ensure_installed)
		end,
	},
}
