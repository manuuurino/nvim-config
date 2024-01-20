---@type LazySpec
return {
	{ import = "astrocommunity.editing-support.rainbow-delimiters-nvim" },
	{
		"HiPhish/rainbow-delimiters.nvim",
		---@type rainbow_delimiters.config
		opts = {
			highlight = {
				-- "RainbowDelimiterRed",
				"RainbowDelimiterCyan",
				"RainbowDelimiterViolet",
				"RainbowDelimiterYellow",
				-- "RainbowDelimiterBlue",
				-- "RainbowDelimiterOrange",
				-- "RainbowDelimiterGreen",
			},
		},
	},
}
