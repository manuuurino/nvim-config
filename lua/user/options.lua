---@type LazySpec
return {
	"AstroNvim/astrocore",
	---@type AstroCoreOpts
	opts = {
		options = {
			opt = {
				shiftwidth = 4,
				tabstop = 4,
				list = true, -- render charaters,
				expandtab = false, -- use tabs instead of spaces,
				clipboard = "", -- no clipboard sharing
				-- opt.completeopt = "menu,menuone,noselect,noinsert"
				foldcolumn = "auto:3", -- show at least 3 fold lines

				-- NOTE: read the readme how to install a spell, under the section "Installing spells".
				spell = true,
				spelllang = { "en_us", "de_de" },
			},
			g = {
				-- global options for this config
				codeium_native_plugin = false, -- the native plugin doesnt support virtual text yet
			},
		},
	},
}
