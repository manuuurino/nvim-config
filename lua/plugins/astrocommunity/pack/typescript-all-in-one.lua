local has = require("util.checks").has

---@type LazySpec
return {
	import = "astrocommunity.pack.typescript-all-in-one",
	cond = has("deno"),
}
