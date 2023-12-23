-- https://github.com/rcjsuen/dockerfile-language-server-nodejs
require('lspconfig').dockerls.setup({
  on_attach = require('znu.plugins.lsp').on_attach,
  capabilities = require('znu.plugins.lsp').capabilities,
})
