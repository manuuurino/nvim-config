---@type LazySpec
return {
	"folke/twilight.nvim",
	dependencies = {
		"AstroNvim/astrocore",
		opts = {
			mappings = {
				n = {
					["<Leader>zt"] = {
						"<Cmd>Twilight<CR>",
						desc = "Toggle Twilight",
					},
				},
			},
		},
	},
	cmd = {
		"Twilight",
		"TwilightEnable",
		"TwilightDisable",
	},
}
