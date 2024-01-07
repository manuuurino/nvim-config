local has_excecutable = require("util.dependencies").has_excecutable

---@type LazySpec
return {
	{
		import = "astrocommunity.markdown-and-latex.peek-nvim",
		cond = has_excecutable("deno"),
	},
}
