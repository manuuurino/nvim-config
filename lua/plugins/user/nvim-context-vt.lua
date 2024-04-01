local mappings = {
	n = {
		["<Leader>uv"] = {
			function()
				require("nvim_context_vt").toggle()
			end,
			name = "Toggle virutal text context",
		},
	},
}

---@type LazySpec
return {
	"andersevenrud/nvim_context_vt",
	event = "User AstroFile",
	dependencies = {
		"AstroNvim/astrocore",
		---@type AstroCoreOpts
		opts = {
			mappings = mappings,
		},
	},
	opts = {
		min_rows = 8,
	},
}
