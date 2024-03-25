vim.filetype.add({
	filename = {
		[".ansible-lint"] = "yaml",

		-- nextcloud ignore file
		[".sync-exclude.lst"] = "gitignore",

		-- syncthing ignore file
		[".stignore"] = "gitignore",
	},
})
