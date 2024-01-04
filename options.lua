local is_tty = require("user.utils.helper").is_tty

local icons = require("user.icons")

return {
	opt = {
		-- NOTE:
		-- if you dont have the spells, you have to let neovim download them.
		-- run this command `nvim --clean -c "set spelllang=en_us,de_de spell" -c "quit"`
		spell = true,
		spelllang = "en_us,de_de",

		shiftwidth = 4,
		tabstop = 4,
		list = true, -- render charaters
		expandtab = false, -- use tabs instead of spaces
		listchars = {
			tab = icons.tab_char,
			space = icons.space_char,
		},
		clipboard = "", -- no clipboard sharing
		-- completeopt = "menu,menuone,noselect,noinsert",
		foldcolumn = "auto:3", -- show at least 3 fold lines
		fillchars = {
			foldopen = icons.expander_expanded,
			foldsep = icons.expander_separator,
			foldclose = icons.expander_collapsed,
		},
	},
	g = {
		-- global options from astronvim: https://github.com/AstroNvim/AstroNvim/blob/main/lua/astronvim/options.lua
		mapleader = " ",
		icons_enabled = not is_tty(), -- disable icons in the UI
		resession_enabled = true, -- enable experimental resession.nvim session management (will be default in AstroNvim v4)
		inlay_hints_enabled = false, -- enable or disable LSP inlay hints on startup (Neovim v0.10 only)
		codeium_native_plugin = false, -- the native plugin doesnt support virtual text yet
	},
}
