local prefix = "<Leader>f"

local mappings = {
	n = {
		[prefix .. "p"] = {
			"<cmd>Telescope projects<CR>",
			desc = "Open Projects",
		},
	},
}

---@type LazySpec
return {
	{ import = "astrocommunity.project.project-nvim" },
	{
		-- NOTE: this is a fork, the community plugin uses this.
		"jay-babu/project.nvim",
		-- "ahmedkhalf/project.nvim",
		dependencies = {
			"AstroNvim/astrocore",
			---@type AstroCoreOpts
			opts = {
				mappings = mappings,
			},
		},
	},
}
