-- wrapper around nvim keymap function
function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- move current line
map("n", "<A-j>", ":m .+1<CR>==")
map("n", "<A-k>", ":m .-2<CR>==")

-- move selected lines
map("v", "<A-k>", ":m '<-2<CR>gv=gv")
map("v", "<A-j>", ":m '>+1<CR>gv=gv")

-- don't move cursor after a line merge
map("n", "J", "mzJ`z")

-- avoid blurp --

-- stay in the middle while moving
map("n", "j", "jzz")
map("n", "k", "kzz")
-- stay in the middle while searching
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
-- stay in the middle while navigating
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
-- stay in the middle while moving to matching opening/closing symbols
map("n", "%", "%zz")

-- code actions
map("n", "ca", ":lua vim.lsp.buf.code_action()<CR>")
vim.cmd([[
nnoremap <silent> K         <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gd        <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gn        <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> gi        <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gc        <cmd>lua vim.lsp.buf.incoming_calls()<CR>
" nnoremap <silent> gd        <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> <c-k>     <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> gr        <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gs        <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gw        <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
]])

-- telescope
map("n", "<leader>ff", ":lua require('telescope.builtin').find_files()<cr>")
map("n", "<leader>fg", ":lua require('telescope.builtin').live_grep()<cr>")
map("n", "<leader>fb", ":lua require('telescope.builtin').buffers()<cr>")
map("n", "<leader>fs", ":lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<cr>")
-- map("n", "<leader>fs", ":lua require('telescope.builtin').lsp_workspace_symbols()<cr>")

-- barbar
-- Close buffer
map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
-- Magic buffer-picking mode
map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
-- Move to previous/next
map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<A-;>', '<Cmd>BufferNext<CR>', opts)

-- nvim tree
map("n", "<leader>nt", ":NvimTreeToggle<CR>")

-- trouble
vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
  { silent = true, noremap = true }
)
