-- inspired: https://github.com/LazyVim/LazyVim/blob/ce5917a58965b47ed09462ddb5d160dee2b130ae/lua/lazyvim/plugins/extras/editor/dial.lua#L24-L165

local M = {}
---@type table<string, table<string, string[]>>
M.dials_by_ft = {}

---@param increment boolean
---@param g? boolean
function M.dial(increment, g)
	local is_visual = vim.fn.mode(true):sub(1, 1) == "v"
	local func = (increment and "inc" or "dec")
		.. (g and "_g" or "_")
		.. (is_visual and "visual" or "normal")
	local group = M.dials_by_ft[vim.bo.filetype] or M.dials_by_ft.default
	return require("dial.map")[func](group)
end

local keymaps = {
	["+"] = {
		function()
			return M.dial(true, true)
		end,
		expr = true,
		desc = "Increment",
	},
	["-"] = {
		function()
			return M.dial(false, true)
		end,
		expr = true,
		desc = "Decrement",
	},
}

local mappings = {
	n = keymaps,
	v = keymaps,
}

---@LazySpec
return {
	"monaqa/dial.nvim",
	event = "User AstroFile",
	dependencies = {
		"AstroNvim/astrocore",
		---@type AstroCoreOpts
		opts = {
			mappings = mappings,
		},
	},
	opts = function(_, opts)
		local augend = require("dial.augend")
		local extra_augend = require("lib.plugins.dial-nvim.extra-augend")

		return vim.tbl_deep_extend("force", opts, {
			dials_by_ft = {
				css = "css",
				fish = "fish",
				javascript = "typescript",
				javascriptreact = "typescript",
				json = "json",
				lua = "lua",
				markdown = "markdown",
				python = "python",
				sass = "css",
				scss = "css",
				sh = "bash",
				typescript = "typescript",
				typescriptreact = "typescript",
			},
			groups = {
				global = {
					augend.case.new({
						types = {
							"camelCase",
							"PascalCase",
							"snake_case",
							"SCREAMING_SNAKE_CASE",
						},
					}),
					augend.date.alias["%Y/%m/%d"],
					augend.date.alias["%H:%M:%S"],
					augend.date.alias["%H:%M"],
					augend.integer.alias.decimal,
					augend.integer.alias.binary,
					augend.integer.alias.octal,
					augend.integer.alias.hex,
					augend.constant.alias.alpha,
					augend.constant.alias.Alpha,
					extra_augend.months,
					extra_augend.ordinal_numbers,
					extra_augend.weekdays,
				},
				default = {
					augend.constant.alias.bool,
				},
				bash = {
					augend.constant.alias.bool,
					extra_augend.logical_alias,
				},
				typescript = {
					augend.constant.alias.bool,
					augend.constant.new({ elements = { "let", "const" } }),
					extra_augend.logical_alias,
				},
				css = {
					augend.hexcolor.new({
						case = "lower",
					}),
					augend.hexcolor.new({
						case = "upper",
					}),
				},
				markdown = {
					augend.misc.alias.markdown_header,
					augend.semver.alias.semver,
				},
				json = {
					augend.semver.alias.semver,
				},
				lua = {
					augend.constant.alias.bool,
					extra_augend.logical_operator,
				},
				fish = {
					augend.constant.alias.bool,
					extra_augend.logical_operator,
				},
				python = {
					extra_augend.capitalized_boolean,
					extra_augend.logical_alias,
				},
			},
		})
	end,
	config = function(_, opts)
		local groups = opts.groups

		-- add rules from global to the other groups
		for name, group in pairs(groups) do
			if name ~= "global" then
				for i = 1, #groups.global do
					table.insert(group, groups.global[i])
				end
			end
		end

		require("dial.config").augends:register_group(groups)
		M.dials_by_ft = opts.dials_by_ft
	end,
}
