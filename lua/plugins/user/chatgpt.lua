local prefix = "<Leader>a"

local keymaps = {
	[prefix] = {
		name = "ChatGPT",
	},
	[prefix .. "e"] = {
		"<cmd>ChatGPTEditWithInstruction<CR>",
		desc = "Edit with instruction",
	},
	[prefix .. "g"] = {
		"<cmd>ChatGPTRun grammar_correction<CR>",
		desc = "Grammar Correction",
	},
	[prefix .. "t"] = {
		"<cmd>ChatGPTRun translate<CR>",
		desc = "Translate",
	},
	[prefix .. "k"] = {
		"<cmd>ChatGPTRun keywords<CR>",
		desc = "Keywords",
	},
	[prefix .. "d"] = {
		"<cmd>ChatGPTRun docstring<CR>",
		desc = "Docstring",
	},
	[prefix .. "a"] = {
		"<cmd>ChatGPTRun add_tests<CR>",
		desc = "Add Tests",
	},
	[prefix .. "o"] = {
		"<cmd>ChatGPTRun optimize_code<CR>",
		desc = "Optimize Code",
	},
	[prefix .. "s"] = {
		"<cmd>ChatGPTRun summarize<CR>",
		desc = "Summarize",
	},
	[prefix .. "f"] = {
		"<cmd>ChatGPTRun fix_bugs<CR>",
		desc = "Fix Bugs",
	},
	[prefix .. "x"] = {
		"<cmd>ChatGPTRun explain_code<CR>",
		desc = "Explain Code",
	},
	[prefix .. "r"] = {
		"<cmd>ChatGPTRun roxygen_edit<CR>",
		desc = "Roxygen Edit",
	},
	[prefix .. "l"] = {
		"<cmd>ChatGPTRun code_readability_analysis<CR>",
		desc = "Code Readability Analysis",
	},
}

local mappings = {
	n = keymaps,
	v = keymaps,
}

mappings.n[prefix .. "c"] = {
	"<cmd>ChatGPT<CR>",
	desc = "ChatGPT",
}

---@type LazySpec
return {
	"jackMort/ChatGPT.nvim",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
		{
			"AstroNvim/astrocore",
			---@type AstroCoreOpts
			opts = {
				mappings = mappings,
			},
		},
	},
	cmd = {
		"ChatGPT",
		"ChatGPTActAs",
		"ChatGPTEditWithInstructions",
		"ChatGPTRun",
	},
	cond = vim.env["OPENAI_API_KEY"] ~= nil,
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
}
