local map = require('znu.utils').map

local silent = { silent = true }

-- Normal mode

-- Store relative line number jumps in the jumplist if they exceed a threshold.
map('n', 'k', '(v:count > 5 ? "m\'" . v:count : "") . "k"', { expr = true })
map('n', 'j', '(v:count > 5 ? "m\'" . v:count : "") . "j"', { expr = true })

-- Faster scrolling
map('n', '<c-e>', '3<c-e>')
map('n', '<c-y>', '3<c-y>')

-- More comfortable jumping to marks
map('n', "'", '`')
map('n', '`', "'")

-- Repurpose arrow keys for quickfix list movement
map('n', '<up>', ':cprevious<cr>', silent)
map('n', '<down>', ':cnext<cr>', silent)

-- Ex-mode is weird and not useful so it seems better to repeat the last macro
map('n', 'Q', '@@')

-- Split line with X
map('n', 'X', ':keeppatterns substitute/\\s*\\%#\\s*/\\r/e <bar> normal! ==^<cr>', { silent = true })

-- Navigate merge conflict markers
map('n', ']n', [[:call search('^\(@@ .* @@\|[<=>|]\{7}[<=>|]\@!\)', 'W')<cr>]], { silent = true })
map('n', '[n', [[:call search('^\(@@ .* @@\|[<=>|]\{7}[<=>|]\@!\)', 'bW')<cr>]], { silent = true })

-- Navigate loclist
map('n', ']l', ':lnext<cr>', { silent = true })
map('n', '[l', ':lprev<cr>', { silent = true })

-- Open the file under the cursor with the default file handler for that file
-- type (e.g., Firefox for `http` links, etc.)
-- This mapping normally comes from `netrw`, but since we disable that (for
-- dirvish), then we need to manually configure the mapping again
map('n', 'gx', [[:call znu#open#open_url_under_cursor()<cr>]], { silent = true })

map('n', '<F10>', function()
  require('znu.syntax').print_syntax()
end, { silent = true })

-- Open the current file's directory
map('n', '-', [[expand('%') == '' ? ':e ' . getcwd() . '<cr>' : ':e %:h<cr>']], { expr = true, silent = true })
map('n', 'H', [[:echo 'Use - instead!'<cr>]])

-- Close floating windows, clear highlights, etc.
map('n', '<esc>', function()
  require('notify').dismiss()
  vim.lsp.buf.clear_references()
  vim.cmd.nohlsearch()

  local ignored_filetypes = { 'incline', 'noice' }

  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local status, config = pcall(vim.api.nvim_win_get_config, win)
    local bufnr = vim.fn.winbufnr(win)
    local buf_filetype = vim.fn.getbufvar(bufnr, '&filetype')
    if config and config.relative ~= '' and not vim.tbl_contains(ignored_filetypes, buf_filetype) then
      vim.api.nvim_win_close(win, false)
    end
  end
end)

-- Leader mappings

-- Open last buffer
map('n', '<leader><leader>', '<c-^>')

-- Quit the buffer
map('n', '<leader>q', ':quit<cr>', silent)
-- Quit Vim without closing windows (useful for keeping a session)
-- map('n', '<leader>x', ':quitall<cr>', silent)
-- Save
map('n', '<leader>w', ':silent w!<cr>', silent)

-- Search & replace word under cursor
map('n', '<leader>sr', ':%s/\\<<c-r><c-w>\\>/')

-- Command mode

-- Move to the start of the line
map('c', '<c-a>', '<home>')

-- Visual mode

-- Visual shifting does not exit Visual mode
map('v', '<', '<gv')
map('v', '>', '>gv')

map('x', '.', ':normal .<cr>')
map('x', '@', [[:<c-u>echo "@".getcmdline() | execute ":'<,'>normal @" . nr2char(getchar())<cr>]])

-- Custom text objects

-- Around line: with leading and trailing whitespace
map('v', 'al', ':<c-u>silent! normal! 0v$<cr>', { silent = true })
map('o', 'al', ':normal val<cr>', { noremap = false, silent = true })

-- Inner line: without leading or trailing whitespace
map('v', 'il', ':<c-u>silent! normal! ^vg_<cr>', { silent = true })
map('o', 'il', ':normal vil<cr>', { noremap = false, silent = true })

-- Whole file, jump back with <c-o>
map('v', 'ae', [[:<c-u>silent! normal! m'gg0VG$<cr>]], { silent = true })
map('o', 'ae', ':normal Vae<cr>', { noremap = false, silent = true })

-- Don't move cursor after a line merge
map("n", "J", "mzJ`z")

-- Stay in the middle while searching
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Move current line
map("n", "<A-j>", ":m .+1<CR>==")
map("n", "<A-k>", ":m .-2<CR>==")

-- Move selected lines
map("v", "<A-k>", ":m '<-2<CR>gv=gv")
map("v", "<A-j>", ":m '>+1<CR>gv=gv")

-- barbar

-- Close buffer
map('n', '<A-c>', '<Cmd>BufferClose<CR>', { noremap = true })

-- Magic buffer-picking mode
map('n', '<C-p>', '<Cmd>BufferPick<CR>', { noremap = true })

-- Move to previous/next
map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', { noremap = true })
map('n', '<A-;>', '<Cmd>BufferNext<CR>', { noremap = true })

-- Trouble
vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end)
vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end)
vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end)
vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end)
vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end)
vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end)
