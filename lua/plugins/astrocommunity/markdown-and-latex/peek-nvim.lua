local has = require("util.checks").has

local prefix = vim.g.adopt_lazyvim_mappings and "<Leader>l" or "<Leader>m"

---@type AstroCoreMappings
local mappings = {
	n = {
		[prefix .. "m"] = {
			function()
				local peek = require("peek")
				if peek.is_open() then
					vim.notify("Peek closed")
					peek.close()
				else
					vim.notify("Peek opened")
					peek.open()
				end
			end,
			desc = "Toggle Markdown Preview",
		},
	},
}

---@type LazySpec
return {
	{
		import = "astrocommunity.markdown-and-latex.peek-nvim",
		cond = has("deno"),
	},
	{
		"toppair/peek.nvim",
		dependencies = {
			"AstroNvim/astrocore",
			---@type AstroCoreOpts
			opts = {
				mappings = mappings,
			},
		},
	},
}
