local util_mapping = require("util.mapping")

---@param mappings AstroCoreMappings
local function insert_lazyvim_mappings(mappings)
	local n, v = mappings.n, mappings.v
	local get_icon = require("astroui").get_icon

	n["<Leader>q"] = {
		name = get_icon("Session", 1, true) .. "Quit / Session",
	}
	n["<Leader>qq"] = {
		"<cmd>qa<cr>",
		desc = "Quit All",
	}
	n["<Leader>qQ"] = {
		"<cmd>qa!<cr>",
		desc = "Froce Quit All",
	}

	n["<Leader>f"] = {
		name = get_icon("File", 1, true) .. "File / Find",
	}
	n["<Leader>fR"] = {
		function()
			require("telescope.builtin").oldfiles({
				cwd_only = true,
			})
		end,
		desc = "Recent (cwd)",
	}

	n["<Leader>s"] = {
		name = get_icon("Search", 1, true) .. "Search",
	}
	n["<leader>sc"] = {
		"<cmd>Telescope command_history<cr>",
		desc = "Command History",
	}
	n["<leader>sa"] = {
		"<cmd>Telescope autocommands<cr>",
		desc = "Auto Commands",
	}
	n["<leader>sc"] = {
		"<cmd>Telescope command_history<cr>",
		desc = "Command History",
	}
	n["<leader>sd"] = {
		"<cmd>Telescope diagnostics bufnr=0<cr>",
		desc = "Document Diagnostics",
	}
	n["<leader>sD"] = {
		"<cmd>Telescope diagnostics<cr>",
		desc = "Workspace Diagnostics",
	}
	n["<leader>sH"] = {
		"<cmd>Telescope highlights<cr>",
		desc = "Search Highlight Groups",
	}
	n["<leader>so"] = {
		"<cmd>Telescope vim_options<cr>",
		desc = "Options",
	}
	n["<leader>sT"] = {
		"<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>",
		desc = "Todo/Fix/Fixme",
	}

	n["<esc>"] = {
		"<cmd>noh<cr><esc>",
		desc = "Escape and Clear hlsearch",
	}

	-- better indenting
	v["<"] = "<gv"
	v[">"] = ">gv"
end

---@param mappings AstroCoreMappings
local function move_session_group_into_quit(mappings)
	util_mapping.move_bindings_by_pattern(
		mappings,
		"^<Leader>S(.)",
		"<Leader>q%1",
		{ "n" }
	)
end

---@param mappings AstroCoreMappings
local function remove_unneeded_mappings(mappings)
	local n = mappings.n
	n["<Leader>Q"] = false
	n["<Leader>ft"] = false
end

---@param mappings AstroCoreMappings
local function reorganize_file_or_find_group(mappings)
	util_mapping.move_binding(mappings, "<Leader>fa", "<Leader>fc", { "n" })
	util_mapping.move_binding(mappings, "<Leader>fo", "<Leader>fr", { "n" })
	util_mapping.move_binding(mappings, "<Leader>n", "<Leader>fn", { "n" })
end

---@param mappings AstroCoreMappings
local function reorganize_search_group(mappings)
	util_mapping.move_binding(mappings, "<Leader>f'", "<Leader>sm", { "n" })
	util_mapping.move_binding(mappings, "<Leader>f/", "<Leader>sb", { "n" })
	util_mapping.move_binding(mappings, "<Leader>fc", "<Leader>sg", { "n" })
	util_mapping.move_binding(mappings, "<Leader>fC", "<Leader>sC", { "n" })
	util_mapping.move_binding(mappings, "<Leader>fh", "<Leader>sh", { "n" })
	util_mapping.move_binding(mappings, "<Leader>fk", "<Leader>sk", { "n" })
	util_mapping.move_binding(mappings, "<Leader>fm", "<Leader>sM", { "n" })
	util_mapping.move_binding(mappings, "<Leader>fn", "<Leader>sn", { "n" })
	util_mapping.move_binding(mappings, "<Leader>fr", '<Leader>s"', { "n" })
	util_mapping.move_binding(mappings, "<Leader>fw", "<Leader>sw", { "n" })
	util_mapping.move_binding(mappings, "<Leader>fW", "<Leader>sW", { "n" })
	util_mapping.move_binding(mappings, "<Leader>fT", "<Leader>st", { "n" })
end

---@param mappings AstroCoreMappings
local function rename_bindings(mappings)
	for key, mapping in pairs(mappings.n) do
		-- removes the "Find " prefix and capitalizes the first letter
		if key:match("^<Leader>s.") then
			if mapping and type(mapping) == "table" and mapping.desc then
				local desc = mapping.desc
				desc = desc:gsub("Find ", "")
				desc = desc:sub(1, 1):upper() .. desc:sub(2)
				---@diagnostic disable-next-line: inject-field
				mapping.desc = desc
			end
		end
	end
end

---@param mappings AstroCoreMappings
local function change_mapping_descriptions(mappings)
	util_mapping.set_options_from_mappings(mappings, "<Leader>fr", { "n" }, {
		desc = "Recent",
	})
end

---@type LazySpec
return {
	{
		"AstroNvim/astrocore",
		---@param opts AstroCoreOpts
		opts = function(_, opts)
			local mappings = opts.mappings or {}

			move_session_group_into_quit(mappings)
			remove_unneeded_mappings(mappings)
			reorganize_search_group(mappings)
			reorganize_file_or_find_group(mappings)
			rename_bindings(mappings)
			insert_lazyvim_mappings(mappings)
			change_mapping_descriptions(mappings)
		end,
	},
	{
		"AstroNvim/astrolsp",
		---@param opts AstroLSPOpts
		opts = function(_, opts)
			local mappings = opts.mappings or {}

			-- reorganizing the LSP bindings
			util_mapping.swap_binding(
				mappings,
				"<Leader>ll",
				"<Leader>lL",
				{ "n" }
			)
		end,
	},
}
