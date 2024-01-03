---@type LazySpec
return {
	"echasnovski/mini.operators",
	keys = {
		{ "<leader>oe", desc = "Evaluate" },
		{ "<leader>ox", desc = "Exchange" },
		{ "<leader>om", desc = "Multiply" },
		{ "<leader>or", desc = "Replace" },
		{ "<leader>os", desc = "Sort" },
	},
	opts = {
		evaluate = { prefix = "<leader>oe" },
		exchange = { prefix = "<leader>ox" },
		multiply = { prefix = "<leader>om" },
		replace = { prefix = "<leader>or" },
		sort = { prefix = "<leader>os" },
	},
}
