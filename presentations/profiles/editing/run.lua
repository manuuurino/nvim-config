local actions = require("presentations.lua.commands.actions")
local task = require("presentations.lua.commands.task")

-- HACK: normally this shouldnt be done by timings,
--       but i really dont want to over engineer this
local delay = 350
local wait_for_lsp = 15000
local wait_for_cmp = 1000

task.new(delay)
	:add(function()
		vim.cmd("edit lua/plugins/astronvim/alpha-nvim.lua")
	end, "open files and split window")
	:add(function()
		vim.cmd("vsplit lua/user/mappings.lua")
		vim.cmd("43")
		vim.cmd("norm zz")
	end, "open files and split window", delay)
	:add(function()
		vim.cmd("wincmd h")
	end, "switch focus to the first window split")
	:add(function()
		vim.fn.feedkeys(" eH")
	end, "show hidden files in neotree")
	:add(function()
		require("trouble").toggle("workspace_diagnostics")
	end, "open trouble")
	:add(function()
		vim.cmd("wincmd k")
		vim.cmd("wincmd l")
	end, "focus the first window")
	:add(function() end, "waiting for lsp to finish indexing", wait_for_lsp)
	:add(function()
		vim.cmd("40")
		vim.cmd("norm zz")
		vim.cmd("18")
		vim.fn.feedkeys("o", "i")
	end, "editing line 18")
	:add(function()
		vim.fn.feedkeys("co", "i")
	end, "inserting 'co' and waiting on cmp list")
	:add(function()
		vim.fn.feedkeys("\t", "i")
	end, "selecting the first element on cmp", wait_for_cmp)
	:add(actions.ready_to_cheese)
	:run()