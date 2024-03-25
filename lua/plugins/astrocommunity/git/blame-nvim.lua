local prefix = "<Leader>g"

local mappings = {
	n = {
		[prefix .. "B"] = {
			"<cmd>ToggleBlame<cr>",
			desc = "Toggle git blame",
		},
	},
}
---@type LazySpec
return {
	{ import = "astrocommunity.git.blame-nvim" },
	{
		"FabijanZulj/blame.nvim",
		dependencies = {
			"AstroNvim/astrocore",
			---@type AstroCoreOpts
			opts = {
				mappings = mappings,
			},
		},
	},
}
