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

		-- credits: https://github.com/AstroNvim/AstroNvim/blob/aedddcf9fc686729031578869e5a98032ca17449/lua/astronvim/plugins/alpha.lua#L82-L109
		--- @param shortcut string Shortcut string of a button mapping
		--- @param desc string Real text description of the mapping
		--- @param rhs string? Righthand side of mapping if defining a new mapping (_optional_)
		--- @param map_opts table? `keymap.set` options used during keymap creating (_optional_)
		dashboard.button = function(shortcut, desc, rhs, map_opts)
			-- HACK: fixes leader customization, remove after fixed upstream
			-- https://github.com/goolord/alpha-nvim/pull/271
			local lhs =
				shortcut:gsub("%s", ""):gsub(dashboard.leader, "<Leader>")
			local default_map_opts =
				{ noremap = true, silent = true, nowait = true, desc = desc }

			return {
				type = "button",
				val = desc,
				on_press = function()
					vim.api.nvim_feedkeys(
						vim.api.nvim_replace_termcodes(
							rhs or lhs .. "<Ignore>",
							true,
							false,
							true
						),
						"t",
						false
					)
				end,
				opts = {
					position = "center",
					shortcut = shortcut,
					cursor = -2,
					width = 36,
					align_shortcut = "right",
					hl = "DashboardCenter",
					hl_shortcut = "DashboardShortcut",
					keymap = rhs and {
						"n",
						lhs,
						rhs,
						require("astrocore").extend_tbl(
							default_map_opts,
							map_opts
						),
					},
				},
			}
		end

		---@diagnostic disable-next-line: undefined-field
		opts.section.buttons.val = {
			dashboard.button(
				"LDR S l",
				get_icon("LastSession", 2, true) .. "Last Session"
			),
			dashboard.button(
				"LDR f o",
				get_icon("Recents", 2, true) .. "Recents opened files"
			),
			dashboard.button(
				"LDR S f",
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
