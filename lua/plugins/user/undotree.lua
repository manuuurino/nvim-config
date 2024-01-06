---@type LazySpec
return {
	"mbbill/undotree",
	cmd = "UndotreeToggle",
	event = "User AstroFile",
	dependencies = {
		"AstroNvim/astrocore",
		opts = {
			mappings = {
				n = {
					["<leader>fu"] = {
						"<cmd>UndotreeToggle<CR>",
						desc = "Find undotree",
					},
				},
			},
		},
	},
}
