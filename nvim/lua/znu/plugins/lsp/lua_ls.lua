-- https://github.com/sumneko/lua-language-server
-- https://github.com/sumneko/lua-language-server/wiki/Build-and-Run-(Standalone)

require('neodev').setup {}

require('lspconfig').lua_ls.setup {
  on_attach = require('znu.plugins.lsp').on_attach,
  capabilities = require('znu.plugins.lsp').capabilities,
  settings = {
    Lua = {
      format = {
        enable = true,
      },
      workspace = {
        checkThirdParty = false,
      },
    },
  },
}
