-- NOTE: this override the default AstroNvim keybinding for opening neo-tree
local prefix = "<Leader>o"

---@type LazySpec
return {
	{ import = "astrocommunity.editing-support.mini-operators" },
	{
		"echasnovski/mini.operators",
		dependencies = {
			"AstroNvim/astrocore",
			---@type AstroCoreOpts
			opts = {
				mappings = {
					n = {
						[prefix] = {
							name = "Text edit operators",
						},
					},
					v = {
						[prefix] = {
							name = "Text edit operators",
						},
					},
				},
			},
		},
		opts = {
			evaluate = { prefix = prefix .. "e" },
			exchange = { prefix = prefix .. "x" },
			multiply = { prefix = prefix .. "m" },
			replace = { prefix = prefix .. "r" },
			sort = { prefix = prefix .. "s" },
		},
	},
}
