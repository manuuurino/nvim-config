local keymaps = {
	["<c-f>"] = {
		function()
			if not require("noice.lsp").scroll(4 * vim.count1()) then
				return "<c-f>"
			end
		end,
		desc = "Scroll through lsp hover doc forwards",
		expr = true,
		silent = true,
	},
	["<c-b>"] = {
		function()
			if not require("noice.lsp").scroll(-4 * vim.count1()) then
				return "<c-b>"
			end
		end,
		desc = "Scroll through lsp hover doc backwards",
		expr = true,
		silent = true,
	},
}

local mappings = {
	n = keymaps,
	i = keymaps,
	s = keymaps,
}

---@type LazySpec
return {
	{ import = "astrocommunity.utility.noice-nvim" },
	{
		"folke/noice.nvim",
		dependencies = {
			{
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
			{
				"AstroNvim/astrocore",
				---@type AstroCoreOpts
				opts = {
					mappings = mappings,
				},
			},
		},
		---@type NoiceConfig
		opts = {
			cmdline = {
				view = "cmdline",
			},
			lsp = {
				signature = { enabled = true },
				hover = { enabled = true },
			},
			presets = {
				lsp_doc_border = true,
			},
			-- credits: https://code.mehalter.com/AstroNvim_user/~files/b9d13b6af65fa7c6ec271063355b4625af93b52e/lua/plugins/noice.lua
			routes = {
				{
					-- send lua output to split
					filter = { event = "msg_show", cmdline = "^:lua" },
					view = "messages",
				},
				{
					-- send long messages to split
					filter = { event = "msg_show", min_height = 20 },
					view = "messages",
				},
				{
					-- skip save notifications
					filter = { event = "msg_show", find = "%d+L,%s%d+B" },
					opts = { skip = true },
				},
				{
					-- skip paste notifications
					filter = { event = "msg_show", find = "^%d+ more lines$" },
					opts = { skip = true },
				},
				{
					-- skip delete notifications
					filter = { event = "msg_show", find = "^%d+ fewer lines$" },
					opts = { skip = true },
				},
				{
					-- skip yank notifications
					filter = { event = "msg_show", find = "^%d+ lines yanked$" },
					opts = { skip = true },
				},
			},
		},
	},
}
