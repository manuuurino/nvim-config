local keymaps = {
	-- better increment/decrement
	["+"] = {
		function()
			return require("dial.map").manipulate("increment", "gnormal")
		end,
		desc = "Increment number",
	},
	["-"] = {
		function()
			return require("dial.map").manipulate("decrement", "gnormal")
		end,
		desc = "Decrement number",
	},
}

local mappings = {
	n = keymaps,
	v = keymaps,
}

---@LazySpec
return {
	{ import = "astrocommunity.editing-support.dial-nvim" },
	{
		"monaqa/dial.nvim",
		event = "User AstroFile",
		dependencies = {
			"AstroNvim/astrocore",
			---@type AstroCoreOpts
			opts = {
				mappings = mappings,
			},
		},
	},
}
