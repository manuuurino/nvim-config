local o = vim.opt
local g = vim.g

if not g.neovide then return end

o.guifont = "SauceCodePro Nerd Font:h10"

g.neovide_scale_factor = 1
o.winblend = 40
o.pumblend = 40

g.neovide_floating_blur_amount_x = 12.0
g.neovide_floating_blur_amount_y = 12.0

-- TODO: no TERM_PROGRAM env?
