require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "prismals", "astro-ls", "ts_ls", "eslint", "jsonls" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 
