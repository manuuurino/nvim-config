---@type LazySpec
return {
	{
		import = "astrocommunity.editing-support.chatgpt-nvim",
	},
	{
		"jackMort/ChatGPT.nvim",
		enabled = vim.env["OPENAI_API_KEY"] ~= nil,
		opts = {
			-- NOTE: plugin has a bug, this below doesnt work yet
			-- api_key_cmd = (
			-- 	"/usr/bin/bw --session '"
			-- 	.. (vim.env["BW_SESSION"] or "")
			-- 	.. "' get item chatgpt"
			-- )
			-- 	.. " | /usr/bin/jq -r '.fields"
			-- 	.. ' | map(select(.name == "api key"))'
			-- 	.. " | .[0].value'",
		},
	},
}
