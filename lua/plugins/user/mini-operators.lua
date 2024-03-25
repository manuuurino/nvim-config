-- NOTE: this override the default AstroNvim keybinding for opening neo-tree
local prefix = "<Leader>o"

local mappings = {
	n = {
		[prefix] = {
			name = "Text edit operators",
		},
	},
}

---@type LazySpec
return {
	"echasnovski/mini.operators",
	event = "User AstroFile",
	dependencies = {
		"AstroNvim/astrocore",
		---@type AstroCoreOpts
		opts = {
			mappings = mappings,
		},
	},
	opts = {
		evaluate = { prefix = prefix .. "e" },
		exchange = { prefix = prefix .. "x" },
		multiply = { prefix = prefix .. "m" },
		replace = { prefix = prefix .. "r" },
		sort = { prefix = prefix .. "s" },
	},
}
