local prefix = "<Leader>z"
local mappings = {
	n = {
		[prefix] = { desc = "Zen" },
		[prefix .. "z"] = {
			function()
				require("zen-mode").toggle()
			end,
			desc = "Toggle Zen",
		},
	},
}

---@type LazySpec
return {
	{ import = "astrocommunity.editing-support.zen-mode-nvim" },
	{
		"folke/zen-mode.nvim",
		dependencies = {
			"AstroNvim/astrocore",
			---@type AstroCoreOpts
			opts = {
				mappings = mappings,
			},
		},
	},
}
