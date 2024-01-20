---@type LazySpec
return {
	"AstroNvim/astroui",
	---@type AstroUIOpts
	opts = {
		highlights = {
			kanagawa = function()
				local colors = require("kanagawa.colors").setup()
				local theme = colors.theme

				return {
					-- borderless telescope
					telescopetitle = { fg = theme.ui.special, bold = true },
					telescopepromptnormal = { bg = theme.ui.bg_p1 },
					telescopepromptborder = {
						fg = theme.ui.bg_p1,
						bg = theme.ui.bg_p1,
					},
					telescoperesultsnormal = {
						fg = theme.ui.fg_dim,
						bg = theme.ui.bg_m1,
					},
					telescoperesultsborder = {
						fg = theme.ui.bg_m1,
						bg = theme.ui.bg_m1,
					},
					telescopepreviewnormal = { bg = theme.ui.bg_dim },
					telescopepreviewborder = {
						bg = theme.ui.bg_dim,
						fg = theme.ui.bg_dim,
					},

					-- dark completion (popup) menu
					-- pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
					pmenusel = { fg = "none", bg = theme.ui.bg_p2 },
					pmenusbar = { bg = theme.ui.bg_m1 },
					pmenuthumb = { bg = theme.ui.bg_p2 },
				}
			end,
		},
	},
}
