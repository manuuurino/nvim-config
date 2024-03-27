local o = vim.opt

---@type LazySpec
return {
	"AstroNvim/astrocore",
	---@type AstroCoreOpts
	opts = {
		features = {
			large_buf = { size = 1024 * 500, lines = 10000 },
			autopairs = false,
			cmp = true,
			diagnostics_mode = 3,
			highlighturl = true,
			notifications = true,
		},
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
		on_keys = {
			-- pressing any other key than searching will disable hlsearch
			auto_hlsearch = false,
		},
	},
}
