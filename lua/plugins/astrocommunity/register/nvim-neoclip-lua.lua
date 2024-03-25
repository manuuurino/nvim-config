---@type LazySpec
return {
	{ import = "astrocommunity.register.nvim-neoclip-lua" },
	{
		"AckslD/nvim-neoclip.lua",
		opts = {
			preview = true,
			content_spec_column = true,
		},
	},
}
