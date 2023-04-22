-- https://github.com/theia-ide/typescript-language-server
  require('typescript').setup {
    server = {
      on_attach = require('znu.plugins.lsp').on_attach,
      capabilities = require('znu.plugins.lsp').capabilities,
    },
  }
