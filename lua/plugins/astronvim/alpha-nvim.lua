---@type LazySpec
return {
	"goolord/alpha-nvim",
	dependencies = {
		"AstroNvim/astroui",
		{
			"AstroNvim/astrocore",
			---@type AstroCoreOpts
			opts = {
				mappings = {
					n = {
						-- disable home screen
						["<Leader>h"] = false,
					},
				},
			},
		},
	},
	opts = function(_, opts)
		local dashboard = require("alpha.themes.dashboard")
		local get_icon = require("astroui").get_icon
		local adopt_lazyvim_mappings = vim.g.adopt_lazyvim_mappings

		opts.section.buttons.val = {
			dashboard.button(
				adopt_lazyvim_mappings and "LDR q l" or "LDR S l",
				get_icon("LastSession", 2, true) .. "Last Session"
			),
			dashboard.button(
				adopt_lazyvim_mappings and "LDR f r" or "LDR f o",
				get_icon("Recents", 2, true) .. "Recents opened files"
			),
			dashboard.button(
				adopt_lazyvim_mappings and "LDR q f" or "LDR S f",
				get_icon("FindRecentSession", 2, true) .. "Find Recent sessions"
			),
			dashboard.button(
				"LDR f p",
				get_icon("Project", 2, true) .. "Open Project"
			),
			dashboard.button(
				"LDR p c",
				get_icon("Config", 2, true) .. "Config"
			),
		}

		return opts
	end,
}
