local has = require("util.checks").has

---@type LazySpec
return {
	import = "astrocommunity.pack.ansible",
	cond = has("npm") and has("python3"),
}
