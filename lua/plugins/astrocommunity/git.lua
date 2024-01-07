---@type LazySpec
return {
	{ import = "astrocommunity.git.blame-nvim" },
	{
		"FabijanZulj/blame.nvim",
		dependencies = {
			"AstroNvim/astrocore",
			---@param opts AstroCoreOpts
			opts = function(_, opts)
				local prefix = "<leader>g"

				local key_mappings = {
					[prefix .. "B"] = {
						"<cmd>ToggleBlame<cr>",
						desc = "Toggle git blame",
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
