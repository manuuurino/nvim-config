---@type LazySpec
return {
	{ import = "astrocommunity.colorscheme.catppuccin" },
	{
		"catppuccin/nvim",
		name = "catppuccin",
		event = "VeryLazy",
		opts = {
			dim_inactive = { enabled = true, percentage = 0.7 },
		},
	},
}
