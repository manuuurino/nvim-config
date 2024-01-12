---@type LazySpec
return {
	"aznhe21/actions-preview.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		{
			"AstroNvim/astrolsp",
			---@param opts AstroLspOpts
			opts = function(_, opts)
				local key_mappings = {
					["<leader>la"] = {
						require("actions-preview").code_actions,
						desc = "LSP code action",
						cond = "testDocument/codeAction",
					},
				}

				---@diagnostic disable-next-line: inject-field
				opts.mappings = vim.tbl_deep_extend("force", opts.mappings, {
					n = key_mappings,
					v = key_mappings,
				})
			end,
		},
	},
	opts = {},
}
