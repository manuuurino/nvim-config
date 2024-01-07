local is_tty = require("util.helper").is_tty

local opt = vim.opt
local g = vim.g

opt.shiftwidth = 4
opt.tabstop = 4
opt.list = true -- render charaters
opt.expandtab = false -- use tabs instead of spaces
opt.clipboard = "" -- no clipboard sharing
-- opt.completeopt = "menu,menuone,noselect,noinsert"
opt.foldcolumn = "auto:3" -- show at least 3 fold lines

-- NOTE:
-- if you dont have the spells, you have to let neovim download them.
-- run this command `nvim --clean -c "set spelllang=en_us,de_de spell" -c "quit"`
opt.spell = true
opt.spelllang = { "en_us", "de_de" }

-- global options from astronvim:
g.mapleader = " "
g.icons_enabled = not is_tty() -- disable icons in the UI
g.codeium_native_plugin = false -- the native plugin doesnt support virtual text yet
