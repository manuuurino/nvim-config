local has = require("util.checks").has

---@type LazySpec
return {
	import = "astrocommunity.pack.ps1",
	cond = has("npm"),
}
