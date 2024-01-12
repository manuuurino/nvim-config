local is_tty = require("user.utils.helper").is_tty

local icons = require("user.icons")

return function(local_vim)
	local o = local_vim.opt
	local g = local_vim.g

	-- NOTE: read the readme how to install a spell, under the section "Installing spells".
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

	-- global options for this config
	g.codeium_native_plugin = false -- the native plugin doesnt support virtual text yet

	if vim.g.neovide then
		o.guifont = "SauceCodePro Nerd Font:h7"
		g.neovide_scale_factor = 1.0
	end

	return local_vim
end
