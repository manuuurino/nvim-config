---@type LazySpec
return {
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
}
