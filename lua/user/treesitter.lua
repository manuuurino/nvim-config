---@type LazySpec
return {
	"nvim-treesitter/nvim-treesitter",
	---@type TSConfig
	opts = {
		ensure_installed = {
			"make",
			"gitignore",
			"git_config",
			"passwd",
			"ssh_config",
		},
	},
}
