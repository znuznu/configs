local g = vim.g

local map = require("znu.utils").map

-- Ultimate leader key for an absolute control
map("n", ",", "<nop>")
map("v", ",", "<nop>")
g.mapleader = ","

require("znu.settings")
require("znu.commands")
require("znu.autocmds")
require("znu.plugins")
require("znu.mappings")
require("znu.abbreviations")
require("znu.statusline")
require("znu.winbar")
require("znu.tabline")
require("znu.file_info")
require("znu.terminal")

vim.cmd([[colorscheme moonfly]])
