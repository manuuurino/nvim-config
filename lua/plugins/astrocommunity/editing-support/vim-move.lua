---@type LazySpec
return {
	{ import = "astrocommunity.editing-support.vim-move" },
	{
		"matze/vim-move",
		-- TODO: resolve this in astrocommunity
		event = function()
			---@diagnostic disable-next-line: return-type-mismatch
			return "User AstroFile"
		end,
	},
}
