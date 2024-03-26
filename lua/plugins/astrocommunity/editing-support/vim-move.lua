---@type LazySpec
return {
	{ import = "astrocommunity.editing-support.vim-move" },
	{
		"matze/vim-move",
		-- TODO: resolve this in astrocommunity
		event = "User AstroFile",
	},
}
