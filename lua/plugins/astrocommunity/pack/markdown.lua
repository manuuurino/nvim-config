local has = require("util.checks").has

---@type LazySpec
return {
	import = "astrocommunity.pack.markdown",
	cond = has("npm"),
}
