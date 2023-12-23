-- https://github.com/antonk52/cssmodules-language-server
require('lspconfig').cssmodules_ls.setup({
  on_attach = require('znu.plugins.lsp').on_attach,
  capabilities = require('znu.plugins.lsp').capabilities,
})
