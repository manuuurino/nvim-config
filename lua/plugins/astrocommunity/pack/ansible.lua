local checks = require("util.checks")
local has = checks.has

---@type LazySpec
return {
	--inspired by: https://github.com/chaozwn/astronvim_with_coc_or_mason/blob/4a59dea217ae9c931764bea64b2085c0a9a8e27c/plugins/community-pack.lua#L2
	{
		import = "astrocommunity.pack.ansible",
		cond = has("npm") and has("python3"),
	},
}
