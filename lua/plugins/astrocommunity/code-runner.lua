---@type LazySpec
return {
	{ import = "astrocommunity.code-runner.sniprun" },
	{
		"michaelb/sniprun",
		opts = {
			display = {
				"Terminal",
			},
		},
		dependencies = {
			"AstroNvim/astrocore",
			opts = function(_, opts)
				local prefix = "<leader>R"

				local key_mappings = {
					[prefix] = {
						name = "SnipRun",
					},
				}

				opts.mappings = vim.tbl_deep_extend("force", opts.mappings, {
					n = vim.tbl_deep_extend("force", key_mappings, {
						[prefix .. "r"] = {
							function()
								require("sniprun").run("w")
							end,
							desc = "run file",
						},
					}),
					v = vim.tbl_deep_extend("force", key_mappings, {
						[prefix .. "r"] = {
							function()
								require("sniprun").run("v")
							end,
							desc = "run selection",
						},
					}),
				})

				return opts
			end,
		},
	},
}
