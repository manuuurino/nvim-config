---@type LazySpec
return {
	{ import = "astrocommunity.editing-support.rainbow-delimiters-nvim" },
	{
		"HiPhish/rainbow-delimiters.nvim",
		-- TODO: resolve this in astrocommunity
		event = function()
			---@diagnostic disable-next-line: return-type-mismatch
			return "User AstroFile"
		end,
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
