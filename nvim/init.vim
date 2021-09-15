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
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" utils
Plug 'jiangmiao/auto-pairs'
Plug 'justinmk/vim-sneak'
Plug 'vim-test/vim-test'
Plug 'HerringtonDarkholme/yats.vim'

call plug#end()

" set
set number
set colorcolumn=80
set autoindent
set mouse=a
set noshowmode
set splitright
set autoindent
set nowrap

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

command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

" GUI
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ } 

" mapping

" moving line
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-j> :m '>+1<CR>gv=gv

" CTRL + P to trigger fzf
nnoremap <silent> <C-p> :FZF<CR>

" switch buffers
nnoremap <C-I> :bp<CR>
nnoremap <C-O> :bn<CR>

" rust
let g:rustfmt_autosave = 1

" GUI colors/theme
let base16colorspace=256
colorscheme base16-gruvbox-dark-hard
