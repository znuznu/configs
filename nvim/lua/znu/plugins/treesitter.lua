require("nvim-treesitter.install").compilers = { "gcc" }
require("nvim-treesitter.configs").setup({
  highlight = {
    enable = true,
    use_languagetree = true,
  },
  indent = {
    enable = true,
  },
  playground = {
    enable = false,
    disable = {},
    updatetime = 25,         -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
  },
  autotag = {
    enable = true,
  },
  autopairs = {
    enable = true,
  },
  matchup = {
    enable = true,
  },
  ensure_installed = {
    "astro",
    "query",
    "javascript",
    "jsdoc",
    "typescript",
    "tsx",
    "json",
    "html",
    "graphql",
    "lua",
    "yaml",
    "css",
    "bash",
    "scss",
    "haskell",
    "vim",
    "markdown",
    "markdown_inline",
    "prisma",
    "sql",
    "regex",
    "rust",
  },
})
