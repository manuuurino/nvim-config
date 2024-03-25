---@type LazySpec
return {
	-- credits: https://github.com/Uzaaft/nvim/blob/6a61a2269b860d392b0115cbf80b0d8ad414ad01/lua/plugins/init.lua#L12C2-L22
	"rcarriga/nvim-notify",
	---@type notify.Config
	---@diagnostic disable-next-line: missing-fields
	opts = {
		timeout = 500,
		render = "wrapped-compact",
		stages = "slide",
		fps = 144,
		max_width = 70,
	},
}
