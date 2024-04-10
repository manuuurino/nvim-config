local has = require("util.checks").has

---@type LazySpec
return {
	import = "astrocommunity.pack.cs",
	cond = has("dotnet"),
}
