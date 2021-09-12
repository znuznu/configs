call plug#begin('~/.config/nvim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" languages
Plug 'rust-lang/rust.vim'
Plug 'maxmellon/vim-jsx-pretty'

" GUI/editor
Plug 'chriskempson/base16-vim'
Plug 'preservim/nerdtree'
Plug 'editorconfig/editorconfig-vim'
Plug 'itchyny/lightline.vim'

" utils
Plug 'jiangmiao/auto-pairs'
Plug 'justinmk/vim-sneak'
Plug 'vim-test/vim-test'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'HerringtonDarkholme/yats.vim'

call plug#end()

" set
set number
set colorcolumn=80
set autoindent
set mouse=a
set noshowmode

" prettier
let g:prettier#autoformat_config_present = 1
let g:prettier#autoformat_config_files = [
      \'.prettierrc',
      \'.prettierrc.yml',
      \'.prettierrc.yaml',
      \'.prettierrc.js',
      \'.prettierrc.config.js',
      \'.prettierrc.json',
      \'.prettierrc.toml']

" GUI
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ } 

" mapping
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-j> :m '>+1<CR>gv=gv

" rust
let g:rustfmt_autosave = 1

" GUI colors/theme
let base16colorspace=256
colorscheme base16-gruvbox-dark-hard
