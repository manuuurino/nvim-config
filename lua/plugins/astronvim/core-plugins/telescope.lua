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
						["<leader>gw"] = {
							function()
								require("telescope").extensions.git_worktree.git_worktrees()
							end,
							desc = "Switch git worktree",
						},
						["<leader>gW"] = {
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
	opts = function(_, opts)
		require("telescope").load_extension("env")
		require("telescope").load_extension("git_worktree")

		return vim.tbl_deep_extend("force", opts, {
			defaults = {
				layout_config = {
					horizontal = {
						prompt_position = "bottom",
					},
				},
			},
		})
	end,
}
