---@type LazySpec
return {
	"rebelot/heirline.nvim",
	dependencies = "AstroNvim/astroui",
	---@param opts {statusline: StatusLine, winbar: StatusLine, tabline: StatusLine, statuscolumn: StatusLine, opts: table}
	opts = function(_, opts)
		local status = require("astroui.status")

		-- credits: https://github.com/AstroNvim/AstroNvim/blob/b946eebbe282cca4ea6e568dd0e55fd47bad4d28/lua/astronvim/plugins/heirline.lua#L54-L69
		---@diagnostic disable-next-line: missing-fields
		opts.statusline = {
			hl = { fg = "fg", bg = "bg" },
			status.component.mode(),
			status.component.git_branch(),
			status.component.file_info(),
			status.component.git_diff(),
			status.component.diagnostics(),
			status.component.fill(),
			status.component.cmd_info(),
			status.component.fill(),
			status.component.lsp({ lsp_progress = false }),
			status.component.virtual_env(),
			status.component.treesitter(),
			{
				-- credits: https://github.com/gwww/dotfiles/blob/6f642f90508c35efec14717811a79f9fcf0ded40/.config/AstroV4/lua/plugins/heirline.lua#L18
				provider = " %4l/%L:%-3c %3p%%",
			},
			status.component.mode({ surround = { separator = "right" } }),
		}

		return opts
	end,
}
