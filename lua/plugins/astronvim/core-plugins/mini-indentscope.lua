---@type LazySpec
return {
	"echasnovski/mini.indentscope",
	event = "User AstroFile",
	---@param opts table
	opts = function(_, opts)
		opts.symbol = require("astroui").get_icon("IndentScope")
	end,
	dependencies = {
		"lukas-reineke/indent-blankline.nvim",
		event = "User AstroFile",
		---@param opts ibl.indent_options
		opts = function(_, opts)
				-- stylua: ignore
				---@diagnostic disable-next-line
				opts.indent.tab_char = require("astroui").get_icon("IndentScope")
			---@diagnostic disable-next-line
			opts.indent.char = require("astroui").get_icon("IndentScope")
		end,
		dependencies = "AstroNvim/astroui",
	},
}
