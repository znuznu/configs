local util = require 'lspconfig.util'

-- https://github.com/graphql/graphiql/tree/main/packages/graphql-language-service-cli
require('lspconfig').graphql.setup {
  on_attach = require('znu.plugins.lsp').on_attach,
  capabilities = require('znu.plugins.lsp').capabilities,
  root_dir = util.root_pattern('.graphqlrc.yml', '.graphqlrc'),
  filetypes = { 'graphql', 'typescriptreact' },
}
