---@type LazySpec
local plugins = {
	"nvim-treesitter/nvim-treesitter",
	---@param opts TSConfig
	opts = function(_, opts)
		opts.ensure_installed = require("astronvim.utils").list_insert_unique({
			"make",
			"gitignore",
			"git_config",
			"passwd",
			"rasi",
			"scss",
		}, opts.ensure_installed)
	end,
}
return plugins
