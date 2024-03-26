---@type LazySpec
return {
	"nvim-neo-tree/neo-tree.nvim",
	dependencies = {
		"AstroNvim/astroui",
		{
			"AstroNvim/astrocore",
			---@param opts AstroCoreOpts
			-- HACK: AstroNvim uses a function to setup the opts, so we need to use it here too
			opts = function(_, opts)
				-- disable AstroNvim Toggle Explorer Focus
				opts.mappings.n["<Leader>o"] = false
			end,
		},
	},
	opts = function(_, opts)
		local get_icon = require("astroui").get_icon

		return vim.tbl_deep_extend("force", opts, {
			default_component_configs = {
				indent = {
					with_expanders = true,
					expander_collapsed = get_icon("FoldClosed"),
					expander_expanded = get_icon("FoldOpened"),
					expander_highlight = "NeoTreeExpander",
				},
			},
			filesystem = {
				filtered_items = {
					always_show = {
						".config",
						".zshrc",
						".env.zsh",
						".zshenv",
						".gitignore",
					},
				},
			},
		})
	end,
}
