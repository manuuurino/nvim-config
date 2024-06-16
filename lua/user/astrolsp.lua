---@type LazySpec
return {
	"AstroNvim/astrolsp",
	---@type AstroLSPOpts
	opts = {
		features = {
			autoformat = true,
			codelens = true,
			inlay_hints = true,
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
		autocmds = {
			-- credits: https://github.com/AstroNvim/template/blob/7af067e0ffef9975e8e8054d8455e7662dfb1fa0/lua/plugins/astrolsp.lua#L61-L79
			lsp_codelens_refresh = {
				-- Optional condition to create/delete auto command group
				-- can either be a string of a client capability or a function of `fun(client, bufnr): boolean`
				-- condition will be resolved for each client on each execution and if it ever fails for all clients,
				-- the auto commands will be deleted for that buffer
				cond = "textDocument/codeLens",
				-- cond = function(client, bufnr) return client.name == "lua_ls" end,
				-- list of auto commands to set
				{
					-- events to trigger
					event = { "InsertLeave", "BufEnter" },
					-- the rest of the autocmd options (:h nvim_create_autocmd)
					desc = "Refresh codelens (buffer)",
					callback = function(args)
						if require("astrolsp").config.features.codelens then
							vim.lsp.codelens.refresh({ bufnr = args.buf })
						end
					end,
				},
			},
			-- credits: https://github.com/Penguin-jpg/nvim-config/blob/3109ee78c0e1b5ee58da9645bd5dfd8d5ad8a788/lua/plugins/astrolsp.lua#L61-L85
			disable_inlay_hints_on_insert = {
				-- only create for language servers that support inlay hints
				-- (and only if vim.lsp.inlay_hint is available)
				cond = vim.lsp.inlay_hint and "textDocument/inlayHint" or false,
				{
					-- when going into insert mode
					event = "InsertEnter",
					desc = "disable inlay hints on insert",
					callback = function(args)
						local filter = { bufnr = args.buf }
						-- if the inlay hints are currently enabled
						if vim.lsp.inlay_hint.is_enabled(filter) then
							-- disable the inlay hints
							vim.lsp.inlay_hint.enable(false, filter)
							-- create a single use autocommand to turn the inlay hints back on
							-- when leaving insert mode
							vim.api.nvim_create_autocmd("InsertLeave", {
								buffer = args.buf,
								once = true,
								callback = function()
									vim.lsp.inlay_hint.enable(true, filter)
								end,
							})
						end
					end,
				},
			},
		},
	},
}
