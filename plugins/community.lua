-- TODO: customize statusbar, show stats? and diable lsp status, bcs noice; also show current venv

---@type LazySpec[]
local community_plugins = {
	"AstroNvim/astrocommunity",
}

---@param plugins LazySpec[]
local function add(plugins)
	for _, plugin in ipairs(plugins) do
		table.insert(community_plugins, plugin)
	end
end

local dependencies = require("user.utils.dependencies")
local has_excecutable = dependencies.has_excecutable
local is_on_alpine = dependencies.is_on_alpine
local icons = require("user.icons")

local astronvim_utils = require("astronvim.utils")
local set_mappings = astronvim_utils.set_mappings
local extend_tbl = astronvim_utils.extend_tbl

-- seperating into sections so it is more readable

add({
	{ import = "astrocommunity.code-runner.sniprun" },
	{
		"michaelb/sniprun",
		opts = {
			display = {
				"Terminal",
			},
		},
		init = function(_)
			local prefix = "<leader>R"

			local key_mappings = {
				[prefix] = {
					name = "SnipRun",
				},
			}

			set_mappings({
				n = extend_tbl(key_mappings, {
					[prefix .. "r"] = {
						function()
							require("sniprun").run("w")
						end,
						desc = "run file",
					},
				}),
				v = extend_tbl(key_mappings, {
					[prefix .. "r"] = {
						function()
							require("sniprun").run("v")
						end,
						desc = "run selection",
					},
				}),
			})
		end,
	},
})

add({
	--inspired by: https://github.com/chaozwn/astronvim_with_coc_or_mason/blob/4a59dea217ae9c931764bea64b2085c0a9a8e27c/plugins/community-pack.lua#L2
	{
		import = "astrocommunity.pack.angular",
		cond = has_excecutable("npm"),
	},
	{
		import = "astrocommunity.pack.ansible",
		cond = has_excecutable("npm") and has_excecutable("python3"),
	},
	{
		import = "astrocommunity.pack.bash",
		cond = has_excecutable("npm"),
	},
	{
		import = "astrocommunity.pack.cmake",
		cond = has_excecutable("cargo"),
	},
	{
		-- NOTE: even if these dependencies have been installed in alpine, mason doesnt want to install clangd or codelldb
		--       theres also an issue about it. https://github.com/williamboman/mason.nvim/issues/1402
		import = "astrocommunity.pack.cpp",
		cond = not is_on_alpine()
			and has_excecutable("unzip")
			and (
				has_excecutable("cc")
				or has_excecutable("gcc")
				or has_excecutable("clangd")
				or has_excecutable("cl")
				or has_excecutable("zig")
			),
	},
	{
		import = "astrocommunity.pack.cs",
		cond = has_excecutable("dotnet"),
	},
	{
		import = "astrocommunity.pack.docker",
		cond = has_excecutable("npm"),
	},
	{
		import = "astrocommunity.pack.html-css",
		cond = has_excecutable("npm"),
	},
	{
		import = "astrocommunity.pack.json",
		cond = has_excecutable("npm"),
	},
	{
		import = "astrocommunity.pack.lua",
		-- NOTE: needs luarocks for stylua, also luacheck is unsupported on alpine.
		--       yet have it commented so alpine has a ls atleast
		-- cond = has_excecutable("luarocks"),
	},
	{
		import = "astrocommunity.pack.markdown",
		cond = has_excecutable("npm"),
	},
	{
		import = "astrocommunity.pack.ps1",
		cond = has_excecutable("npm"),
	},
	{
		import = "astrocommunity.pack.python",
		cond = has_excecutable("npm") and has_excecutable("python3"),
	},
	{
		import = "astrocommunity.pack.rust",
		cond = has_excecutable("unzip") and has_excecutable("cargo"),
	},
	{
		import = "astrocommunity.pack.toml",
		cond = has_excecutable("npm"),
	},
	{
		import = "astrocommunity.pack.typescript-all-in-one",
		cond = has_excecutable("deno"),
	},
	{
		import = "astrocommunity.pack.yaml",
		cond = has_excecutable("npm"),
	},
	{
		import = "astrocommunity.pack.nix",
		cond = has_excecutable("cargo"),
	},
})

add({
	{ import = "astrocommunity.color.headlines-nvim" },
})

add({
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
})

add({
	{ import = "astrocommunity.debugging.nvim-dap-virtual-text" },
	{ import = "astrocommunity.debugging.persistent-breakpoints-nvim" },
})

add({
	{ import = "astrocommunity.diagnostics.trouble-nvim" },
	{
		"folke/trouble.nvim",
		---@type TroubleOptions
		opts = {
			fold_open = icons.expander_expanded,
			fold_closed = icons.expander_collapsed,
		},
	},
})

add({
	-- TODO: keymap toggle autosave, maybe also change behaviour?
	-- { import = "astrocommunity.editing-support.auto-save-nvim" },

	{ import = "astrocommunity.editing-support.nvim-treesitter-endwise" },

	{ import = "astrocommunity.editing-support.rainbow-delimiters-nvim" },
	{
		"HiPhish/rainbow-delimiters.nvim",
		---@type rainbow_delimiters.config
		opts = {
			highlight = {
				-- "RainbowDelimiterRed",
				"RainbowDelimiterCyan",
				"RainbowDelimiterViolet",
				"RainbowDelimiterYellow",
				-- "RainbowDelimiterBlue",
				-- "RainbowDelimiterOrange",
				-- "RainbowDelimiterGreen",
			},
		},
	},
	{ import = "astrocommunity.editing-support.refactoring-nvim" },
	{ import = "astrocommunity.editing-support.suda-vim" },
	{ import = "astrocommunity.editing-support.mini-splitjoin" },
	{ import = "astrocommunity.editing-support.true-zen-nvim" },
	{ import = "astrocommunity.editing-support.vim-move" },
})

add({
	{ import = "astrocommunity.git.blame-nvim" },
	{
		"FabijanZulj/blame.nvim",
		keys = {
			{
				"<leader>gB",
				"<cmd>ToggleBlame<cr>",
				desc = "Toggle git blame",
			},
		},
	},
})

add({
	{ import = "astrocommunity.lsp.lsp-signature-nvim" },
	{
		"ray-x/lsp_signature.nvim",
		opts = {
			noice = true,
		},
	},
	{ import = "astrocommunity.lsp.lsp-inlayhints-nvim" },
})

add({
	{
		import = "astrocommunity.markdown-and-latex.peek-nvim",
		cond = has_excecutable("deno"),
	},
})

add({
	{ import = "astrocommunity.motion.flash-nvim" },
	{ import = "astrocommunity.motion.mini-surround" },
})

add({
	{ import = "astrocommunity.programming-language-support.csv-vim" },
	{ import = "astrocommunity.programming-language-support.nvim-jqx" },
})

add({
	{ import = "astrocommunity.project.nvim-spectre" },
	{ import = "astrocommunity.project.project-nvim" },
	{
		"ahmedkhalf/project.nvim",
		init = function()
			set_mappings({
				n = {
					["<leader>fp"] = {
						"<cmd>Telescope projects<CR>",
						desc = "Open Projects",
					},
				},
			})
		end,
	},
})

add({
	{ import = "astrocommunity.register.nvim-neoclip-lua" },
})

add({
	{ import = "astrocommunity.scrolling.nvim-scrollbar" },
})

add({
	{ import = "astrocommunity.split-and-window.windows-nvim" },
})

add({
	{ import = "astrocommunity.utility.noice-nvim" },
	{
		"folke/noice.nvim",
		dependencies = {
			-- credits: https://github.com/Uzaaft/nvim/blob/6a61a2269b860d392b0115cbf80b0d8ad414ad01/lua/plugins/init.lua#L12C2-L22
			"rcarriga/nvim-notify",
			---@type notify.Config
			---@diagnostic disable-next-line: missing-fields
			opts = {
				timeout = 500,
				render = "wrapped-compact",
				stages = "slide",
				fps = 144,
				max_width = 70,
			},
		},
		---@type NoiceConfig
		opts = {
			lsp = {
				signature = { enabled = false },
				hover = { enabled = false },
			},
			-- credits: https://code.mehalter.com/AstroNvim_user/~files/b9d13b6af65fa7c6ec271063355b4625af93b52e/lua/plugins/noice.lua
			routes = {
				{
					filter = { event = "msg_show", cmdline = "^:lua" },
					view = "messages",
				}, -- send lua output to split
				{
					filter = { event = "msg_show", min_height = 20 },
					view = "messages",
				}, -- send long messages to split
				{
					filter = { event = "msg_show", find = "%d+L,%s%d+B" },
					opts = { skip = true },
				}, -- skip save notifications
				{
					filter = { event = "msg_show", find = "^%d+ more lines$" },
					opts = { skip = true },
				}, -- skip paste notifications
				{
					filter = { event = "msg_show", find = "^%d+ fewer lines$" },
					opts = { skip = true },
				}, -- skip delete notifications
				{
					filter = { event = "msg_show", find = "^%d+ lines yanked$" },
					opts = { skip = true },
				}, -- skip yank notifications
			},
		},
	},
})

return community_plugins
