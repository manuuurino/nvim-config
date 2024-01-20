local checks = require("util.checks")
local has = checks.has
local is_on_alpine = checks.is_on_alpine

---@type LazySpec
return {
	{
		import = "astrocommunity.pack.html-css",
		cond = has("npm"),
	},
}
