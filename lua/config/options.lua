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

-- NOTE: read the readme how to install a spell, under the section "Installing spells".
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
