local is_tty = require("util.helper").is_tty

local o = vim.opt
local g = vim.g

o.shiftwidth = 4
o.tabstop = 4
o.list = true -- render charaters
o.expandtab = false -- use tabs instead of spaces
o.clipboard = "" -- no clipboard sharing
-- opt.completeopt = "menu,menuone,noselect,noinsert"
o.foldcolumn = "auto:3" -- show at least 3 fold lines

-- NOTE:if you dont have the spells, you have to let neovim download them.
--      run this command `nvim --clean -c "set spelllang=en_us,de_de spell" -c "quit"`
o.spell = true
o.spelllang = { "en_us", "de_de" }

-- global options from astronvim:
g.mapleader = " "
g.icons_enabled = not is_tty() -- disable icons in the UI

-- global options for this config
g.codeium_native_plugin = false -- the native plugin doesnt support virtual text yet

if vim.g.neovide then
	o.guifont = "SauceCodePro Nerd Font:h7"
	g.neovide_scale_factor = 1.0
end
