local has = require("util.checks").has

---@type LazySpec
return {
	{
		import = "astrocommunity.pack.java",
		cond = has("npm"),
	},
}
