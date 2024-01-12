local icons = require("user.icons")

local astronvim_utils = require("astronvim.utils")
local is_available = astronvim_utils.is_available
local set_mappings = astronvim_utils.set_mappings
local extend_tbl = astronvim_utils.extend_tbl

---@type LazySpec
local plugins = {
	{ "AstroNvim/astrotheme", event = "VeryLazy" },
	-- replacing null-ls with none-ls
	{ "jose-elias-alvarez/null-ls.nvim", enabled = false },
	{
		-- source: https://github.com/AstroNvim/AstroNvim/blob/271c9c3f71c2e315cb16c31276dec81ddca6a5a6/lua/plugins/lsp.lua#L57-L68
		"nvimtools/none-ls.nvim",
		dependencies = {
			{
				"jay-babu/mason-null-ls.nvim",
				cmd = { "NullLsInstall", "NullLsUninstall" },
				opts = { handlers = {} },
			},
		},
		event = "User AstroFile",
		opts = function()
			return { on_attach = require("astronvim.utils.lsp").on_attach }
		end,
	},
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
				button("LDR S l", icons.last_session .. "  Last Session  "),
				button("LDR f o", icons.recents .. "  Recents  "),
				button(
					"LDR S f",
					icons.find_recent_session .. "  Find Recent sessions"
				),
				button("LDR f p", icons.project .. "  Open Project  "),
				button("LDR p c", icons.config .. "  Config  "),
			}

			return opts
		end,
	},
	{
		"nvim-treesitter",
		---@type TSConfig
		---@diagnostic disable-next-line: missing-fields
		opts = {
			incremental_selection = {
				enable = true,
				keymaps = {
					node_incremental = "v",
					node_decremental = "V",
				},
			},
		},
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"LinArcX/telescope-env.nvim",
			{
				"ThePrimeagen/git-worktree.nvim",
				init = function(_)
					local prefix = "<leader>g"

					set_mappings({
						n = {

							[prefix .. "w"] = {
								function()
									require("telescope").extensions.git_worktree.git_worktrees()
								end,
								desc = "Switch git worktree",
							},
							[prefix .. "W"] = {
								function()
									require("telescope").extensions.git_worktree.create_git_worktree()
								end,
								desc = "Create new git worktree",
							},
						},
					})
				end,
			},
		},
		opts = {
			defaults = {
				sorting_strategy = "descending",
				-- layout_strategy = "vertical",
				layout_config = {
					horizontal = {
						prompt_position = "bottom",
					},
					vertical = {
						height = 0.9,
						preview_cutoff = 40,
						prompt_position = "bottom",
						width = 0.8,
					},
				},
			},
		},
		init = function(_)
			require("telescope").load_extension("env")
			require("telescope").load_extension("git_worktree")
		end,
	},
	{
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
					{ -- credits: https://github.com/catgoose/nvim/blob/279618115977b652eff339d627eeab3c616347a2/lua/plugins/cmp.lua#L70-L78
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

			return extend_tbl(opts, config)
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
	{
		"nvim-neo-tree/neo-tree.nvim",
		opts = {
			default_component_configs = {
				indent = {
					with_expanders = true,
					expander_collapsed = icons.expander_collapsed,
					expander_expanded = icons.expander_expanded,
					expander_highlight = "NeoTreeExpander",
				},
			},
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
		---@param opts UfoConfig
		opts = function(_, opts)
			-- credits: https://github.com/kevinhwang91/nvim-ufo/blob/c6d88523f574024b788f1c3400c5d5b9bb1a0407/README.md?plain=1#L332-L358
			local handler = function(virtText, lnum, endLnum, width, truncate)
				local newVirtText = {}
				local suffix = (" " .. icons.folded_symbol .. " %d "):format(
					endLnum - lnum
				)
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
							suffix = suffix
								.. (" "):rep(
									targetWidth - curWidth - chunkWidth
								)
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
		init = function(_)
			-- credits: https://github.com/kevinhwang91/nvim-ufo/issues/150
			-- NOTE: this can also easily break and the fold level doesnt limit till the max nested of folds
			-- Ensure our ufo foldlevel is set for the buffer
			vim.api.nvim_create_autocmd("BufReadPre", {
				callback = function()
					vim.b["ufo_foldlevel"] = 0
				end,
			})

			---@param num integer Set the fold level to this number
			local set_buf_foldlevel = function(num)
				vim.b["ufo_foldlevel"] = num
				require("ufo").closeFoldsWith(num)
			end

			---@param num integer The amount to change the UFO fold level by
			local change_buf_foldlevel_by = function(num)
				local foldlevel = vim.b["ufo_foldlevel"] or 0
				-- Ensure the foldlevel can't be set negatively
				if foldlevel + num >= 0 then
					foldlevel = foldlevel + num
				else
					foldlevel = 0
				end
				set_buf_foldlevel(foldlevel)
			end

			local fold_more = function()
				local count = vim.v.count
				if count == 0 then count = 1 end
				change_buf_foldlevel_by(-count)
			end

			local fold_less = function()
				local count = vim.v.count
				if count == 0 then count = 1 end
				change_buf_foldlevel_by(count)
			end

			local fold_set_level = function()
				local fold_level = tonumber(vim.fn.input("Foldlevel: "))

				if fold_level ~= nil then
					set_buf_foldlevel(fold_level)
				else
					vim.notify(
						"No foldlevel given to set!",
						vim.log.levels.WARN
					)
				end
			end

			set_mappings({
				n = {
					["zm"] = {
						fold_more,
						desc = "fold more",
					},
					["zr"] = {
						fold_less,
						desc = "Fold less",
					},
					["zS"] = {
						fold_set_level,
						desc = "UFO: Set Foldlevel",
					},
				},
			})
		end,
	},
}

return plugins