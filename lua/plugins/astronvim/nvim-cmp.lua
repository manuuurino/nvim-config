---@type LazySpec
return {
	"AstroNvim/astrocore",
	dependencies = {
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-emoji",
			"hrsh7th/cmp-calc",
			"hrsh7th/cmp-cmdline",
			"lukas-reineke/cmp-under-comparator",
			"chrisgrieser/cmp-nerdfont",
		},
		opts = function(_, opts)
			local cmp = require("cmp")
			local is_available = require("astrocore").is_available

			---@type cmp.ConfigSchema
			local config = {
				sources = cmp.config.sources({
					{
						name = "nvim_lsp",
						priority = 1000,
					},
					is_available("codeium.nvim") and {
						name = "codeium",
						priority = 800,
					} or nil,
					{
						-- credits: https://github.com/catgoose/nvim/blob/279618115977b652eff339d627eeab3c616347a2/lua/plugins/cmp.lua#L70-L78
						name = "luasnip",
						group_index = 1,
						option = { use_show_condition = false },
						entry_filter = function()
							local context = require("cmp.config.context")
							return not context.in_treesitter_capture(
									"string"
								)
								and not context.in_syntax_group("String")
								and not context.in_treesitter_capture("comment")
								and not context.in_syntax_group("Comment")
						end,
						priority = 500,
					},
					{
						name = "emoji",
						priority = 400,
					},
					{
						name = "nerdfont",
						priority = 350,
					},
					{
						name = "path",
						priority = 250,
					},
					{
						name = "calc",
						priority = 100,
					},
					{
						-- FIXME: make it work for all/most filetypes
						name = "buffer",
						keyword_length = 2,
					},
				}),
				---@diagnostic disable-next-line: missing-fields
				formatting = {
					priority_weight = 1,
					comparators = {
						cmp.config.compare.offset,
						cmp.config.compare.exact,
						cmp.config.compare.score,
						cmp.config.compare.recently_used,
						require("cmp-under-comparator").under,
						cmp.config.compare.locality,
						cmp.config.compare.kind,
						cmp.config.compare.sort_text,
						cmp.config.compare.length,
						cmp.config.compare.order,
					},
					-- performance = {
					--   max_view_entries = 50,
					-- },
				},
				experimental = {
					ghost_text = false,
				},
			}

			return vim.tbl_deep_extend("force", opts, config)
		end,
		---@param opts cmp.ConfigSchema
		config = function(_, opts)
			require("cmp").setup(opts)

			local cmp = require("cmp")

			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})

			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline" },
				}),
			})
		end,
	},
}
