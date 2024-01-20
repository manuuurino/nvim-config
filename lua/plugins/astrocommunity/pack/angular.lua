local checks = require("util.checks")
local has = checks.has

---@type LazySpec
return {
	{
		import = "astrocommunity.pack.angular",
		cond = has("npm"),
	},
}
