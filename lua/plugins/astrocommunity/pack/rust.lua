local has = require("util.checks").has

---@type LazySpec
return {
	import = "astrocommunity.pack.rust",
	cond = has("unzip") and has("cargo"),
}
