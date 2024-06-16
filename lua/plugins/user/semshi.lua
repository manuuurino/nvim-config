---@type LazySpec
return {
	-- credits: https://github.com/Penguin-jpg/nvim-config/blob/3109ee78c0e1b5ee58da9645bd5dfd8d5ad8a788/lua/plugins/lsp-features.lua#L35-L62
	"wookayin/semshi", -- maintained fork
	build = ":UpdateRemotePlugins",
	ft = "python",
	init = function()
		-- better done by LSP
		vim.g["semshi#error_sign"] = false
		vim.g["semshi#simplify_markup"] = false
		vim.g["semshi#mark_selected_nodes"] = false
		vim.g["semshi#update_delay_factor"] = 0.001

		vim.api.nvim_create_autocmd({ "VimEnter", "ColorScheme" }, {
			callback = function()
				vim.cmd([[
  							highlight! semshiGlobal gui=italic
  							highlight! link semshiImported @lsp.type.namespace
  							highlight! link semshiParameter @lsp.type.parameter
  							highlight! link semshiParameterUnused DiagnosticUnnecessary
  							highlight! link semshiBuiltin @function.builtin
  							highlight! link semshiAttribute @field
  							highlight! link semshiSelf @lsp.type.selfKeyword
  							highlight! link semshiUnresolved @lsp.type.unresolvedReference
  							highlight! link semshiFree @comment
  						]])
			end,
		})
	end,
}
