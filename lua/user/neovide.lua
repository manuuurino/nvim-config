local g = vim.g
if g.neovide == nil then return {} end

local previous_scale_factor = g.neovide_scale_factor

---@param scale_factor number
local function set_scale_factor(scale_factor)
	g.neovide_scale_factor = scale_factor
end

local function reset_scale_factor()
	g.neovide_scale_factor = previous_scale_factor
end

---@param increment number
local change_scale_factor = function(increment)
	set_scale_factor(g.neovide_scale_factor * (1 + increment))
end

vim.api.nvim_create_user_command("NeovideSetScaleFactor", function(event)
	local scale_factor = tonumber(event.fargs[1])
	if scale_factor == nil then return end
	set_scale_factor(scale_factor)
end, { nargs = 1 })

vim.api.nvim_create_user_command(
	"NeovideResetScaleFactor",
	reset_scale_factor,
	{ nargs = 0 }
)

---@type LazySpec
return {
	{
		"AstroNvim/astrocore",
		---@param opts AstroCoreOpts
		opts = function(_, opts)
			return vim.tbl_deep_extend("force", opts, {
				mappings = {
					n = {
						["<C-=>"] = {
							function()
								change_scale_factor(0.1)
							end,
							desc = "Neovide zoom in",
						},
						["<C-->"] = {
							function()
								change_scale_factor(-0.1)
							end,
							desc = "Neovide zoom out",
						},
					},
				},
			})
		end,
	},
}
