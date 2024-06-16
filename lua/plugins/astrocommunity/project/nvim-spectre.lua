---@type LazySpec
return {
	-- from: https://github.com/AstroNvim/astrocommunity/blob/c95fc1b58ffbff4381b7c546e8aa8f913cd33c98/lua/astrocommunity/project/nvim-spectre/init.lua
	{
		"nvim-pack/nvim-spectre",
		cmd = "Spectre",
		dependencies = {
			{ "AstroNvim/astroui", opts = { icons = { Spectre = "󰛔" } } },
			{
				"AstroNvim/astrocore",
				opts = function(_, opts)
					local maps = opts.mappings
					local prefix = "<Leader>f"
					maps.n[prefix .. "R"] = {
						function()
							require("spectre").open()
						end,
						desc = "Search and Replace",
					}

					maps.x[prefix .. "R"] = {
						function()
							require("spectre").open_visual({
								select_word = true,
							})
						end,
						desc = "Search and Replace (current word)",
					}
				end,
			},
		},
		opts = function()
			return {
				mapping = {
					send_to_qf = { map = "q" },
					replace_cmd = { map = "c" },
					show_option_menu = { map = "o" },
					run_current_replace = { map = "C" },
					run_replace = { map = "R" },
					change_view_mode = { map = "v" },
					resume_last_search = { map = "l" },
				},
			}
		end,
	},
	{
		"folke/edgy.nvim",
		optional = true,
		opts = function(_, opts)
			if not opts.bottom then opts.bottom = {} end
			table.insert(opts.bottom, {
				ft = "spectre_panel",
				title = "Search/Replace",
				size = { height = 0.4 },
			})
		end,
	},
}
