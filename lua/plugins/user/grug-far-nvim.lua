local prefix = "<Leader>f"
local mappings = {
	n = {
		[prefix .. "R"] = {
			function()
				require("grug-far").grug_far({
					prefills = { search = vim.fn.expand("<cword>") },
				})
			end,
			desc = "Search and Replace",
		},
	},
}

---@type LazySpec
return {
	"MagicDuck/grug-far.nvim",
	cmd = "GrugFar",
	---@type GrugFarOptions
	opts = {
		maxWorkers = 8,
	},
	dependencies = {
		"AstroNvim/astrocore",
		---@type AstroCoreOpts
		opts = {
			mappings = mappings,
		},
	},
}
