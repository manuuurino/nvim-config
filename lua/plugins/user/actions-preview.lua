---@type LazySpec
return {
	"aznhe21/actions-preview.nvim",
	event = "User AstroFile",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		{
			"AstroNvim/astrolsp",
			---@param opts AstroLSPOpts
			opts = function(_, opts)
				local key_mappings = {
					["<Leader>la"] = {
						require("actions-preview").code_actions,
						desc = "LSP code action",
						cond = "testDocument/codeAction",
					},
				}

				opts.mappings = vim.tbl_deep_extend("force", opts.mappings, {
					n = key_mappings,
					v = key_mappings,
				})
			end,
		},
	},
}
