local has = require("util.checks").has

---@type LazySpec
return {
	{
		import = "astrocommunity.pack.kotlin",
		cond = has("npm"),
	},
}
