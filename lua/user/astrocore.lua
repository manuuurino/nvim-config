local o = vim.opt

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
