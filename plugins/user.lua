-- TODO: might wanna install https://github.com/mg979/vim-visual-multi
-- TODO: neogen and implement like this: https://code.mehalter.com/AstroNvim_user/~files/v4/lua/plugins/neogen.lua
-- TODO: seems interesting, does also include vscode tasks https://github.com/stevearc/overseer.nvim
-- TODO: could replace neo-tree with this https://github.com/kevinhwang91/rnvimr
-- TODO: https://github.com/aznhe21/actions-preview.nvim

local is_on_glibc = require("user.utils.dependencies").is_on_glibc
local icons = require("user.icons")

local astronvim_utils = require("astronvim.utils")
local is_available = astronvim_utils.is_available
local set_mappings = astronvim_utils.set_mappings

---@type LazySpec
local plugins = {
	{
		--TODO: add background color for tty
		"nvim-treesitter/nvim-treesitter-context",
		event = "User AstroFile",
		init = function(_)
			local prefix = "<leader>u"

			set_mappings({
				n = {
					[prefix .. "T"] = {
						"<cmd>TSContextToggle<CR>",
						desc = "Toggle treesitter context",
					},
				},
			})
		end,
	},
	{
		"mbbill/undotree",
		cmd = "UndotreeToggle",
		event = "User AstroFile",
		init = function(_)
			local prefix = "<leader>f"

			set_mappings({
				n = {
					[prefix .. "u"] = {
						"<cmd>UndotreeToggle<CR>",
						desc = "Find undotree",
					},
				},
			})
		end,
	},
	{
		"jackMort/ChatGPT.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
		cmd = {
			"ChatGPT",
			"ChatGPTActAs",
			"ChatGPTEditWithInstructions",
			"ChatGPTRun",
		},
		cond = vim.env["OPENAI_API_KEY"] ~= nil,
		opts = {
			-- NOTE: plugin has a bug, this below doesnt work yet
			-- api_key_cmd = (
			-- 	"/usr/bin/bw --session '"
			-- 	.. (vim.env["BW_SESSION"] or "")
			-- 	.. "' get item chatgpt"
			-- )
			-- 	.. " | /usr/bin/jq -r '.fields"
			-- 	.. ' | map(select(.name == "api key"))'
			-- 	.. " | .[0].value'",
		},
		init = function(_)
			local prefix = "<leader>a"

			local key_mappings = {
				[prefix] = {
					name = "ChatGPT",
				},
				[prefix .. "e"] = {
					"<cmd>ChatGPTEditWithInstruction<CR>",
					desc = "Edit with instruction",
				},
				[prefix .. "g"] = {
					"<cmd>ChatGPTRun grammar_correction<CR>",
					desc = "Grammar Correction",
				},
				[prefix .. "t"] = {
					"<cmd>ChatGPTRun translate<CR>",
					desc = "Translate",
				},
				[prefix .. "k"] = {
					"<cmd>ChatGPTRun keywords<CR>",
					desc = "Keywords",
				},
				[prefix .. "d"] = {
					"<cmd>ChatGPTRun docstring<CR>",
					desc = "Docstring",
				},
				[prefix .. "a"] = {
					"<cmd>ChatGPTRun add_tests<CR>",
					desc = "Add Tests",
				},
				[prefix .. "o"] = {
					"<cmd>ChatGPTRun optimize_code<CR>",
					desc = "Optimize Code",
				},
				[prefix .. "s"] = {
					"<cmd>ChatGPTRun summarize<CR>",
					desc = "Summarize",
				},
				[prefix .. "f"] = {
					"<cmd>ChatGPTRun fix_bugs<CR>",
					desc = "Fix Bugs",
				},
				[prefix .. "x"] = {
					"<cmd>ChatGPTRun explain_code<CR>",
					desc = "Explain Code",
				},
				[prefix .. "r"] = {
					"<cmd>ChatGPTRun roxygen_edit<CR>",
					desc = "Roxygen Edit",
				},
				[prefix .. "l"] = {
					"<cmd>ChatGPTRun code_readability_analysis<CR>",
					desc = "Code Readability Analysis",
				},
			}

			set_mappings({
				n = vim.tbl_deep_extend("force", key_mappings, {
					[prefix .. "c"] = {
						"<cmd>ChatGPT<CR>",
						desc = "ChatGPT",
					},
				}),
				v = key_mappings,
			})
		end,
	},
	{
		-- credits: https://github.com/AstroNvim/astrocommunity/blob/6f3ce1b6349a29975cbd1af8427f7a52aaef936d/lua/astrocommunity/completion/codeium-vim/init.lua
		"Exafunction/codeium.vim",
		event = "User AstroFile",
		cond = not vim.g.codeium_native_plugin and is_on_glibc(),
		init = function(_)
			local prefix = "<leader>u"

			set_mappings({
				n = {
					[prefix .. "A"] = {
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
			})
		end,
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
				opts = {
					symbol_map = {
						Codeium = "",
					},
				},
			},
		},
		cond = vim.g.codeium_native_plugin and is_on_glibc(),
		config = function(_, opts)
			require("codeium").setup(opts)
		end,
	},
	{
		"folke/todo-comments.nvim",
		event = "User AstroFile",
		cmd = { "TodoTrouble", "TodoTelescope", "TodoLocList", "TodoQuickFix" },
		---@param opts TodoOptions
		opts = function(_, opts)
			---@diagnostic disable-next-line: inject-field
			opts.keywords = {
				FIX = {
					icon = icons.fix_icon,
					color = "error",
					alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
				},
				TODO = {
					icon = icons.todo_icon,
					color = "info",
				},
				HACK = {
					icon = icons.hack_icon,
					color = "warning",
				},
				WARN = {
					icon = icons.warn_icon,
					color = "warning",
					alt = { "WARNING", "XXX" },
				},
				PERF = {
					icon = icons.perf_icon,
					alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" },
				},
				NOTE = {
					icon = icons.note_icon,
					color = "hint",
					alt = { "INFO" },
				},
				TEST = {
					icon = icons.test_icon,
					color = "test",
					alt = { "TESTING", "PASSED", "FAILED" },
				},
			}
		end,
		init = function(_)
			local key_mappings = {
				["<leader>fT"] = {
					"<cmd>TodoTelescope<cr>",
					desc = "Todo telescope",
				},
			}

			if is_available("trouble-nvim") then
				key_mappings["<leader>xt"] = {
					"<cmd>TodoTrouble<cr>",
					desc = "Todo trouble",
				}
			end

			set_mappings({
				n = key_mappings,
			})
		end,
	},
	-- credits: https://github.com/LazyVim/LazyVim/blob/879e29504d43e9f178d967ecc34d482f902e5a91/lua/lazyvim/plugins/ui.lua#L214-L275
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "User AstroFile",
		---@type ibl.indent_options
		---@diagnostic disable-next-line: missing-fields
		opts = {
			indent = {
				char = icons.scope_symbol,
				tab_char = icons.scope_indent_tab_symbol,
			},
			scope = {
				enabled = false,
			},
			exclude = {
				filetypes = {
					"help",
					"alpha",
					"dashboard",
					"neo-tree",
					"Trouble",
					"trouble",
					"lazy",
					"mason",
					"notify",
					"toggleterm",
					"lazyterm",
				},
			},
		},
		main = "ibl",
	},
	{
		"echasnovski/mini.indentscope",
		event = "User AstroFile",
		opts = {
			draw = {
				delay = 0,
				animation = function()
					return 0
				end,
			},
			symbol = icons.scope_symbol,
			options = { try_as_border = true },
		},
		init = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = {
					"help",
					"alpha",
					"dashboard",
					"neo-tree",
					"Trouble",
					"trouble",
					"lazy",
					"mason",
					"notify",
					"toggleterm",
					"lazyterm",
				},
				callback = function()
					vim.b["miniindentscope_disable"] = true
				end,
			})
		end,
	},
	{
		"echasnovski/mini.operators",
		event = "User AstroFile",
		opts = {
			evaluate = { prefix = "<leader>oe" },
			exchange = { prefix = "<leader>ox" },
			multiply = { prefix = "<leader>om" },
			replace = { prefix = "<leader>or" },
			sort = { prefix = "<leader>os" },
		},
		init = function(_)
			set_mappings({
				n = {
					["<leader>o"] = {
						name = "Text edit operators",
						desc = "Text edit operators",
					},
				},
			})
		end,
	},
	{
		"zeioth/garbage-day.nvim",
		dependencies = "neovim/nvim-lspconfig",
		event = "User AstroFile",
		opts = {},
	},
}

return plugins
