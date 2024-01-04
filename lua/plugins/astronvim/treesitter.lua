---@type LazySpec
return {
	"nvim-treesitter/nvim-treesitter",
	---@param opts TSConfig
	opts = function(_, opts)
		opts.ensure_installed =
			require("astrocore").list_insert_unique(opts.ensure_installed, {
				-- "lua"
			})
	end,
}
