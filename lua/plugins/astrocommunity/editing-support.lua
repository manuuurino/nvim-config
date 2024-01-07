---@type LazySpec
return {
	-- TODO: keymap toggle autosave, maybe also change behaviour?
	-- { import = "astrocommunity.editing-support.auto-save-nvim" },

	{ import = "astrocommunity.editing-support.nvim-treesitter-endwise" },
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
	{ import = "astrocommunity.editing-support.refactoring-nvim" },
	{ import = "astrocommunity.editing-support.suda-vim" },
	{ import = "astrocommunity.editing-support.mini-splitjoin" },
	{ import = "astrocommunity.editing-support.true-zen-nvim" },
	{ import = "astrocommunity.editing-support.vim-move" },
}
