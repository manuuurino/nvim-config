local has = require("util.checks").has

---@type LazySpec
return {
	import = "astrocommunity.pack.bash",
	cond = has("npm"),
}
