---@type LazySpec
local plugins = {
	{ "max397574/better-escape.nvim", enabled = false },
	{
		"goolord/alpha-nvim",
		opts = function(_, opts)
			-- customize the dashboard header
			opts.section.header.val = {
				" █████  ███████ ████████ ██████   ██████",
				"██   ██ ██         ██    ██   ██ ██    ██",
				"███████ ███████    ██    ██████  ██    ██",
				"██   ██      ██    ██    ██   ██ ██    ██",
				"██   ██ ███████    ██    ██   ██  ██████",
				" ",
				"    ███    ██ ██    ██ ██ ███    ███",
				"    ████   ██ ██    ██ ██ ████  ████",
				"    ██ ██  ██ ██    ██ ██ ██ ████ ██",
				"    ██  ██ ██  ██  ██  ██ ██  ██  ██",
				"    ██   ████   ████   ██ ██      ██",
			}

			local button = require("astronvim.utils").alpha_button
			opts.section.buttons.val = {
				button("LDR S l", "  Last Session  "),
				button("LDR f o", "󰈙  Recents  "),
				button("LDR S f", "  Find Recent sessions"),
				button("LDR f p", "  Open Project  "),
				button("LDR a c", "  Config  "),
			}

			return opts
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		opts = {
			default_component_configs = {
				indent = {
					with_expanders = true,
					expander_collapsed = "",
					expander_expanded = "",
					expander_highlight = "NeoTreeExpander",
				},
			},
		},
	},
	-- TEST: buffer completion doesnt work on all files? need to test later.
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-emoji",
			"hrsh7th/cmp-calc",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-cmdline",
			"lukas-reineke/cmp-under-comparator",
			"chrisgrieser/cmp-nerdfont",
		},
		---@param opts cmp.ConfigSchema
		---@return cmp.ConfigSchema
		opts = function(_, opts)
			local cmp = require("cmp")
			return require("astronvim.utils").extend_tbl(opts, {
				window = {
					documentation = {
						max_width = 60,
					},
				},
				sources = cmp.config.sources({
					{ name = "nvim_lsp", priority = 1000 },
					{ name = "nvim_lua", priority = 900 },
					{ -- credits: https://github.com/catgoose/nvim/blob/279618115977b652eff339d627eeab3c616347a2/lua/plugins/cmp.lua#L70-L78
						name = "luasnip",
						group_index = 1,
						option = { use_show_condition = false },
						entry_filter = function()
							local context = require("cmp.config.context")
							return not context.in_treesitter_capture("string")
								and not context.in_syntax_group("String")
								and not context.in_treesitter_capture("comment")
								and not context.in_syntax_group("Comment")
						end,
						priority = 500,
					},
					{ name = "emoji", priority = 400 },
					{ name = "nerdfont", priority = 350 },
					{ name = "path", priority = 250 },
					{ name = "calc", priority = 100 },
					{ name = "buffer", keyword_length = 2 },
				}),
				{},
				sorting = {
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
			})
		end,
		---@param opts cmp.ConfigSchema
		config = function(_, opts)
			require("cmp").setup(opts)

			local cmp = require("cmp")
			---@diagnostic disable-next-line
			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})

			---@diagnostic disable-next-line
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
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"honza/vim-snippets",
		},
	},
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			{ "theHamsta/nvim-dap-virtual-text", config = true },
		},
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		opts = {
			filesystem = {
				filtered_items = {
					always_show = {
						".config",
						".zshrc",
						".env.zsh",
						".zshenv",
						".gitignore",
					},
				},
			},
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			current_line_blame = true,
			current_line_blame_opts = { ignore_whitespace = true },
		},
	},
	{
		"kevinhwang91/nvim-ufo",
		cond = not vim.g.vscode,
		-- credits: https://github.com/kevinhwang91/nvim-ufo/blob/c6d88523f574024b788f1c3400c5d5b9bb1a0407/README.md?plain=1#L332-L358
		opts = function(_, opts)
			local handler = function(virtText, lnum, endLnum, width, truncate)
				local newVirtText = {}
				local suffix = (" 󰁂 %d "):format(endLnum - lnum)
				local sufWidth = vim.fn.strdisplaywidth(suffix)
				local targetWidth = width - sufWidth
				local curWidth = 0
				for _, chunk in ipairs(virtText) do
					local chunkText = chunk[1]
					local chunkWidth = vim.fn.strdisplaywidth(chunkText)
					if targetWidth > curWidth + chunkWidth then
						table.insert(newVirtText, chunk)
					else
						chunkText = truncate(chunkText, targetWidth - curWidth)
						local hlGroup = chunk[2]
						table.insert(newVirtText, { chunkText, hlGroup })
						chunkWidth = vim.fn.strdisplaywidth(chunkText)
						-- str width returned from truncate() may less than 2nd argument, need padding
						if curWidth + chunkWidth < targetWidth then
							suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
						end
						break
					end
					curWidth = curWidth + chunkWidth
				end
				table.insert(newVirtText, { suffix, "MoreMsg" })
				return newVirtText
			end
			opts.fold_virt_text_handler = handler
		end,
	},
}
return plugins
