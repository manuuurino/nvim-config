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
	---@param opts AstroUIOpts
	opts = function(_, opts)
		local dashboard = require("alpha.themes.dashboard")
		local get_icon = require("astroui").get_icon

		---@param keybind string
		---@param icon string
		---@param title string
		local button = function(keybind, icon, title)
			local shortcut = keybind:gsub("%s", ""):gsub("LDR", "<Leader>")
			return dashboard.button(
				keybind,
				get_icon(icon, 2, true) .. title,
				shortcut
			)
		end

		---@diagnostic disable-next-line: undefined-field
		opts.section.buttons.val = {
			button("LDR S l", "LastSession", "Last Session"),
			button("LDR f o", "Recents", "Recents opened files"),
			button("LDR S f", "FindRecentSession", "Find Recent sessions"),
			button("LDR f p", "Project", "Open Project"),
			button("LDR p c", "Config", "Config"),
		}

		return opts
	end,
}