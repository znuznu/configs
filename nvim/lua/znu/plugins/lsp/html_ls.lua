require("lspconfig").html.setup({
  on_attach = require("znu.plugins.lsp").on_attach,
  capabilities = require("znu.plugins.lsp").capabilities,
})
