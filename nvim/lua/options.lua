vim.cmd([[
" set
set number
set relativenumber
set colorcolumn=80
set autoindent
set mouse=a
set noshowmode
set splitright
set autoindent
set nowrap
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
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
vim.cmd([[ autocmd BufReadPost,FileReadPost * normal zR ]]) -- avoid folds to be closed on any file that you open

-- Search --
vim.opt.ignorecase = true -- Ignore case in search patterns
vim.opt.smartcase = true -- Override ignorecase if search contains capitals
vim.opt.incsearch = true 
