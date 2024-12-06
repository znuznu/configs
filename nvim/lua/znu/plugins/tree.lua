local g = vim.g

local map = require("znu.utils").map

g.nvim_tree_git_hl = 1
g.nvim_tree_show_icons = {
	git = 0,
	folders = 1,
	files = 1,
}
g.nvim_tree_icons = {
	default = "",
	symlink = "",
	folder = {
		default = "",
		open = "",
		empty = "",
		empty_open = "",
		symlink = "",
		symlink_open = "",
	},
}

map("n", "<leader>nt", ":NvimTreeToggle<CR>")

require("nvim-tree").setup({
	filters = {
		custom = { ".git", ".DS_Store" },
	},
	update_focused_file = { enable = true },
})
