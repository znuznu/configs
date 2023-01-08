return require("packer").startup(
    function()
        -- package manager
        use "wbthomason/packer.nvim"
        use "williamboman/mason.nvim"

        -- theme
        use {"bluz71/vim-moonfly-colors", branch = "cterm-compat"}

        -- lsp
        use "williamboman/mason-lspconfig.nvim"
        use "neovim/nvim-lspconfig"

        -- rust
        use "simrat39/rust-tools.nvim"

        -- typescript
        use "jose-elias-alvarez/typescript.nvim"
        use "jose-elias-alvarez/null-ls.nvim"

        -- prettier
        use "MunifTanjim/prettier.nvim"

        -- eslint
        use "MunifTanjim/eslint.nvim"

        -- plenary
        use "nvim-lua/plenary.nvim"

        -- completion framework
        use "hrsh7th/nvim-cmp"

        -- LSP completion source
        use "hrsh7th/cmp-nvim-lsp"

        -- completion utils
        use "hrsh7th/cmp-nvim-lua"
        use "hrsh7th/cmp-nvim-lsp-signature-help"
        use "hrsh7th/cmp-vsnip"
        use "hrsh7th/cmp-path"
        use "hrsh7th/cmp-buffer"
        use "hrsh7th/vim-vsnip"

        -- treesitter
        use "nvim-treesitter/nvim-treesitter"

        -- fuzzy finder
        use {
            "nvim-telescope/telescope.nvim",
            tag = "0.1.0",
            requires = {{"nvim-lua/plenary.nvim"}}
        }
        use {"nvim-telescope/telescope-fzf-native.nvim", run = "make"}

        -- probably useless
        -- use 'BurntSushi/ripgrep'
        -- use 'sharkdp/fd'

        -- fancy folders/files tree
        use {
            "nvim-tree/nvim-tree.lua",
            requires = {
                "nvim-tree/nvim-web-devicons" -- optional, for file icons
            }
        }

        -- autocomplete (), [] and {}
        use {
            "windwp/nvim-autopairs",
            config = function()
                require("nvim-autopairs").setup {}
            end
        }

        -- Highlight other uses of word under cursor
        use "RRethy/vim-illuminate"

        -- comment code
        use {
            "numToStr/Comment.nvim",
            config = function()
                require("Comment").setup()
            end
        }

        -- git integration
        use {
          'lewis6991/gitsigns.nvim',
          tag = 'release' 
        }

        -- highlight todo, fixme, perf, ...
        use {
          "folke/todo-comments.nvim",
          requires = "nvim-lua/plenary.nvim",
          config = function()
            require("todo-comments").setup {}
          end
        }

        -- indent currently broken? :(
        use "lukas-reineke/indent-blankline.nvim"

        -- power line
        use {
          "nvim-lualine/lualine.nvim",
          requires = { "kyazdani42/nvim-web-devicons", opt = true }
        }

        -- tabs
        use {"romgrk/barbar.nvim", wants = "nvim-web-devicons"}

        -- git conflict resolver
        use {'akinsho/git-conflict.nvim', tag = "v1.0.0", config = function()
          require('git-conflict').setup()
         end}

        -- diagnostics
        use {
          "folke/trouble.nvim",
          requires = "kyazdani42/nvim-web-devicons",
        }
    end
)
