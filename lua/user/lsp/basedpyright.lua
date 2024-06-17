---@type LazySpec
return {
	{
		"williamboman/mason-lspconfig.nvim",
		optional = true,
		opts = function(_, opts)
			opts.ensure_installed = require("astrocore").list_insert_unique(
				opts.ensure_installed,
				{ "basedpyright" }
			)
			opts.ensure_installed = vim.tbl_filter(function(v)
				return not vim.tbl_contains({ "pyright" }, v)
			end, opts.ensure_installed)
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		optional = true,
		opts = function(_, opts)
			opts.ensure_installed = require("astrocore").list_insert_unique(
				opts.ensure_installed,
				{ "basedpyright" }
			)
			opts.ensure_installed = vim.tbl_filter(function(v)
				return not vim.tbl_contains({ "pyright" }, v)
			end, opts.ensure_installed)
		end,
	},
	{
		"AstroNvim/astrolsp",
		---@type AstroLSPOpts
		opts = {
			---@diagnostic disable-next-line: missing-fields
			config = {
				basedpyright = {
					before_init = function(_, c)
						if not c.settings then c.settings = {} end
						if not c.settings.python then c.settings.python = {} end
						c.settings.python.pythonPath = vim.fn.exepath("python")
					end,
					settings = {
						basedpyright = {
							analysis = {
								-- diagnosticMode = "workspace",
								diagnosticMode = "openFilesOnly",
								typeCheckingMode = "basic",
								autoImportCompletions = true,
								autoSearchPath = true,
								inlayHints = {
									variableTypes = true,
									functionReturnTypes = true,
									callArgumentNames = true,
									pytestParameters = true,
								},
								useLibraryCodeForTypes = true,
								diagnosticSeverityOverrides = {
									reportUnusedImport = "information",
									reportUnusedFunction = "information",
									reportUnusedVariable = "information",
									-- reportGeneralTypeIssues = "none",
									-- reportOptionalMemberAccess = "none",
									-- reportOptionalSubscript = "none",
									-- reportPrivateImportUsage = "none",
								},
							},
						},
					},
				},
			},
		},
	},
}
