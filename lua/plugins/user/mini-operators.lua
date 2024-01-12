---@type LazySpec
return {
	"echasnovski/mini.operators",
	event = "User AstroFile",
	dependencies = {
		"AstroNvim/astrocore",
		-- HACK: this overrides the neo-tree mapping
		opts = function(_, opts)
			local maps = opts.mappings
			maps.n["<Leader>o"] = {
				name = "Text edit operators",
			}
		end,
	},
	opts = {
		evaluate = { prefix = "<leader>oe" },
		exchange = { prefix = "<leader>ox" },
		multiply = { prefix = "<leader>om" },
		replace = { prefix = "<leader>or" },
		sort = { prefix = "<leader>os" },
	},
}
