---@type LazySpec
return {
	{ import = "astrocommunity.project.nvim-spectre" },
	{
		"nvim-pack/nvim-spectre",
		dependencies = {
			"AstroNvim/astrocore",
			---@type AstroCoreOpts
			opts = {
				mappings = {
					n = {
						["<Leader>sf"] = false,
					},
				},
			},
		},
	},
}
