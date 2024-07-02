---@type LazySpec
return {
	{
		import = "astrocommunity.completion.codeium-vim",
	},
	{
		"Exafunction/codeium.vim",
		dependencies = {
			"AstroNvim/astrocore",
			---@type AstroCoreOpts
			opts = {
				mappings = {
					i = {
						["<C-;>"] = false,
						["<C-,>"] = false,
						["<M-;>"] = {
							function()
								return vim.fn["codeium#CycleCompletions"](1)
							end,
							expr = true,
						},
						["<M-,>"] = {
							function()
								return vim.fn["codeium#CycleCompletions"](-1)
							end,
							expr = true,
						},
					},
				},
			},
		},
	},
}
