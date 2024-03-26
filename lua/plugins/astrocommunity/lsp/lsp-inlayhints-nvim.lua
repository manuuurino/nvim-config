---@type LazySpec
return {
	{ import = "astrocommunity.lsp.lsp-inlayhints-nvim" },
	{
		"lvimuser/lsp-inlayhints.nvim",
		-- TODO: resolve this in astrocommunity
		event = "User AstroFile",
	},
}
