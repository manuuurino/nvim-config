local has = require("util.checks").has

---@type LazySpec
return {
	import = "astrocommunity.pack.fish",
	cond = has("fish"),
}
