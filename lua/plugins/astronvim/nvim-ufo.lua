---@type LazySpec
return {
	"kevinhwang91/nvim-ufo",
	dependencies = {
		"AstroNvim/astroui",
		{
			"AstroNvim/astrocore",
			---@param opts AstroCoreOpts
			opts = function(_, opts)
				-- credits: https://github.com/kevinhwang91/nvim-ufo/issues/150
				-- NOTE: this can also easily break and the fold level doesnt limit till the max nested of folds

				---@param num integer Set the fold level to this number
				local set_buf_foldlevel = function(num)
					vim.b["ufo_foldlevel"] = num
					require("ufo").closeFoldsWith(num)
				end

				---@param num integer The amount to change the UFO fold level by
				local change_buf_foldlevel_by = function(num)
					local foldlevel = vim.b["ufo_foldlevel"] or 0
					-- Ensure the foldlevel can't be set negatively
					if foldlevel + num >= 0 then
						foldlevel = foldlevel + num
					else
						foldlevel = 0
					end
					set_buf_foldlevel(foldlevel)
				end

				local fold_more = function()
					local count = vim.v.count
					if count == 0 then count = 1 end
					change_buf_foldlevel_by(-count)
				end

				local fold_less = function()
					local count = vim.v.count
					if count == 0 then count = 1 end
					change_buf_foldlevel_by(count)
				end

				local fold_set_level = function()
					local fold_level = tonumber(vim.fn.input("Foldlevel: "))

					if fold_level ~= nil then
						set_buf_foldlevel(fold_level)
					else
						vim.notify(
							"No foldlevel given to set!",
							vim.log.levels.WARN
						)
					end
				end

				return vim.tbl_deep_extend("force", opts, {
					autocommands = {
						ufo_set_foldlevel = {
							event = "BufReadPre",
							desc = "UFO: Set foldlevel",
							callback = function()
								vim.b["ufo_foldlevel"] = 0
							end,
						},
					},
					mappings = {
						n = {
							["zm"] = {
								fold_more,
								desc = "fold more",
							},
							["zr"] = {
								fold_less,
								desc = "Fold less",
							},
							["zS"] = {
								fold_set_level,
								desc = "UFO: Set Foldlevel",
							},
						},
					},
				})
			end,
		},
	},
	cond = not vim.g.vscode,
	---@param opts UfoConfig
	opts = function(_, opts)
		local get_icon = require("astroui").get_icon

		-- credits: https://github.com/kevinhwang91/nvim-ufo/blob/c6d88523f574024b788f1c3400c5d5b9bb1a0407/README.md?plain=1#L332-L358
		opts.fold_virt_text_handler = function(
			virtText,
			lnum,
			endLnum,
			width,
			truncate
		)
			local newVirtText = {}
			local suffix = (" " .. get_icon("FoldedSymbol") .. " %d "):format(
				endLnum - lnum
			)
			local sufWidth = vim.fn.strdisplaywidth(suffix)
			local targetWidth = width - sufWidth
			local curWidth = 0
			for _, chunk in ipairs(virtText) do
				local chunkText = chunk[1]
				local chunkWidth = vim.fn.strdisplaywidth(chunkText)
				if targetWidth > curWidth + chunkWidth then
					table.insert(newVirtText, chunk)
				else
					chunkText = truncate(chunkText, targetWidth - curWidth)
					local hlGroup = chunk[2]
					table.insert(newVirtText, { chunkText, hlGroup })
					chunkWidth = vim.fn.strdisplaywidth(chunkText)
					-- str width returned from truncate() may less than 2nd argument, need padding
					if curWidth + chunkWidth < targetWidth then
						suffix = suffix
							.. (" "):rep(targetWidth - curWidth - chunkWidth)
					end
					break
				end
				curWidth = curWidth + chunkWidth
			end
			table.insert(newVirtText, { suffix, "MoreMsg" })
			return newVirtText
		end
	end,
}
