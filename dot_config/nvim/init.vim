" Plugins here
call plug#begin('~/.config/nvim/plugged')

Plug 'ayu-theme/ayu-vim'

Plug 'majutsushi/tagbar'
Plug 'mbbill/undotree', { 'on':  'UndotreeToggle' }
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
" Plug 'Shougo/deoplete.nvim'
" Plug 'Valloric/YouCompleteMe'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Chiel92/vim-autoformat'
Plug 'scrooloose/nerdtree'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-git'
Plug 'junegunn/vim-slash'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'sgur/vim-editorconfig'
Plug 'Yggdroot/indentLine'
Plug 'justinmk/vim-gtfo'
Plug 'ekalinin/Dockerfile.vim'
Plug 'fatih/vim-go'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'sheerun/vim-polyglot'
Plug 'RRethy/vim-illuminate'
Plug 'neovim/nvim-lsp'
Plug 'wakatime/vim-wakatime'
call plug#end()

set termguicolors       " enable true colors support
let ayucolor="mirage"
colorscheme ayu

let g:airline_powerline_fonts = 1
map <C-n> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>

" ----------------------------------------------------------------------------
" undotree
" ----------------------------------------------------------------------------
let g:undotree_WindowLayout = 2
nnoremap U :UndotreeToggle<CR>

" IndentLine {{
let g:indentLine_char = '▏'
let g:indentLine_first_char = '▏'
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0
" }
"
" " ----------------------------------------------------------------------------
"  illuminate
" ----------------------------------------------------------------------------
let g:Illuminate_delay = 250

set nu
set autoindent
set smartindent
set lazyredraw
set hlsearch " CTRL-L / CTRL-R W
set incsearch
set cursorline
set nrformats=hex

set rtp+=/opt/homebrew/opt/fzf
