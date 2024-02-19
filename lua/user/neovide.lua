---@type LazySpec
return {
	"AstroNvim/astrocore",
	---@param opts AstroCoreOpts
	opts = function(_, opts)
		if vim.g.neovide then
			return vim.tbl_deep_extend("force", opts, {
				options = {
					opt = {
						guifont = "SauceCodePro Nerd Font:h7",
					},
					g = {
						neovide_scale_factor = 1.0,
					},
				},
			})
		end
	end,
}
