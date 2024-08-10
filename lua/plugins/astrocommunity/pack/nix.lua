local has = require("util.checks").has

---@type LazySpec
return {
	{
		import = "astrocommunity.pack.nix",
		cond = has("cargo")
			and has("nixd")
			-- and has("nixfmt") -- TODO: nixfmt some day is getting added in the pack
			and has("alejandra")
			and has("deadnix")
			and has("statix"),
	},
	{
		"AstroNvim/astrolsp",
		---@type AstroLSPOpts
		opts = {
			---@diagnostic disable-next-line: missing-fields
			config = {
				nixd = {
					settings = {
						nixd = {
							diagnostic = {
								suppress = {
									"sema-escaping-with",
								},
							},
						},
					},
				},
			},
		},
	},
}
