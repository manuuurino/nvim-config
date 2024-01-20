local M = {}

function M.ready_to_cheese()
	vim.notify("ready to cheese", vim.log.levels.INFO, {
		title = "demo",
	})
end

return M
