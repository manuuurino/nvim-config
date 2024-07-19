local has = require("util.checks").has

---@type LazySpec
return {
	import = "astrocommunity.pack.nix",
	cond = has("cargo")
		and has("nixd")
		-- and has("nixfmt") -- TODO: nixfmt some day is getting added in the pack
		and has("alejandra")
		and has("deadnix")
		and has("statix"),
}
