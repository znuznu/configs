return require('packer').startup(function()
    -- package manager
    use 'wbthomason/packer.nvim' 
    use 'williamboman/mason.nvim'    
   
    -- theme
    use { 'bluz71/vim-moonfly-colors', branch = 'cterm-compat' }

    -- lsp
    use 'williamboman/mason-lspconfig.nvim'
    use 'neovim/nvim-lspconfig' 

    -- rust
    use 'simrat39/rust-tools.nvim'

    -- typescript
    use 'jose-elias-alvarez/typescript.nvim'
    use('jose-elias-alvarez/null-ls.nvim')

    -- prettier
    use('MunifTanjim/prettier.nvim')

    -- eslint
    use('MunifTanjim/eslint.nvim')

    -- plenary
    use 'nvim-lua/plenary.nvim'

    -- completion framework
    use 'hrsh7th/nvim-cmp' 

    -- LSP completion source
    use 'hrsh7th/cmp-nvim-lsp'

    -- completion utils
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/vim-vsnip'

    use 'nvim-treesitter/nvim-treesitter'

    -- fancy folders/files tree
    use { 
	'nvim-tree/nvim-tree.lua',
	requires = {
		'nvim-tree/nvim-web-devicons', -- optional, for file icons
	}
    }
	
    -- autocomplete (), [] and {}
    use {
        "windwp/nvim-autopairs", 
        config = function() require("nvim-autopairs").setup {} end
    }

    -- Highlight other uses of word under cursor
    use 'RRethy/vim-illuminate' 

   -- comment code
   use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
}
end)
