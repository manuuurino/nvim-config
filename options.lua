local is_tty = require("user.utils.helper").is_tty

local icons = require("user.icons")

return function(local_vim)
	local o = local_vim.opt
	local g = local_vim.g

	-- NOTE: if you dont have the spells, you have to let neovim download them.
	--       run this command `nvim --clean -c "set spelllang=en_us,de_de spell" -c "quit"`
	o.spell = true
	o.spelllang = "en_us,de_de"

	o.shiftwidth = 4
	o.tabstop = 4
	o.list = true -- render charaters
	o.expandtab = false -- use tabs instead of spaces
	o.listchars = {
		tab = icons.tab_char,
		space = icons.space_char,
	}
	o.clipboard = "" -- no clipboard sharing
	-- o.completeopt = "menu,menuone,noselect,noinsert",
	o.foldcolumn = "auto:3" -- show at least 3 fold lines
	o.fillchars = {
		foldopen = icons.expander_expanded,
		foldsep = icons.expander_separator,
		foldclose = icons.expander_collapsed,
	}

	-- global options from astronvim: https://github.com/AstroNvim/AstroNvim/blob/main/lua/astronvim/options.lua
	g.mapleader = " "
	g.icons_enabled = not is_tty() -- disable icons in the UI
	g.resession_enabled = true -- enable experimental resession.nvim session management (will be default in AstroNvim v4)
	g.inlay_hints_enabled = false -- enable or disable LSP inlay hints on startup (Neovim v0.10 only)
	g.codeium_native_plugin = false -- the native plugin doesnt support virtual text yet

	if vim.g.neovide then
		o.guifont = "SauceCodePro Nerd Font:h7"
		g.neovide_scale_factor = 1.0
	end

	return local_vim
end
