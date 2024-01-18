local checks = require("util.checks")
local has = checks.has
local is_on_alpine = checks.is_on_alpine

---@type LazySpec
return {
	--inspired by: https://github.com/chaozwn/astronvim_with_coc_or_mason/blob/4a59dea217ae9c931764bea64b2085c0a9a8e27c/plugins/community-pack.lua#L2
	{
		import = "astrocommunity.pack.bash",
		cond = has("npm"),
	},
}
