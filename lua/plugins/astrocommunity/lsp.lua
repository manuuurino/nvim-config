---@type LazySpec
return {
	{ import = "astrocommunity.lsp.lsp-signature-nvim" },
	{
		"ray-x/lsp_signature.nvim",
		opts = {
			noice = true,
		},
	},
	{ import = "astrocommunity.lsp.lsp-inlayhints-nvim" },
}
