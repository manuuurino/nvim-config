local is_on_glibc = require("util.dependencies").is_on_glibc

---@type LazySpec
return {
	{
		-- credits: https://github.com/AstroNvim/astrocommunity/blob/6f3ce1b6349a29975cbd1af8427f7a52aaef936d/lua/astrocommunity/completion/codeium-vim/init.lua
		"Exafunction/codeium.vim",
		event = "User AstroFile",
		cond = not vim.g.codeium_native_plugin and is_on_glibc(),
		dependencies = {
			"AstroNvim/astrocore",
			---@type AstroCoreOpts
			opts = {
				mappings = {
					i = {
						["<C-g>"] = {
							function()
								return vim.fn["codeium#Accept"]()
							end,
							desc = "Codeium accept completion",
							expr = true,
						},
						["<c-n>"] = {
							function()
								return vim.fn["codeium#CycleCompletions"](1)
							end,
							desc = "Codeium next suggestion",
							expr = true,
						},
						["<c-p>"] = {
							function()
								return vim.fn["codeium#CycleCompletions"](-1)
							end,
							desc = "Codeium previous suggestion",
							expr = true,
						},
						["<c-x>"] = {
							function()
								return vim.fn["codeium#Clear"]()
							end,
							desc = "Codeium clear completions",
							expr = true,
						},
					},
					n = {
						["<Leader>uA"] = {
							function()
								if vim.g.codeium_enabled == true then
									vim.cmd("CodeiumDisable")
								else
									vim.cmd("CodeiumEnable")
								end
							end,
							desc = "Toggle Codeium active",
							expr = true,
						},
					},
				},
			},
		},
	},
	{
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
	},
}
