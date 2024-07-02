-- inspired by https://github.com/LunarVim/Launch.nvim/blob/0235c4b5f2d44c2e2fe025dc996dd79c68c73c84/init.lua
local spec_util = require("util.spec")
local spec, spec_if, astrocommunity =
	spec_util.spec, spec_util.spec_if, spec_util.astrocommunity

-- TODO: do some perf shit, i think some pluings slow shit down
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
		spec("plugins.astronvim.disable.better-escape-nvim"),
		-- spec("plugins.astronvim.disable.mason-lspconfig-nvim"),
		-- spec("plugins.astronvim.disable.mason-nvim-dap-nvim"),
		-- NOTE: because of conform-nvim and nvim-lint, we disable these
		spec("plugins.astronvim.disable.mason-null-ls-nvim"),
		spec("plugins.astronvim.disable.none-ls-nvim"),

		-- TODO: seems interesting, does also include vscode tasks https://github.com/stevearc/overseer.nvim
		-- TODO: neogen and implement like this: https://code.mehalter.com/AstroNvim_user/~files/v4/lua/plugins/neogen.lua

		astrocommunity("code-runner", "sniprun"),
		astrocommunity("color", "nvim-highlight-colors"),
		astrocommunity("completion", "cmp-calc"),
		astrocommunity("completion", "cmp-emoji"),
		astrocommunity("completion", "cmp-cmdline"),
		astrocommunity("completion", "cmp-under-comparator"),
		-- astrocommunity("completion", "cmp-nerdfont"), -- TODO: https://github.com/AstroNvim/astrocommunity/pull/1074
		astrocommunity("colorsheme", "catppuccin"),
		astrocommunity("colorsheme", "dracula-nvim"),
		astrocommunity("colorsheme", "gruvbox-nvim"),
		astrocommunity("colorsheme", "kanagawa-nvim"),
		astrocommunity("colorsheme", "monokai-pro-nvim"),
		astrocommunity("colorsheme", "onedarkpro-nvim"),
		astrocommunity("colorsheme", "oxocarbon-nvim"),
		astrocommunity("debugging", "nvim-bqf"),
		astrocommunity("debugging", "nvim-dap-virtual-text"),
		astrocommunity("debugging", "persistent-breakpoints-nvim"),
		astrocommunity("diagnostics", "trouble-nvim"),
		astrocommunity("editing-support", "bigfile-nvim"),
		astrocommunity("editing-support", "chatgpt-nvim"),
		astrocommunity("editing-support", "conform-nvim"),
		astrocommunity("editing-support", "mini-operators"),
		astrocommunity("editing-support", "mini-splitjoin"),
		-- astrocommunity("editing-support", "nvim-context-vt"),
		astrocommunity("editing-support", "nvim-treesitter-context"),
		astrocommunity("editing-support", "nvim-treesitter-endwise"),
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
		astrocommunity("lsp", "inc-rename-nvim"),
		astrocommunity("lsp", "nvim-lint"),
		astrocommunity("markdown-and-latex", "peek-nvim"),
		astrocommunity("motion", "flash-nvim"),
		astrocommunity("motion", "mini-surround"),
		astrocommunity("neovim-lua-development", "lazydev-nvim"),
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
		astrocommunity("programming-language-support", "csv-vim"),
		astrocommunity("programming-language-support", "nvim-jqx"),
		-- NOTE: disabled for `grug-far-nvim`
		-- astrocommunity("project", "nvim-spectre"),
		astrocommunity("project", "project-nvim"),
		astrocommunity("recipes", "neovide"),
		astrocommunity("recipes", "telescope-nvchad-theme"),
		astrocommunity("recipes", "vscode-icons"),
		astrocommunity("register", "nvim-neoclip-lua"),
		astrocommunity("scrolling", "nvim-scrollbar"),
		astrocommunity("utility", "mason-tool-installer-nvim"),
		astrocommunity("utility", "noice-nvim"),

		-- TODO: might wanna install https://github.com/mg979/vim-visual-multi
		-- TODO: rework the snippets

		spec("plugins.user.chatgpt-nvim"),
		spec("plugins.user.codeium-nvim"),
		spec("plugins.user.codeium-vim"),
		spec("plugins.user.dial-nvim"),
		-- NOTE: will disable `indent-blankline-nvim`
		-- spec("plugins.user.hlchunk-nvim"),
		spec("plugins.user.semshi"),
		spec("plugins.user.twilight-nvim"),
		spec("plugins.user.lsp-signature-nvim"),
		spec("plugins.user.grug-far-nvim"),

		spec("user.lsp.basedpyright"),

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
