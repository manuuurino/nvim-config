---@type LazySpec
return {
	"nvim-treesitter/nvim-treesitter",
	---@type TSConfig
	opts = {
		ensure_installed = {
			"lua",
			"vim",
			"make",
			"gitignore",
			"git_config",
			"passwd",
			"rasi",
			"scss",
			"fish",
		},
	},
}
