---@type LazySpec
return {
	"AstroNvim/astrocore",
	---@type AstroCoreOpts
	opts = {
		-- modify core features of AstroNvim
		features = {
			large_buf = { size = 1024 * 100, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
			autopairs = true, -- enable autopairs at start
			cmp = true, -- enable completion at start
			highlighturl = true, -- highlight URLs at start
			notifications = true, -- enable notifications at start
		},
	},
	options = {
		-- opt = { -- vim.opt.<key>
		-- 	relativenumber = true, -- sets vim.opt.relativenumber
		-- 	number = true, -- sets vim.opt.number
		-- 	spell = false, -- sets vim.opt.spell
		-- 	signcolumn = "auto", -- sets vim.opt.signcolumn to auto
		-- 	wrap = false, -- sets vim.opt.wrap
		-- },
		-- g = { -- vim.g.<key>
		-- 	-- configure global vim variables (vim.g)
		-- 	-- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
		-- 	-- This can be found in the `lua/lazy_setup.lua` file
		-- },
	},
}
