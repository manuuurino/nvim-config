local has = require("util.checks").has

---@type LazySpec
return {
	import = "astrocommunity.pack.json",
	cond = has("npm"),
}
