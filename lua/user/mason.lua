---@type LazySpec
return {
	{
		"williamboman/mason-lspconfig.nvim",
		optional = true,
		---@param opts MasonLspconfigSettings
		opts = { ensure_installed = {} },
	},
	{
		"jay-babu/mason-null-ls.nvim",
		optional = true,
		---@param opts MasonNullLsSettings
		opts = { ensure_installed = {} },
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		optional = true,
		---@param opts MasonNvimDapSettings
		opts = { ensure_installed = {} },
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		optional = true,
		opts = { ensure_installed = {} },
	},
}
