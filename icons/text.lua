--[[
-- typically the tty supports these fonts characters.
-- ASCII
-- CP437 https://en.wikipedia.org/wiki/Code_page_437#Character_set
-- ISO/IEC 8859-1 https://en.wikipedia.org/wiki/ISO/IEC_8859-1#Code_page_layout
-- ISO/IEC 8859-2 https://en.wikipedia.org/wiki/ISO/IEC_8859-2#Code_page_layout
-- ISO/IEC 8859-5 https://en.wikipedia.org/wiki/ISO/IEC_8859-5#Codepage_layout
-- ISO/IEC 8859-10 https://en.wikipedia.org/wiki/ISO/IEC_8859-10#Codepage_layout
--]]

---@type Icons
local icons = {
	scope_symbol = "│",
	scope_indent_tab_symbol = "│",
	expander_collapsed = "▶",
	expander_expanded = "▼",
	expander_separator = "│",
	folded_symbol = "...",
	tab_char = "──→",
	space_char = "·",

	fix_icon = "F ",
	todo_icon = "T ",
	hack_icon = "H ",
	warn_icon = "W ",
	perf_icon = "P ",
	note_icon = "N ",
	test_icon = "T ",

	config = "*",
	project = "*",
	last_session = "*",
	recents = "*",
	find_recent_session = "*",
}

return icons
