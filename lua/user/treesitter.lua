---@type LazySpec
return {
	"nvim-treesitter/nvim-treesitter",
	---@param opts TSConfig
	opts = function(_, opts)
		opts.ensure_installed = require("astrocore").list_insert_unique(
			---@diagnostic disable-next-line: param-type-mismatch
			opts.ensure_installed,
			{
				"lua",
				"vim",
				"make",
				"gitignore",
				"git_config",
				"passwd",
				"rasi",
				"scss",
				"fish",
			}
		)
	end,
}
