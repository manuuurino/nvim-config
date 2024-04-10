local has = require("util.checks").has

---@type LazySpec
return {
	import = "astrocommunity.pack.html-css",
	cond = has("npm"),
}
