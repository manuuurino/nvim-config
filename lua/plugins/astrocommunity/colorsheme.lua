---@type LazySpec
return {
	-- TODO: load colorschemes when they are needed, e.g. browsing the themes

	{ import = "astrocommunity.colorscheme.catppuccin" },
	{ "catppuccin/nvim", name = "catppuccin", event = "VeryLazy" },

	{ import = "astrocommunity.colorscheme.monokai-pro-nvim" },
	{ "loctvl842/monokai-pro.nvim", event = "VeryLazy" },

	{ import = "astrocommunity.colorscheme.dracula-nvim" },
	{ "Mofiqul/dracula.nvim", event = "VeryLazy" },

	{ import = "astrocommunity.colorscheme.gruvbox-nvim" },
	{ "ellisonleao/gruvbox.nvim", event = "VeryLazy" },

	{ import = "astrocommunity.colorscheme.onedarkpro-nvim" },
	{ "olimorris/onedarkpro.nvim", event = "VeryLazy" },

	{ import = "astrocommunity.colorscheme.oxocarbon-nvim" },
	{ "nyoom-engineering/oxocarbon.nvim", event = "VeryLazy" },

	{ import = "astrocommunity.colorscheme.kanagawa-nvim" },
	{ "rebelot/kanagawa.nvim", event = "VeryLazy" },
}
