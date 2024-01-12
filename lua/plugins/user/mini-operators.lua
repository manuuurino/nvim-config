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
		evaluate = { prefix = "<Leader>oe" },
		exchange = { prefix = "<Leader>ox" },
		multiply = { prefix = "<Leader>om" },
		replace = { prefix = "<Leader>or" },
		sort = { prefix = "<Leader>os" },
	},
}
