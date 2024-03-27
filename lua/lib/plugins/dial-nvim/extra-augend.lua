local M = {}
local augend = require("dial.augend")

M.logical_alias = augend.constant.new({
	elements = { "&&", "||" },
	word = false,
	cyclic = true,
})

M.logical_operator = augend.constant.new({
	elements = { "and", "or" },
	word = false,
	cyclic = true,
})

M.ordinal_numbers = augend.constant.new({
	-- elements through which we cycle. When we increment, we go down
	-- On decrement we go up
	elements = {
		"first",
		"second",
		"third",
		"fourth",
		"fifth",
		"sixth",
		"seventh",
		"eighth",
		"ninth",
		"tenth",
	},
	-- if true, it only matches strings with word boundary. firstDate wouldn't work for example
	word = false,
	-- do we cycle back and forth (tenth to first on increment, first to tenth on decrement).
	-- Otherwise nothing will happen when there are no further values
	cyclic = true,
})

M.weekdays = augend.constant.new({
	elements = {
		"Monday",
		"Tuesday",
		"Wednesday",
		"Thursday",
		"Friday",
		"Saturday",
		"Sunday",
	},
	word = true,
	cyclic = true,
})

M.months = augend.constant.new({
	elements = {
		"January",
		"February",
		"March",
		"April",
		"May",
		"June",
		"July",
		"August",
		"September",
		"October",
		"November",
		"December",
	},
	word = true,
	cyclic = true,
})

M.capitalized_boolean = augend.constant.new({
	elements = {
		"True",
		"False",
	},
	word = true,
	cyclic = true,
})

return M
