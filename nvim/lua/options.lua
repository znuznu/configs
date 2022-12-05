vim.cmd([[
" set
set number
set colorcolumn=80
set autoindent
set mouse=a
set noshowmode
set splitright
set autoindent
set nowrap
]])

-- format on save
-- vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]]

-- completion
-- :help completeopt
vim.opt.completeopt = {"menuone", "noselect", "noinsert"}
vim.opt.shortmess = vim.opt.shortmess + {c = true}
vim.api.nvim_set_option("updatetime", 300)

vim.cmd([[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])

-- treesitter folding
vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
