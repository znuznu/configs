require "nvchad.mappings"

local map = vim.keymap.set

-- nvim-tree
map("n", "<leader>nt", ":NvimTreeToggle<CR>")

-- Disable line number toggle
map("n", "<leader>n", "")

-- Telescope
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })

-- Move current line
map("n", "<A-j>", ":m .+1<CR>==")
map("n", "<A-k>", ":m .-2<CR>==")

-- Move selected lines
map("v", "<A-k>", ":m '<-2<CR>gv=gv")
map("v", "<A-j>", ":m '>+1<CR>gv=gv")

-- Terminal
map("n", "<leader>h", "") -- disable default
map({ "n", "t" }, "<C-q>", function()
  require("nvchad.term").toggle { pos = "sp", id = "xz" }
end, { noremap = true, desc = "Remap toggle bottom term" })

-- Tabufline
if require("nvconfig").ui.tabufline.enabled then
  map("n", "<A-;>", function()
    require("nvchad.tabufline").next()
  end, { desc = "buffer goto next" })

  map("n", "<A-,>", function()
    require("nvchad.tabufline").prev()
  end, { desc = "buffer goto prev" })

  map("n", "<A-c>", function()
    require("nvchad.tabufline").close_buffer()
  end, { desc = "buffer close" })
end
