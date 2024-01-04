---@type LazySpec
return {
	{
		"AstroNvim/astroui",
		---@param opts AstroUIOpts
		opts = function(_, opts)
			local icons = {
				IndentScope = "▏",

				FoldClosed = "",
				FoldOpened = "",
				FoldSeparator = "│",
				FoldedSymbol = "󰁂",

				CharTab = "——»",
				CharSpace = "·",
			}

			local text_icons = {
				IndentScope = "│",

				FoldClosed = "▶",
				FoldOpened = "▼",
				FoldSeparator = "│",
				FoldedSymbol = "...",

				CharTab = "──»",
				CharSpace = "·",
			}

			return vim.tbl_deep_extend("force", opts, {
				icons = icons,
				text_icons = text_icons,
			})
		end,
		init = function(_)
			local get_icon = require("astroui").get_icon
			local o = vim.opt

			o.listchars:append({
				tab = get_icon("CharTab"),
				space = get_icon("CharSpace"),
			})

			o.fillchars:append({
				foldopen = get_icon("FoldOpened"),
				foldsep = get_icon("FoldSeparator"),
				foldclose = get_icon("FoldClosed"),
			})
		end,
	},
}
