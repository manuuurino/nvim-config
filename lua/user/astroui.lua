---@type LazySpec
return {
	"AstroNvim/astrocore",
	dependencies = {
		"AstroNvim/astroui",
		---@param opts AstroUIOpts
		opts = function(_, opts)
			local icons = {
				IndentScope = "▏",

				FoldClosed = "",
				FoldOpened = "",
				FoldSeparator = "│",
				FoldedSymbol = "",

				EmptyDiffChar = "╱",

				CharTab = "——→",
				CharSpace = "·",

				Config = "",
				Project = "󰸕",
				LastSession = "",
				Recents = "",
				FindRecentSession = "",

				FixIcon = "",
				TodoIcon = "",
				HackIcon = "",
				WarnIcon = "",
				PerfIcon = "",
				NoteIcon = "",
				TestIcon = "⏲",

				CmpKindCodeium = "",
			}

			--[[
			-- typically the tty supports thessheetsheete fonts characters.
			-- ASCII
			-- CP437 https://en.wikipedia.org/wiki/Code_page_437#Character_set
			-- ISO/IEC 8859-1 https://en.wikipedia.org/wiki/ISO/IEC_8859-1#Code_page_layout
			-- ISO/IEC 8859-2 https://en.wikipedia.org/wiki/ISO/IEC_8859-2#Code_page_layout
			-- ISO/IEC 8859-5 https://en.wikipedia.org/wiki/ISO/IEC_8859-5#Codepage_layout
			-- ISO/IEC 8859-10 https://en.wikipedia.org/wiki/ISO/IEC_8859-10#Codepage_layout
			--]]
			local text_icons = {
				IndentScope = "│",

				FoldClosed = "▶",
				FoldOpened = "▼",
				FoldSeparator = "│",
				FoldedSymbol = "...",

				EmptyDiffChar = "/",

				CharTab = "──→",
				CharSpace = "·",

				FixIcon = "F",
				TodoIcon = "T",
				HackIcon = "H",
				WarnIcon = "W",
				PerfIcon = "P",
				NoteIcon = "N",
				TestIcon = "T",
			}

			return vim.tbl_deep_extend("force", opts, {
				icons = icons,
				text_icons = text_icons,
			})
		end,
	},
	---@param opts AstroCoreOpts
	opts = function(_, opts)
		local astroui = require("astroui")
		local get_icon = astroui.get_icon

		local opt = {
			listchars = {
				tab = get_icon("CharTab"),
				space = get_icon("CharSpace"),
				trail = get_icon("CharSpace"),
			},

			fillchars = {
				diff = get_icon("EmptyDiffChar"),
				foldopen = get_icon("FoldOpened"),
				foldsep = get_icon("FoldSeparator"),
				foldclose = get_icon("FoldClosed"),
			},
		}

		return vim.tbl_deep_extend("force", opts, {
			options = {
				opt = opt,
			},
		})
	end,
}
