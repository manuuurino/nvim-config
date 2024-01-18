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
			---@param opts AstroUIOpts
			opts = function(_, opts)
				local prefix = "<Leader>R"

				local key_mappings = {
					[prefix] = {
						name = "SnipRun",
					},
				}

				---@diagnostic disable-next-line: inject-field
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
			end,
		},
	},
}
