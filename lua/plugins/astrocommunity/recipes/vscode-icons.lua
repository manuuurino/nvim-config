---@return LazySpec
return {
	{ import = "astrocommunity.recipes.vscode-icons" },
	{
		-- TODO: remove this snippet until this is merged: https://github.com/AstroNvim/astrocommunity/pull/851
		"onsails/lspkind.nvim",
		opts = function(_, opts)
			opts.preset = "codicons"
			opts.symbol_map = {
				Text = " ",
				Method = " ",
				Function = " ",
				Constructor = " ",
				Field = " ",
				Variable = " ",
				Class = " ",
				Interface = " ",
				Module = " ",
				Property = " ",
				Unit = " ",
				Value = " ",
				Enum = " ",
				Keyword = " ",
				Snippet = " ",
				Color = " ",
				File = " ",
				Reference = " ",
				Folder = " ",
				EnumMember = " ",
				Constant = " ",
				Struct = " ",
				Event = " ",
				Operator = " ",
				TypeParameter = " ",
			}
			return opts
		end,
	},
}
