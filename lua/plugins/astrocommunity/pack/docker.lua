local has = require("util.checks").has

---@type LazySpec
return {
	import = "astrocommunity.pack.docker",
	cond = has("npm"),
}
