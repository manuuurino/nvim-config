local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.g.astronvim_first_install = true -- lets AstroNvim know that this is an initial installation
	-- stylua: ignore
	vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

-- inspired by https://github.com/LunarVim/Launch.nvim/blob/0235c4b5f2d44c2e2fe025dc996dd79c68c73c84/init.lua
local spec = require("util.helper").spec

require("lazy").setup({
	spec = {
		-- TODO: change `branch="v4"` to `version="^4"` on release
		{ "AstroNvim/AstroNvim", branch = "v4", import = "astronvim.plugins" },

		-- TODO: Remove branch v4 on release
		{ "AstroNvim/astrocommunity", branch = "v4" },

		spec("plugins.astronvim.alpha-nvim"),
		spec("plugins.astronvim.astrotheme"),
		spec("plugins.astronvim.colorscheme"),
		spec("plugins.astronvim.gitsigns"),
		spec("plugins.astronvim.highlights"),
		spec("plugins.astronvim.lsp"),
		spec("plugins.astronvim.mappings"),
		spec("plugins.astronvim.mason"),
		spec("plugins.astronvim.mini-indentscope"),
		spec("plugins.astronvim.neo-tree"),
		spec("plugins.astronvim.none-ls"),
		spec("plugins.astronvim.nvim-cmp"),
		spec("plugins.astronvim.nvim-treesitter"),
		spec("plugins.astronvim.nvim-ufo"),
		spec("plugins.astronvim.telescope"),
		spec("plugins.astronvim.treesitter"),

		-- TODO: seems interesting, does also include vscode tasks https://github.com/stevearc/overseer.nvim
		-- TODO: neogen and implement like this: https://code.mehalter.com/AstroNvim_user/~files/v4/lua/plugins/neogen.lua
		-- { import = "plugins.astrocommunity" },

		spec("plugins.astrocommunity.code-runner.sniprun"),
		spec("plugins.astrocommunity.color.headlines-nvim"),
		spec("plugins.astrocommunity.colorsheme.catppuccin"),
		spec("plugins.astrocommunity.colorsheme.dracula-nvim"),
		spec("plugins.astrocommunity.colorsheme.gruvbox-nvim"),
		spec("plugins.astrocommunity.colorsheme.kanagawa-nvim"),
		spec("plugins.astrocommunity.colorsheme.monokai-pro-nvim"),
		spec("plugins.astrocommunity.colorsheme.onedarkpro-nvim"),
		spec("plugins.astrocommunity.colorsheme.oxocarbon-nvim"),
		spec("plugins.astrocommunity.debugging.nvim-dap-virtual-text"),
		spec("plugins.astrocommunity.debugging.persistent-breakpoints-nvim"),
		spec("plugins.astrocommunity.diagnostics.trouble-nvim"),
		spec("plugins.astrocommunity.editing-support.mini-splitjoin"),
		spec("plugins.astrocommunity.editing-support.nvim-treesitter-endwise"),
		spec("plugins.astrocommunity.editing-support.rainbow-delimiters-nvim"),
		spec("plugins.astrocommunity.editing-support.refactoring-nvim"),
		spec("plugins.astrocommunity.editing-support.suda-vim"),
		spec("plugins.astrocommunity.editing-support.true-zen-nvim"),
		spec("plugins.astrocommunity.editing-support.vim-move"),
		spec("plugins.astrocommunity.file-explorer.oil-nvim"),
		spec("plugins.astrocommunity.git.blame-nvim"),
		spec("plugins.astrocommunity.lsp.inc-rename-nvim"),
		spec("plugins.astrocommunity.lsp.lsp-inlayhints-nvim"),
		spec("plugins.astrocommunity.markdown-and-latex.peek-nvim"),
		spec("plugins.astrocommunity.motion.flash-nvim"),
		spec("plugins.astrocommunity.motion.mini-surround"),
		spec("plugins.astrocommunity.pack.angular"),
		spec("plugins.astrocommunity.pack.ansible"),
		spec("plugins.astrocommunity.pack.bash"),
		spec("plugins.astrocommunity.pack.cmake"),
		spec("plugins.astrocommunity.pack.cpp"),
		spec("plugins.astrocommunity.pack.cs"),
		spec("plugins.astrocommunity.pack.docker"),
		spec("plugins.astrocommunity.pack.html-css"),
		spec("plugins.astrocommunity.pack.json"),
		spec("plugins.astrocommunity.pack.lua"),
		spec("plugins.astrocommunity.pack.markdown"),
		spec("plugins.astrocommunity.pack.nix"),
		spec("plugins.astrocommunity.pack.ps1"),
		spec("plugins.astrocommunity.pack.python"),
		spec("plugins.astrocommunity.pack.rust"),
		spec("plugins.astrocommunity.pack.toml"),
		spec("plugins.astrocommunity.pack.typescript-all-in-one"),
		spec("plugins.astrocommunity.pack.yaml"),
		spec("plugins.astrocommunity.programming-language-support.csv-vim"),
		spec("plugins.astrocommunity.programming-language-support.nvim-jqx"),
		spec("plugins.astrocommunity.project.nvim-spectre"),
		spec("plugins.astrocommunity.project.project"),
		spec("plugins.astrocommunity.register.nvim-neoclip-lua"),
		spec("plugins.astrocommunity.scrolling.nvim-scrollbar"),
		spec("plugins.astrocommunity.split-and-window.windows-nvim"),
		spec("plugins.astrocommunity.utility.noice-nvim"),

		-- TODO: might wanna install https://github.com/mg979/vim-visual-multi
		-- TODO: could replace neo-tree and oil with this https://github.com/kevinhwang91/rnvimr

		spec("plugins.user.actions-preview"),
		spec("plugins.user.chatgpt"),
		spec("plugins.user.codeium"),
		spec("plugins.user.garbage-day"),
		spec("plugins.user.mini-operators"),
		spec("plugins.user.nvim-treesitter-context"),
		spec("plugins.user.todo-comments"),
		spec("plugins.user.undotree"),

		spec("user.colorscheme"),
		spec("user.astrocore"),
		spec("user.lsp"),
		spec("user.mappings"),
		spec("user.mason"),
		spec("user.none-ls"),
		spec("user.treesitter"),
		spec("user.ui"),

		spec("user.highlights.astodark"),
		spec("user.highlights.industry"),
		spec("user.highlights.default"),
		spec("user.highlights.kanagawa"),
	},
	install = { colorscheme = { "astrodark", "habamax" } },
	performance = {
		rtp = {
			-- disable some rtp plugins, add more to your liking
			disabled_plugins = {
				"gzip",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"zipPlugin",
			},
		},
	},
})
