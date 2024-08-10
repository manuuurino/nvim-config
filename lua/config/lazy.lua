-- inspired by https://github.com/LunarVim/Launch.nvim/blob/0235c4b5f2d44c2e2fe025dc996dd79c68c73c84/init.lua
local spec_util = require("util.spec")
local spec, spec_if, astrocommunity =
	spec_util.spec, spec_util.spec_if, spec_util.astrocommunity
local is_on_glibc = require("util.checks").is_on_glibc
require("lazy").setup({
	spec = {
		{
			"AstroNvim/AstroNvim",
			version = "^v4",
			import = "astronvim.plugins",
			opts = {
				pin_plugins = nil, -- Default will pin plugins when tracking `version` of AstroNvim, set to true/false to override
				update_notifications = true, -- Enable/disable notification about running `:Lazy update` twice to update pinned plugins
			},
		},

		{ "AstroNvim/astrocommunity" },
		-- { dir = "~/Dev/contribute/AstroNvim/astrocommunity" },

		spec("plugins.astronvim.alpha-nvim"),
		spec("plugins.astronvim.astrotheme"),
		spec("plugins.astronvim.gitsigns-nvim"),
		spec("plugins.astronvim.heirline-nvim"),
		spec("plugins.astronvim.indent-blankline-nvim"),
		spec("plugins.astronvim.neo-tree-nvim"),
		spec("plugins.astronvim.nvim-cmp"),
		spec("plugins.astronvim.nvim-notify"),
		spec("plugins.astronvim.nvim-treesitter"),
		spec("plugins.astronvim.nvim-ufo"),
		spec("plugins.astronvim.telescope-nvim"),
		spec("plugins.astronvim.todo-comments-nvim"),
		spec("plugins.astronvim.disable.nvim-autopairs"),
		spec("plugins.astronvim.disable.better-escape-nvim"),
		-- spec("plugins.astronvim.disable.mason-lspconfig-nvim"),
		-- spec("plugins.astronvim.disable.mason-nvim-dap-nvim"),
		-- NOTE: because of conform-nvim and nvim-lint, we disable these
		spec("plugins.astronvim.disable.mason-null-ls-nvim"),
		spec("plugins.astronvim.disable.none-ls-nvim"),

		-- astrocommunity("code-runner", "sniprun"),
		-- astrocommunity("color", "nvim-highlight-colors"), -- NOTE: heavly slows the buffer on many color displays
		astrocommunity("completion", "cmp-calc"),
		astrocommunity("completion", "cmp-cmdline"),
		astrocommunity("completion", "cmp-emoji"),
		astrocommunity("completion", "cmp-nerdfont"),
		astrocommunity("completion", "cmp-under-comparator"),
		spec_if(
			astrocommunity("completion", "codeium-nvim"),
			vim.g.codeium_native_plugin and is_on_glibc()
		),
		spec_if(
			astrocommunity("completion", "codeium-vim"),
			not vim.g.codeium_native_plugin and is_on_glibc()
		),
		astrocommunity("colorsheme", "catppuccin"),
		-- astrocommunity("colorsheme", "dracula-nvim"),
		-- astrocommunity("colorsheme", "gruvbox-nvim"),
		-- astrocommunity("colorsheme", "kanagawa-nvim"),
		-- astrocommunity("colorsheme", "monokai-pro-nvim"),
		-- astrocommunity("colorsheme", "onedarkpro-nvim"),
		-- astrocommunity("colorsheme", "oxocarbon-nvim"),
		-- astrocommunity("colorsheme", "tokyonight-nvim"),
		astrocommunity("debugging", "nvim-dap-virtual-text"),
		astrocommunity("debugging", "persistent-breakpoints-nvim"),
		astrocommunity("diagnostics", "trouble-nvim"),
		astrocommunity("editing-support", "bigfile-nvim"),
		astrocommunity("editing-support", "chatgpt-nvim"),
		astrocommunity("editing-support", "conform-nvim"),
		astrocommunity("editing-support", "mini-operators"),
		astrocommunity("editing-support", "mini-splitjoin"),
		-- astrocommunity("editing-support", "nvim-context-vt"),
		-- astrocommunity("editing-support", "nvim-treesitter-context"), -- NOTE: slows kinda the buffer
		-- astrocommunity("editing-support", "nvim-treesitter-endwise"),
		astrocommunity("editing-support", "rainbow-delimiters-nvim"),
		astrocommunity("editing-support", "refactoring-nvim"),
		astrocommunity("editing-support", "suda-vim"),
		astrocommunity("editing-support", "zen-mode-nvim"),
		astrocommunity("editing-support", "undotree"),
		astrocommunity("editing-support", "vim-move"),
		astrocommunity("file-explorer", "oil-nvim"),
		astrocommunity("git", "blame-nvim"),
		astrocommunity("git", "diffview-nvim"),
		astrocommunity("lsp", "actions-preview-nvim"),
		astrocommunity("lsp", "garbage-day-nvim"),
		-- astrocommunity("lsp", "inc-rename-nvim"),
		-- astrocommunity("lsp", "lsp-signature-nvim"),
		astrocommunity("lsp", "nvim-lint"),
		astrocommunity("markdown-and-latex", "peek-nvim"),
		astrocommunity("motion", "flash-nvim"),
		astrocommunity("motion", "mini-surround"),
		-- TODO: remove the cond for packs
		-- astrocommunity("pack", "angular"),
		-- astrocommunity("pack", "ansible"),
		astrocommunity("pack", "bash"),
		-- astrocommunity("pack", "cmake"),
		-- astrocommunity("pack", "cpp"),
		-- astrocommunity("pack", "cs"),
		astrocommunity("pack", "docker"),
		astrocommunity("pack", "fish"),
		-- astrocommunity("pack", "html-css"),
		-- astrocommunity("pack", "java"),
		astrocommunity("pack", "json"),
		-- astrocommunity("pack", "kotlin"),
		astrocommunity("pack", "lua"),
		astrocommunity("pack", "markdown"),
		-- astrocommunity("pack", "nix"),
		-- astrocommunity("pack", "ps1"),
		astrocommunity("pack", "python"),
		astrocommunity("pack", "rust"),
		-- astrocommunity("pack", "sql"),
		astrocommunity("pack", "toml"),
		-- astrocommunity("pack", "typescript-all-in-one"),
		astrocommunity("pack", "yaml"),
		-- astrocommunity("programming-language-support", "csv-vim"),
		-- astrocommunity("programming-language-support", "nvim-jqx"),
		-- astrocommunity("search", "nvim-spectre"), -- NOTE: disabled for `grug-far-nvim`
		astrocommunity("recipes", "astrolsp-no-insert-inlay-hints"),
		astrocommunity("recipes", "neovide"),
		astrocommunity("recipes", "telescope-nvchad-theme"),
		astrocommunity("recipes", "vscode-icons"),
		astrocommunity("register", "nvim-neoclip-lua"),
		astrocommunity("project", "project-nvim"),
		-- astrocommunity("scrolling", "nvim-scrollbar"),
		astrocommunity("utility", "mason-tool-installer-nvim"),
		astrocommunity("utility", "noice-nvim"),
		-- astrocommunity("editing-support", "dial-nvim"),
		astrocommunity("quickfix", "nvim-bqf"),

		-- TODO: rework the snippets

		spec("plugins.user.dial-nvim"),
		-- spec("plugins.user.hlchunk-nvim"), -- NOTE: will disable `indent-blankline-nvim`
		-- spec("plugins.user.semshi"),
		spec("plugins.user.twilight-nvim"),
		-- spec("plugins.user.grug-far-nvim"),

		spec("user.colorscheme"),
		spec("user.astrocore"),
		spec("user.astrolsp"),
		spec("user.astroui"),
		spec_if(
			spec("user.adopt-lazyvim-mappings"),
			vim.g.adopt_lazyvim_mappings
		),
		spec("user.mappings"),
		spec("user.mason"),
		spec("user.none-ls"),
		spec("user.treesitter"),

		spec("user.highlights.industry"),
		spec("user.highlights.kanagawa"),
	},
	install = { colorscheme = { "astrodark", "habamax" } },
	ui = {
		backdrop = 80,
		border = "rounded",
	},
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"zipPlugin",
				"tutor",
			},
		},
	},
})
