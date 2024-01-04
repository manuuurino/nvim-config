return {
	-- customize alpha options
	-- {
	--   "goolord/alpha-nvim",
	--   opts = function(_, opts)
	--     -- customize the dashboard header
	--     opts.section.header.val = {
	--       " █████  ███████ ████████ ██████   ██████",
	--       "██   ██ ██         ██    ██   ██ ██    ██",
	--       "███████ ███████    ██    ██████  ██    ██",
	--       "██   ██      ██    ██    ██   ██ ██    ██",
	--       "██   ██ ███████    ██    ██   ██  ██████",
	--       " ",
	--       "    ███    ██ ██    ██ ██ ███    ███",
	--       "    ████   ██ ██    ██ ██ ████  ████",
	--       "    ██ ██  ██ ██    ██ ██ ██ ████ ██",
	--       "    ██  ██ ██  ██  ██  ██ ██  ██  ██",
	--       "    ██   ████   ████   ██ ██      ██",
	--     }
	--     return opts
	--   end,
	-- },

	-- You can disable default plugins as follows:
	-- { "max397574/better-escape.nvim", enabled = false },

	-- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
	-- {
	--   "L3MON4D3/LuaSnip",
	--   config = function(plugin, opts)
	--     require "plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
	--     -- add more custom luasnip configuration such as filetype extend or custom snippets
	--     local luasnip = require "luasnip"
	--     luasnip.filetype_extend("javascript", { "javascriptreact" })
	--   end,
	-- },
	-- {
	--   "windwp/nvim-autopairs",
	--   config = function(plugin, opts)
	--     require "plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
	--     -- add more custom autopairs configuration such as custom rules
	--     local npairs = require "nvim-autopairs"
	--     local Rule = require "nvim-autopairs.rule"
	--     local cond = require "nvim-autopairs.conds"
	--     npairs.add_rules(
	--       {
	--         Rule("$", "$", { "tex", "latex" })
	--           -- don't add a pair if the next character is %
	--           :with_pair(cond.not_after_regex "%%")
	--           -- don't add a pair if  the previous character is xxx
	--           :with_pair(
	--             cond.not_before_regex("xxx", 3)
	--           )
	--           -- don't move right when repeat character
	--           :with_move(cond.none())
	--           -- don't delete if the next character is xx
	--           :with_del(cond.not_after_regex "xx")
	--           -- disable adding a newline when you press <cr>
	--           :with_cr(cond.none()),
	--       },
	--       -- disable for .vim files, but it work for another filetypes
	--       Rule("a", "a", "-vim")
	--     )
	--   end,
	-- },
	{
		"echasnovski/mini.indentscope",
		event = "User AstroFile",
		-- -@type ibl.indent_options
		opts = function(_, opts)
			opts.symbol = require("astroui").get_icon("IndentScope")
		end,
		dependencies = {
			"lukas-reineke/indent-blankline.nvim",
			event = "User AstroFile",
			---@param opts ibl.indent_options
			opts = function(_, opts)
				-- stylua: ignore
				---@diagnostic disable-next-line
				opts.indent.tab_char = require("astroui").get_icon("IndentScope")
				---@diagnostic disable-next-line
				opts.indent.char = require("astroui").get_icon("IndentScope")
			end,
			dependencies = "AstroNvim/astroui",
		},
	},
}
