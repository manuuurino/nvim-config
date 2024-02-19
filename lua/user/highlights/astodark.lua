---@type LazySpec
return {
	"AstroNvim/astroui",
	---@type AstroUIOpts
	opts = {
		highlights = {
			astrodark = function()
				local get_hlgroup = require("astroui").get_hlgroup

				local normal = get_hlgroup("normal")
				local fg, bg = normal.fg, normal.bg
				local bg_alt = get_hlgroup("visual").bg
				local green = get_hlgroup("string").fg
				local red = get_hlgroup("error").fg

				return {
					-- nvchad telescope theme
					telescopeborder = { fg = bg_alt, bg = bg },
					telescopenormal = { bg = bg },
					telescopepreviewborder = { fg = bg, bg = bg },
					telescopepreviewnormal = { bg = bg },
					telescopepreviewtitle = { fg = bg, bg = green },
					telescopepromptborder = { fg = bg_alt, bg = bg_alt },
					telescopepromptnormal = { fg = fg, bg = bg_alt },
					telescopepromptprefix = { fg = red, bg = bg_alt },
					telescopeprompttitle = { fg = bg, bg = red },
					telescoperesultsborder = { fg = bg, bg = bg },
					telescoperesultsnormal = { bg = bg },
					telescoperesultstitle = { fg = bg, bg = bg },
				}
			end,
		},
	},
}
