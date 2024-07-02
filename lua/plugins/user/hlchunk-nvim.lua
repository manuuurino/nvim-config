---@type LazySpec
return {
	{
		"shellRaining/hlchunk.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = "AstroNvim/astroui",
		opts = function(_, opts)
			local get_icon = require("astroui").get_icon
			local extend_tbl = require("astrocore").extend_tbl
			return extend_tbl(opts, {
				chunk = {
					enable = true,
					notify = false,
					chars = {
						horizontal_line = get_icon("IndentScopeHorizontalLine"),
						vertical_line = get_icon("IndentScopeVerticalLine"),
						left_top = get_icon("IndentScopeLeftTop"),
						left_bottom = get_icon("IndentScopeLeftBottom"),
						right_arrow = get_icon("IndentScopeRightArrow"),
					},
					delay = 100,
					duration = 0,
					error_sign = false,
				},
				indent = {
					enable = true,
					chars = { get_icon("IndentScope") },
				},
				blank = {
					enable = false,
				},
				line_num = {
					enable = true,
				},
			})
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		optional = true,
		enable = false,
	},
}
