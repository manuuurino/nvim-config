---@type LazySpec
return {
	"lukas-reineke/indent-blankline.nvim",
	---@param opts ibl.indent_options
	opts = function(_, opts)
		---@diagnostic disable-next-line
		opts.indent.tab_char = require("astroui").get_icon("IndentScope")
		---@diagnostic disable-next-line
		opts.indent.char = require("astroui").get_icon("IndentScope")
	end,
	dependencies = "AstroNvim/astroui",
}
