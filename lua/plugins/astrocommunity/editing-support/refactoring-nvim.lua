---@type LazySpec
return {
	{ import = "astrocommunity.editing-support.refactoring-nvim" },
	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = {
			"AstroNvim/astrocore",
			---@param opts AstroCoreOpts
			opts = function(_, opts)
				local key_mappings = {
					["<Leader>r"] = { name = "Refactor" },
				}

				opts.mappings = vim.tbl_deep_extend("force", opts.mappings, {
					n = key_mappings,
					x = key_mappings,
				})
			end,
		},
	},
}
