local has = require("util.checks").has

---@type LazySpec
return {
	{
		import = "astrocommunity.markdown-and-latex.peek-nvim",
		cond = has("deno"),
	},
	{
		-- TODO: remove this after astrocommunity PR https://github.com/AstroNvim/astrocommunity/pull/867
		"toppair/peek.nvim",
		lazy = true,
	},
}
