local has = require("util.checks").has

---@type LazySpec
return {
	import = "astrocommunity.pack.nix",
	cond = has("cargo"),
}
