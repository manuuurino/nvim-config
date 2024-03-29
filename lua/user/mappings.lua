---@type LazySpec
return {
	"AstroNvim/astrocore",
	---@type AstroCoreOpts
	opts = {
		mappings = {
			n = {
				-- navigate buffer tabs with `H` and `L`
				["L"] = {
					function()
						require("astrocore.buffer").nav(vim.v.count1)
					end,
					desc = "Next buffer",
				},
				["H"] = {
					function()
						require("astrocore.buffer").nav(-vim.v.count1)
					end,
					desc = "Previous buffer",
				},

				-- credits: https://github.com/t1gu1/astrovim-config/blob/5a1d7bd4933f8192de027071d62f953b4c831af3/mappings.lua#L74-L77
				["<Leader>pc"] = {
					function()
						vim.cmd.edit(vim.fn.stdpath("config"))
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
				["Q"] = { "nop" },

				-- yank to system clipboard
				["<Leader>y"] = { '"+y', desc = "Yank to system clipboard" },
				["gp"] = { '"+p', desc = "Paste from system clipboard" },
				["gP"] = { '"+P', desc = "Paste from system clipboard" },

				["<Leader>."] = {
					function()
						vim.cmd.cd("%:p:h")
						vim.notify(
							"current working directory set to:\n"
								.. vim.fn.getcwd()
						)
					end,
					desc = "Set CWD",
				},

				-- credits: https://github.com/LazyVim/LazyVim/blob/2a8bfccc3ef4020a30654b3dee1ffac51e4f64f3/lua/lazyvim/config/keymaps.lua#L42
				["<esc>"] = {
					"<cmd>noh<cr><esc>",
					desc = "Escape and Clear hlsearch",
				},
			},
			x = {
				["<Leader>y"] = { '"+y', desc = "Yank to system clipboard" },
				["gp"] = { '"+p', desc = "Paste from system clipboard" },
				["gP"] = { '"+P', desc = "Paste from system clipboard" },
			},
		},
	},
}
