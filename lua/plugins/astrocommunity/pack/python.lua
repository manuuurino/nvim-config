local has = require("util.checks").has

---@type LazySpec
return {
	import = "astrocommunity.pack.python",
	cond = has("npm") and has("python3"),
}
