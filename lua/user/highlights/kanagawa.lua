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
					TelescopeTitle = { fg = theme.ui.special, bold = true },
					TelescopePromptNormal = { bg = theme.ui.bg_p1 },
					TelescopePromptBorder = {
						fg = theme.ui.bg_p1,
						bg = theme.ui.bg_p1,
					},
					TelescopeResultsNormal = {
						fg = theme.ui.fg_dim,
						bg = theme.ui.bg_m1,
					},
					TelescopeResultsBorder = {
						fg = theme.ui.bg_m1,
						bg = theme.ui.bg_m1,
					},
					TelescopePreviewNormal = { bg = theme.ui.bg_dim },
					TelescopePreviewBorder = {
						bg = theme.ui.bg_dim,
						fg = theme.ui.bg_dim,
					},
					TelescopeBorder = {
						fg = theme.ui.float.fg_border,
						bg = theme.ui.bg,
					},
					-- ignoring "astrocommunity.recipes.telescope-nvchad-theme"
					TelescopeNormal = { bg = "none" },
					TelescopePreviewTitle = { fg = "none", bg = "none" },
					TelescopePromptPrefix = { fg = "none", bg = "none" },
					TelescopePromptTitle = { fg = "none", bg = "none" },
					TelescopeResultsTitle = { fg = "none", bg = "none" },

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
