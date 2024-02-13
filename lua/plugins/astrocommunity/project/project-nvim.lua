---@type LazySpec
return {
	{ import = "astrocommunity.project.project-nvim" },
	{
		-- NOTE: this is a fork, the community plugin uses this.
		"jay-babu/project.nvim",
		-- "ahmedkhalf/project.nvim",
		dependencies = {
			"AstroNvim/astrocore",
			---@param opts AstroCoreOpts
			opts = function(_, opts)
				local prefix = "<Leader>f"

				local key_mappings = {
					[prefix .. "p"] = {
						"<cmd>Telescope projects<CR>",
						desc = "Open Projects",
					},
				}

				---@diagnostic disable-next-line: inject-field
				opts.mappings = vim.tbl_deep_extend("force", opts.mappings, {
					n = key_mappings,
				})
			end,
		},
	},
}