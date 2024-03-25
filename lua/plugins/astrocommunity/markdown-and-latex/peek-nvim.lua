local has = require("util.checks").has

---@type LazySpec
return {
	{
		import = "astrocommunity.markdown-and-latex.peek-nvim",
		cond = has("deno"),
	},
	{
		"toppair/peek.nvim",
		cmd = { "PeekOpen", "PeekClose" },
	},
}
