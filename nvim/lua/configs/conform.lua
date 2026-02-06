local options = {
   ft = { "lua", "typescript", "typescriptreact", "javascript" },
   formatters_by_ft = {
     lua = { "stylua" },
     typescript = { "prettier", "eslint_d" },
     typescriptreact = { "prettier", "eslint_d" },
     javascript = { "prettier", "eslint_d" },
   },
   format_on_save = {
     timeout_ms = 5000,
     lsp_fallback = true,
   }
}

return options
