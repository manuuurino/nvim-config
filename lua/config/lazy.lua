local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.g.astronvim_first_install = true -- lets AstroNvim know that this is an initial installation
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
	spec = {
		-- TODO: change `branch="v4"` to `version="^4"` on release
		{ "AstroNvim/AstroNvim", branch = "v4", import = "astronvim.plugins" },

		-- TODO: Remove branch v4 on release
		{ "AstroNvim/astrocommunity", branch = "v4" },

		{ import = "plugins.astronvim" },

		-- TODO: seems interesting, does also include vscode tasks https://github.com/stevearc/overseer.nvim
		-- TODO: neogen and implement like this: https://code.mehalter.com/AstroNvim_user/~files/v4/lua/plugins/neogen.lua
		{ import = "plugins.astrocommunity" },

		-- TODO: might wanna install https://github.com/mg979/vim-visual-multi
		-- TODO: could replace neo-tree with this https://github.com/kevinhwang91/rnvimr
		{ import = "plugins.user" },

		{ import = "user" },
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
