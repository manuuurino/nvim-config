---@type LazySpec
return {
	"folke/todo-comments.nvim",
	event = "User AstroFile",
	cmd = { "TodoTrouble", "TodoTelescope", "TodoLocList", "TodoQuickFix" },
	dependencies = {
		"AstroNvim/astroui",
		{
			"AstroNvim/astrocore",
			---@param opts AstroCoreOpts
			opts = function(_, opts)
				local is_available = require("astrocore").is_available

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

				---@diagnostic disable-next-line: inject-field
				opts.mappings = vim.tbl_deep_extend("force", opts.mappings, {
					n = key_mappings,
				})
			end,
		},
	},
	---@param opts TodoOptions
	opts = function(_, opts)
		local get_icon = require("astroui").get_icon

		---@diagnostic disable-next-line: inject-field
		opts.keywords = {
			FIX = {
				icon = get_icon("FixIcon", 1),
				color = "error",
				alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
			},
			TODO = {
				icon = get_icon("TodoIcon", 1),
				color = "info",
			},
			HACK = {
				icon = get_icon("HackIcon", 1),
				color = "warning",
			},
			WARN = {
				icon = get_icon("WarnIcon", 1),
				color = "warning",
				alt = { "WARNING", "XXX" },
			},
			PERF = {
				icon = get_icon("PerfIcon", 1),
				alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" },
			},
			NOTE = {
				icon = get_icon("NoteIcon", 1),
				color = "hint",
				alt = { "INFO" },
			},
			TEST = {
				icon = get_icon("TestIcon", 1),
				color = "test",
				alt = { "TESTING", "PASSED", "FAILED" },
			},
		}
	end,
}
