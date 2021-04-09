set nocompatible

"" ------VIM-PLUG ---- plugins
call plug#begin(stdpath('data') . '/plugged')
Plug 'sheerun/vim-polyglot'
" Plug 'gruvbox-community/gruvbox'
" Plug 'ayu-theme/ayu-vim' 
Plug 'rktjmp/lush.nvim'
Plug 'npxbr/gruvbox.nvim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"-----------------------------------------
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/FixCursorHold.nvim'

" Plug 'mbbill/undotree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'chrisbra/Colorizer'

"""---------------------------- - -  - -  - - - -  - - 
Plug 'Yggdroot/indentLine'
Plug 'mattn/emmet-vim'
Plug 'romainl/vim-cool'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  
Plug 'voldikss/vim-floaterm'


call plug#end()  "syntax on already enabled on this
" -------------------------------------------------------------------
"
"---------Configs 

set relativenumber
set smartindent 
set incsearch
set nobackup
set noswapfile 
set undodir=~/.config/nvim/undoDir
set undofile
set smartcase
set laststatus=2
set nu
set encoding=UTF-8
set wildmenu
set colorcolumn =100
set expandtab
set tabstop=2 softtabstop=2
set shiftwidth=2
set signcolumn=yes
set scrolloff=5

""---COLORSCHEME
let g:airline_powerline_fonts = 1
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark = 'hard'
set termguicolors     " enable true colors support
" let ayucolor="light"  " for light version of theme
" let ayucolor="mirage" " for mirage version of theme
let ayucolor="dark"   " for dark version of theme
colorscheme gruvbox 
set background=dark 
set lazyredraw

let g:indentLine_char = '┊'

" fix cursor hold plugin config
let g:cursorhold_updatetime = 100

" open Coc-Explorer with ctrl + n
nmap <C-n> :CocCommand explorer<CR>

" ---- Coc completion
source ~/.config/nvim/coc.vim

autocmd FileType scss setl iskeyword+=@-@

command! -nargs=0 Prettier :CocCommand prettier.formatFile

:let maplocalleader = "."
:let mapleader = " "

inoremap jj <Esc>
tnoremap jj <c-\><c-n>


" copy/yank to clip board
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

" Terminal open 
nnoremap <leader>tt :FloatermToggle<CR>
tnoremap <leader>tt <C-\><C-n>:FloatermToggle<CR>

nnoremap <C-h> :wincmd h<CR>
nnoremap <C-j> :wincmd j<CR>
nnoremap <C-k> :wincmd k<CR>
nnoremap <C-l> :wincmd l<CR>
nnoremap <leader>wq :wincmd q<CR>
nnoremap <leader>wh :wincmd h<CR>
nnoremap <leader>wj :wincmd j<CR>
nnoremap <leader>wk :wincmd k<CR>
nnoremap <leader>wl :wincmd l<CR>

nnoremap <S-w> :wa<CR>

noremap <leader>l :noh<Cr>
noremap <C-p> :GFiles --exclude-standard --others --cached<Cr>
noremap <leader>b :Buffers<Cr>
noremap <leader>t :Windows<Cr>

noremap <leader>f :Format<CR>
nnoremap <leader>u :UndotreeToggle<CR>


" javascript snippetsgcc
inoremap clg console.log();<Esc>==f(a

