---@type LazySpec
return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"LinArcX/telescope-env.nvim",
		"ThePrimeagen/git-worktree.nvim",
		{
			"AstroNvim/astrocore",
			---@type AstroCoreOpts
			opts = {
				mappings = {
					n = {
						["<Leader>gw"] = {
							function()
								require("telescope").extensions.git_worktree.git_worktrees()
							end,
							desc = "Switch git worktree",
						},
						["<Leader>gW"] = {
							function()
								require("telescope").extensions.git_worktree.create_git_worktree()
							end,
							desc = "Create new git worktree",
						},
					},
				},
			},
		},
	},
	opts = {
		defaults = {
			sorting_strategy = "descending",
			-- layout_strategy = "vertical",
			layout_config = {
				horizontal = {
					prompt_position = "bottom",
				},
				vertical = {
					height = 0.9,
					preview_cutoff = 40,
					prompt_position = "bottom",
					width = 0.8,
				},
			},
		},
	},
	init = function(_)
		require("telescope").load_extension("env")
		require("telescope").load_extension("git_worktree")
	end,
}
