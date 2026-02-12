return {
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = require("telescope.actions").close,
      },
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
    pickers = {
      oldfiles = {
        sort_lastused = true,
        cwd_only = true,
      },
      find_files = {
        hidden = true,
        find_command = {
          "rg",
          "--files",
          "--color",
          "never",
          "--ignore-file",
        },
      },
      live_grep = {
        path_display = { "shorten" },
      },
    },
  },
}
