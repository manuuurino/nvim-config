---@type LazySpec
return {
	{ import = "astrocommunity.lsp.inc-rename-nvim" },
	{
		"smjonas/inc-rename.nvim",
		dependencies = {
			"folke/noice.nvim",
			optional = true,
			---@type NoiceConfig
			opts = {
				cmdline = {
					format = {
						IncRename = {
							view = "cmdline_popup",
						},
					},
				},
			},
		},
	},
}
