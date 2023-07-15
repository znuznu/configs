-- Automatically install packer.nvim
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    '--single-branch',
    'https://github.com/folke/lazy.nvim.git',
    lazypath,
  }
end
vim.opt.runtimepath:prepend(lazypath)

require('lazy').setup({
  -- Colorscheme
  {
    "bluz71/vim-moonfly-colors",
    name = "moonfly",
    lazy = false,
    priority = 1000
  },

  -- Core utilities
  'tpope/vim-repeat', -- Make repeat (.) command smarter

  {
    'rcarriga/nvim-notify',
    config = function()
      require 'znu.plugins.notify'
    end,
    event = 'VeryLazy',
  },
  {
    'andymass/vim-matchup',
    config = function()
      vim.g.matchup_matchparen_offscreen = {}
    end,
  },
  {
    'antoinemadec/FixCursorHold.nvim',
    config = function()
      vim.g.cursorhold_updatetime = 500
    end,
  },
  {
    -- Improve folding
    'kevinhwang91/nvim-ufo',
    dependencies = { 'kevinhwang91/promise-async' },
    config = function()
      require 'znu.plugins.ufo'
    end,
  },

  -- Mapping improvements
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = function()
      require 'znu.plugins.autopairs'
    end,
  },
  {
    'numToStr/Comment.nvim',
    keys = {
      { 'gc', mode = { 'n', 'v' }, 'gcc' },
    },
    config = function()
      require('Comment').setup {
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
      }
    end,
  },
  {
    'kylechui/nvim-surround',
    keys = { 'ys', 'cs', 'ds' },
    config = function()
      require('nvim-surround').setup()
    end,
  },
  {
    'JoosepAlviste/cinnamon.nvim',
    branch = 'feature/skip-lines-when-scrolling',
    event = 'BufEnter',
    config = function()
      require('cinnamon').setup {
        extra_keymaps = true,
        default_delay = 2,
        max_length = 60,
        hide_cursor = true,
        scroll_limit = -1,
      }
    end,
  },

  -- UI
  {
    'folke/noice.nvim',
    config = function()
      require 'znu.plugins.noice'
    end,
    dependencies = {
      'MunifTanjim/nui.nvim',
    },
  },
  {
    'b0o/incline.nvim',
    config = function()
      require 'znu.plugins.incline'
    end,
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require 'znu.plugins.indent'
    end
  },

  -- Navigation
  {
    -- Fuzzy finder
    'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    config = function()
      require 'znu.plugins.telescope'
    end,
    dependencies = {
      'nvim-lua/plenary.nvim', -- Useful Lua utilities

      -- FZF sorter for Telescope
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      'nvim-telescope/telescope-ui-select.nvim',
    },
  },
  {
    'tamago324/lir.nvim', -- File explorer
    config = function()
      require 'znu.plugins.lir'
    end,
  },
  {
    'tpope/vim-projectionist', -- Alternative files
    config = function()
      require 'znu.plugins.projectionist'
    end,
  },
  {
    'ggandor/leap.nvim',
    config = function()
      require('leap').set_default_keymaps()
    end,
  },
  {
    'nvim-tree/nvim-tree.lua',
    config = function()
      require 'znu.plugins.tree'
    end,
  },

  -- Advanced highlighting
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require 'znu.plugins.treesitter'
    end,
    dependencies = {
      'windwp/nvim-ts-autotag', -- Automatically end & rename tags
      -- Dynamically set commentstring based on cursor location in file
      { 'JoosepAlviste/nvim-ts-context-commentstring', dev = false },
      'nvim-treesitter/playground',
    },
  },

  -- Misc
  {
    'nvim-tree/nvim-web-devicons',
    config = function()
      require 'znu.plugins.web_devicons'
    end,
  },

  -- Programming
  --------------

  -- Automatic package management
  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup()

      local ensure_installed = {
        -- Language servers
        'astro-language-server',
        'css-lsp',
        'dockerfile-language-server',
        'graphql-language-service-cli',
        'json-lsp',
        'typescript-language-server',
        'yaml-language-server',
        'lua-language-server',
        'rust-analyzer',
        'eslint-lsp',
        'prisma-language-server',
        'html-lsp',
        'tailwindcss-language-server',
        'zk',

        -- Linting and formatting
        'eslint_d',
        'stylua',

        -- DAP servers
        'node-debug2-adapter',
        'firefox-debug-adapter',
      }

      vim.api.nvim_create_user_command('MasonInstallAll', function()
        vim.cmd('MasonInstall ' .. table.concat(ensure_installed, ' '))
      end, {})
    end,
  },

  -- Smarts
  {
    'neovim/nvim-lspconfig', -- Built-in LSP configurations
    config = function()
      require 'znu.plugins.lsp'
      require 'znu.plugins.lsp.css_ls'
      require 'znu.plugins.lsp.docker_ls'
      require 'znu.plugins.lsp.graphql_ls'
      require 'znu.plugins.lsp.json_ls'
      require 'znu.plugins.lsp.tsserver_ls'
      require 'znu.plugins.lsp.yaml_ls'
      require 'znu.plugins.lsp.lua_ls'
      require 'znu.plugins.lsp.haskell_ls'
      require 'znu.plugins.lsp.eslint_ls'
      require 'znu.plugins.lsp.prisma_ls'
      require 'znu.plugins.lsp.html_ls'
      require 'znu.plugins.lsp.tailwind_ls'
      require 'znu.plugins.lsp.rust_ls'
    end,
    dependencies = {
      {
        'jose-elias-alvarez/null-ls.nvim',
        config = function()
          require 'znu.plugins.lsp.null_ls'
        end,
      },
      'jose-elias-alvarez/typescript.nvim',
      'simrat39/rust-tools.nvim',
      'folke/neodev.nvim',
    },
  },
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',
      'petertriho/cmp-git',
    },
    config = function()
      require 'znu.plugins.cmp'
    end,
  },
  {
    'L3MON4D3/LuaSnip',
    event = 'InsertEnter',
    config = function()
      require 'znu.plugins.luasnip'
    end,
  },

  -- Debugging
  {
    'rcarriga/nvim-dap-ui',
    dependencies = { 'mfussenegger/nvim-dap' },
    keys = {
      '<localleader>dc',
      '<localleader>do',
      '<localleader>di',
      '<localleader>dt',
      '<localleader>db',
      '<localleader>dB',
      '<localleader>dr',
      '<localleader>du',
    },
    config = function()
      require 'znu.plugins.dap'
    end,
  },

  -- Web dev
  {
    'NvChad/nvim-colorizer.lua', -- Preview colors
    config = function()
      require('colorizer').setup {
        filetypes = { '*', '!packer' },
        user_default_options = {
          tailwind = 'lsp',
          names = false,
          sass = { enable = true, parsers = { css = true } },
        },
      }
    end,
  },

  {
    'axelvc/template-string.nvim',
    config = function()
      require('template-string').setup {
        filetypes = { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact' },
        remove_template_string = true,
        restore_quotes = {
          normal = [[']],
          jsx = [["]],
        },
      }
    end,
    event = 'InsertEnter',
    ft = { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact' },
  },

  -- Git
  {
    'tpope/vim-fugitive',
    cmd = { 'Git', 'G', 'Gstatus', 'Gblame', 'Gpush', 'Gpull', 'Gdiff' },
  },
  {
    'lewis6991/gitsigns.nvim', -- Git status signs in the gutter
    config = function()
      require 'znu.plugins.gitsigns'
    end,
  },

  -- Notes
  {
    'mickael-menu/zk-nvim',
    dependencies = { 'neovim/nvim-lspconfig' },
    ft = 'markdown',
    config = function()
      require 'znu.plugins.zk'
    end,
  },

  -- Tabs
  {
    'romgrk/barbar.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
      animation = false,
    },
    version = '^1.0.0', -- only update when a new 1.x version is released
  },

  -- Testing
  {
    -- Use Ctrl+Q to toggle a terminal
    'kassio/neoterm',
    config = function()
      require 'znu.plugins.neoterm'
    end,
    keys = {
      { '<c-q>', [[:Ttoggle<cr>]],           silent = true },
      { '<c-q>', [[<c-\><c-n>:Ttoggle<cr>]], mode = 't',   silent = true },
    },
  },
  {
    'nvim-neotest/neotest',
    keys = {
      '<leader>tn',
      '<leader>tf',
      '<leader>ta',
      '<leader>tl',
      '<leader>ts',
    },
    dependencies = { 'KaiSpencer/neotest-vitest', 'haydenmeade/neotest-jest' },
    config = function()
      require 'znu.plugins.neotest'
    end,
  },
}, {
  install = {
    colorscheme = { 'moonfly' },
  },
  checker = {
    enabled = true,
    frequency = 3600 * 60 * 12, -- Every 12 hours
    notify = false,
  },
  dev = {
    path = '~/Code/Projects',
  },
})
