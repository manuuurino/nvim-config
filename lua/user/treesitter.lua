---@type LazySpec
return {
	"nvim-treesitter/nvim-treesitter",
	---@param opts TSConfig
	opts = function(_, opts)
		opts.ensure_installed = require("astrocore").list_insert_unique({
			"lua",
			"vim",
			"make",
			"gitignore",
			"git_config",
			"passwd",
			"rasi",
			"scss",
		}, opts.ensure_installed)
	end,
}
