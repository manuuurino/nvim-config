local is_available = require("astrocore").is_available

---@type LazySpec
return {
	{
		"AstroNvim/astrolsp",
		---@param opts AstroLSPOpts
		opts = {
			mappings = {
				n = {
					-- replace this with actions-preview.nvim
					-- ["<leader>la"] = false,
				},
			},
		},
	},
	{
		"AstroNvim/astrocore",
		---@type AstroCoreOpts
		opts = {
			mappings = {
				n = {
					-- navigate buffer tabs with `H` and `L`
					L = {
						function()
							require("astrocore.buffer").nav(
								vim.v.count > 0 and vim.v.count or 1
							)
						end,
						desc = "Next buffer",
					},
					H = {
						function()
							require("astrocore.buffer").nav(
								-(vim.v.count > 0 and vim.v.count or 1)
							)
						end,
						desc = "Previous buffer",
					},

					-- credits: https://github.com/t1gu1/astrovim-config/blob/5a1d7bd4933f8192de027071d62f953b4c831af3/mappings.lua#L74-L77
					["<leader>pc"] = {
						function()
							vim.cmd.edit(
								vim.fn.stdpath("config") .. "/lua/user/init.lua"
							)
							vim.cmd.cd("%:p:h")

							if is_available("neo-tree.nvim") then
								-- HACK: without this, the path will not change. why though?
								vim.cmd("Neotree")
							end
						end,
						desc = "Open AstroVim User Config",
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
					["gy"] = { '"+y', desc = "Yank to system clipboard" },
					["gp"] = { '"+p', desc = "Paste from system clipboard" },
					["gP"] = { '"+P', desc = "Paste from system clipboard" },

					["<leader>."] = {
						function()
							vim.cmd.cd("%:p:h")
							vim.notify(
								"current working directory set to:\n"
									.. vim.fn.getcwd()
							)
						end,
						desc = "Set CWD",
					},

					-- better increment/decrement
					["+"] = { "g<C-a>", desc = "Increment number" },
					["-"] = { "g<C-x>", desc = "Descrement number" },
				},
				x = {
					["gy"] = { '"+y', desc = "Yank to system clipboard" },
					["gp"] = { '"+p', desc = "Paste from system clipboard" },
					["gP"] = { '"+P', desc = "Paste from system clipboard" },

					-- better increment/decrement
					["+"] = { "g<C-a>", desc = "Increment number" },
					["-"] = { "g<C-x>", desc = "Descrement number" },
				},
			},
		},
	},
}
