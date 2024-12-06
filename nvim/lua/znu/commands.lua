-- Utility commands for reloading the configuration and restarting LSP
vim.api.nvim_create_user_command("Restart", function()
	require("znu.utils").restart()
end, {})
vim.api.nvim_create_user_command("Reload", function()
	require("znu.utils").reload()
end, {})

-- Compiler/linter commands
vim.api.nvim_create_user_command("Make", function()
	require("znu.async_make").make()
end, {})
vim.api.nvim_create_user_command("TSC", function()
	require("znu.async_make").make("tsc", true)
end, {})
vim.api.nvim_create_user_command("ESLint", function()
	require("znu.async_make").make("eslint_d", true)
end, {})
