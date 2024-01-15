---@type LazySpec
return {
	{ import = "astrocommunity.lsp.inc-rename-nvim" },
	{
		"smjonas/inc-rename.nvim",
		dependencies = {
			"folke/noice.nvim",
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
	{ import = "astrocommunity.lsp.lsp-inlayhints-nvim" },
}
