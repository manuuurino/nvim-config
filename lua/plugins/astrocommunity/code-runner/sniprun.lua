local prefix = "<Leader>R"

local mappings = {
	n = {
		[prefix] = {
			name = "SnipRun",
		},
		[prefix .. "r"] = {
			function()
				require("sniprun").run("w")
			end,
			desc = "run file",
		},
	},
	v = {
		[prefix] = {
			name = "SnipRun",
		},
		[prefix .. "r"] = {
			function()
				require("sniprun").run("v")
			end,
			desc = "run selection",
		},
	},
}

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
			---@type AstroCoreOpts
			opts = {
				mappings = mappings,
			},
		},
	},
}
