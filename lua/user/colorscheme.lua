---@type LazySpec
return {
	"AstroNvim/astroui",
	dependencies = "AstroNvim/astrocore",
	---@param opts AstroUIOpts
	opts = function(_, opts)
		local is_available = require("astrocore").is_available
		opts.colorscheme = is_available("kanagawa.nvim") and "kanagawa"
			or "astrodark"
	end,
}
