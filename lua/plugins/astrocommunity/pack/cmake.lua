local has = require("util.checks").has

---@type LazySpec
return {
	import = "astrocommunity.pack.cmake",
	cond = has("cargo"),
}
