local o = vim.opt

---@type LazySpec
return {
	"AstroNvim/astrocore",
	---@type AstroCoreOpts
	opts = {
		-- modify core features of AstroNvim
		features = {
			large_buf = { size = 1024 * 500, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
			autopairs = true, -- enable autopairs at start
			cmp = true, -- enable completion at start
			diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
			highlighturl = true, -- highlight URLs at start
			notifications = true, -- enable notifications at start
		},
		-- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
		diagnostics = {
			virtual_text = true,
			underline = true,
			update_in_insert = false,
			severity_sort = true,
		},
		-- NOTE: astrocore will override some options from config/options.lua
		-- https://github.com/AstroNvim/AstroNvim/blob/v4/lua/astronvim/plugins/_astrocore_options.lua
		options = {
			opt = {
				shiftwidth = o.shiftwidth,
				tabstop = o.tabstop,
				expandtab = o.expandtab,
				clipboard = o.clipboard,
				foldcolumn = o.foldcolumn,
			},
		},
	},
}
