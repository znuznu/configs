require('conform').setup({
  ft = { 'lua', 'typescript', 'typescriptreact', 'javascript' },
  formatters_by_ft = {
    lua = { 'stylua' },
    typescript = { 'prettier', 'eslint_d' },
    typescriptreact = { 'prettier', 'eslint_d' },
    javascript = { 'prettier', 'eslint_d' },
  },
  format_on_save = {
    timeout_ms = 2500,
    lsp_fallback = true,
  },
})
