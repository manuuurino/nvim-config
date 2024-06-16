---@type LazySpec
return {
	"AstroNvim/astroui",
	dependencies = "AstroNvim/astrocore",
	---@param opts AstroUIOpts
	opts = function(_, opts)
		local is_available = require("astrocore").is_available
		if require("util.checks").is_tty() then
			opts.colorscheme = "elflord"
		else
			opts.colorscheme = is_available("catppuccin") and "catppuccin-mocha"
				or "astrodark"
		end
	end,
}
