-- This file is automatically ran last in the setup process and is a good place to configure
-- augroups/autocommands and custom filetypes also this just pure lua so
-- anything that doesn't fit in the normal config locations above can go here

-- Set up custom filetypes
vim.filetype.add({
	extension = {
		-- foo = "fooscript",
	},
	filename = {
		[".ansible-lint"] = "yaml",
		-- nextcloud ignore file
		[".sync-exclude.lst"] = "gitignore",
		-- syncthing ignore file
		[".stignore"] = "gitignore",
	},
	pattern = {
		-- ["~/%.config/foo/.*"] = "fooscript",
	},
})
