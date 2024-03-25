local prefix = "<Leader>r"

local mappings = {
	n = {
		[prefix] = { name = "Refactor" },
	},
	x = {
		[prefix] = { name = "Refactor" },
	},
}

---@type LazySpec
return {
	{ import = "astrocommunity.editing-support.refactoring-nvim" },
	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = {
			"AstroNvim/astrocore",
			---@type AstroCoreOpts
			opts = {
				mappings = mappings,
			},
		},
	},
}
