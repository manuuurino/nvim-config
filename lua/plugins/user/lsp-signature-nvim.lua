---@type LazySpec
return {
	{
		"ray-x/lsp_signature.nvim",
		event = "User AstroFile",
		opts = {
			hint_enable = false,
		},
		config = function(_, opts)
			require("lsp_signature").setup(opts)
		end,
	},
	{
		"folke/noice.nvim",
		optional = true,
		---@type NoiceConfig
		opts = {
			lsp = {
				signature = { enabled = false },
				hover = { enabled = false },
			},
		},
	},
}
