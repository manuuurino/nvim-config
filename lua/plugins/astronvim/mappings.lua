---@type LazySpec
return {
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

				["<leader>b"] = { desc = "Buffers" },
				["<leader>bD"] = {
					function()
						require("astroui.status.heirline").buffer_picker(
							function(bufnr)
								require("astrocore.buffer").close(bufnr)
							end
						)
					end,
					desc = "Pick to close",
				},
			},
			t = {
				-- setting a mapping to false will disable it
				-- ["<esc>"] = false,
			},
		},
	},
}
