---@type LazySpec
return {
	"AstroNvim/astrolsp",
	---@type AstroLSPOpts
	opts = {
		features = {
			autoformat = true,
			codelens = true,
			inlay_hints = false,
			semantic_tokens = true,
		},
		formatting = {
			format_on_save = {
				enabled = true,
			},
		},
		---@diagnostic disable: missing-fields
		config = {
			clangd = { capabilities = { offsetEncoding = "utf-8" } },
		},
	},
}
