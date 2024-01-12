local mappings = {
	n = {
		["<leader>o"] = false,

		-- better buffer navigation
		["]b"] = false,
		["[b"] = false,
		["<S-l>"] = {
			function()
				require("astronvim.utils.buffer").nav(
					vim.v.count > 0 and vim.v.count or 1
				)
			end,
			desc = "Next buffer",
		},
		["<S-h>"] = {
			function()
				require("astronvim.utils.buffer").nav(
					-(vim.v.count > 0 and vim.v.count or 1)
				)
			end,
			desc = "Previous buffer",
		},

		-- credits: https://github.com/t1gu1/astrovim-config/blob/5a1d7bd4933f8192de027071d62f953b4c831af3/mappings.lua#L74-L77
		["<leader>pc"] = {
			function()
				vim.cmd.edit(vim.fn.stdpath("config") .. "/lua/user/")
				vim.cmd.cd("%:p:h")
			end,
			desc = "Open AstroNvim User Config",
		},

		-- credits: https://github.com/ThePrimeagen/init.lua/blob/97c039bb88d8bbbcc9b1e3d0dc716a2ba202c6d2/lua/theprimeagen/remap.lua
		["J"] = { "mzJ`z" },
		["<C-d>"] = { "<C-d>zz", desc = "Scroll down" },
		["<C-u>"] = { "<C-u>zz", desc = "Scroll up" },
		["<C-o>"] = { "<C-o>zz", desc = "Jump backward" },
		["<C-i>"] = { "<C-i>zz", desc = "Jump forward" },
		["n"] = { "nzzzv" },
		["N"] = { "Nzzzv" },

		-- yank to system clipboard
		["<leader>y"] = { '"+y', desc = "Yank to system clipboard" },
		["<leader>Y"] = { '"+Y', desc = "Yank from system clipboard" },

		["<leader>r"] = { name = "Refactor" },

		-- credits: https://code.mehalter.com/AstroNvim_user/~files/91d8255ef1d901067621420b0e90e92f4ba8b0ee/mappings.lua?position=source-27.1-29.52-1
		-- better increment/decrement
		["-"] = { "<C-x>", desc = "Decrement number" },
		["+"] = { "<C-a>", desc = "Increment number" },

		["<leader>."] = {
			function()
				vim.cmd.cd("%:p:h")
				vim.notify(
					"current working directory set to:\n" .. vim.fn.getcwd()
				)
			end,
			desc = "Set CWD",
		},
	},
	x = {
		["<leader>y"] = { '"+y', desc = "Yank to system clipboard" },

		-- better increment/decrement
		["+"] = { "g<C-a>", desc = "Increment number" },
		["-"] = { "g<C-x>", desc = "Descrement number" },
	},
}

return mappings
