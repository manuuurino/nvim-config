local checks = require("util.checks")
local has = checks.has

---@type LazySpec
return {
	{
		import = "astrocommunity.pack.docker",
		cond = has("npm"),
	},
}
