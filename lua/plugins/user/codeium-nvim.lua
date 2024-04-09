local is_on_glibc = require("util.checks").is_on_glibc

---@type LazySpec
return {
	-- NOTE: only gives suggestions through nvim-cmp now, maybe the author will change it.
	"Exafunction/codeium.nvim",
	event = "User AstroFile",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"hrsh7th/nvim-cmp",
		{
			"onsails/lspkind.nvim",
			dependencies = "AstroNvim/astroui",
			opts = function(_, opts)
				local get_icon = require("astroui").get_icon

				return vim.tbl_deep_extend("force", opts, {
					symbol_map = {
						Codeium = get_icon("CmpKindCodeium"),
					},
				})
			end,
		},
	},
	cond = vim.g.codeium_native_plugin and is_on_glibc(),
	config = function(_, opts)
		require("codeium").setup(opts)
	end,
}
