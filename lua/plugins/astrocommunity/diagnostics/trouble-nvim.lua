---@type LazySpec
return {
	{ import = "astrocommunity.diagnostics.trouble-nvim" },
	{
		"folke/trouble.nvim",
		dependencies = {
			"AstroNvim/astroui",
		},
		---@param opts TroubleOptions
		---@diagnostic disable: inject-field
		opts = function(_, opts)
			local get_icon = require("astroui").get_icon

			opts.fold_open = get_icon("FoldOpened")
			opts.fold_closed = get_icon("FoldClosed")
		end,
	},
}
