---@type LazySpec
return {
	"nvim-telescope/telescope.nvim",
	opts = {
		defaults = {
			sorting_strategy = "descending",
			-- layout_strategy = "vertical",
			layout_config = {
				horizontal = {
					prompt_position = "bottom",
				},
				vertical = {
					height = 0.9,
					preview_cutoff = 40,
					prompt_position = "bottom",
					width = 0.8,
				},
			},
		},
	},
}
