-- NOTE: would have used the `script/lua` folder instead,
--       but i dont want to mess with the lsp, so thats why i left it so
local config_dir = vim.fn.stdpath("config") .. "/"
package.path = package.path .. ";" .. config_dir .. "?.lua"
