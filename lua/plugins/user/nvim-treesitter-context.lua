---@type LazySpec
return {
	--TODO: add background color for tty
	"nvim-treesitter/nvim-treesitter-context",
	event = "User AstroFile",
	dependencies = {
		"AstroNvim/astrocore",
		---@type AstroCoreOpts
		opts = {
			mappings = {
				n = {
					["<Leader>uT"] = {
						"<cmd>TSContextToggle<CR>",
						desc = "Toggle treesitter context",
					},
				},
			},
		},
	},
}
