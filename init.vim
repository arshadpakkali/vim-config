:let mapleader = " "
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
Plug 'unblevable/quick-scope'       

" Plug 'mbbill/undotree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'chrisbra/Colorizer'
Plug 'honza/vim-snippets'

"""---------------------------- - -  - -  - - - -  - - 
Plug 'Yggdroot/indentLine'
Plug 'mattn/emmet-vim'
Plug 'romainl/vim-cool'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  
Plug 'voldikss/vim-floaterm'
Plug 'liuchengxu/vista.vim'

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
set colorcolumn =80
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

"-- FOLDING --  
set foldmethod=syntax "syntax highlighting items specify folds  
set foldcolumn=1 "defines 1 col at window left, to indicate folding  
let javaScript_fold=1 "activate folding by JS syntax  
set foldlevelstart=99 "start file with all folds opened


let g:indentLine_char = '┊'

" fix cursor hold plugin config
let g:cursorhold_updatetime = 100

" open Coc-Explorer with ctrl + n
nmap <C-n> :CocCommand explorer<CR>

" ---- Coc completion
source ~/.config/nvim/coc.vim

autocmd FileType scss setl iskeyword+=@-@

command! -nargs=0 Prettier :CocCommand prettier.formatFile

" :let maplocalleader = "."

inoremap jj <Esc>
tnoremap jj <c-\><c-n>


" copy/yank to clip board
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

" Terminal open 
" hi Floaterm guibg=black
" Set floating window border line color to cyan, and background to orange
hi FloatermBorder guifg=cyan
let g:floaterm_height=0.9
let g:floaterm_width=0.9

" open files on normal window
function s:open_in_normal_window() abort
  let f = findfile(expand('<cfile>'))
  if !empty(f) && has_key(nvim_win_get_config(win_getid()), 'anchor')
    FloatermHide
    execute 'e ' . f
  endif
endfunction

autocmd FileType floaterm nnoremap <silent><buffer> gf :call <SID>open_in_normal_window()<CR>
autocmd FileType floaterm nnoremap <silent><buffer> gF :call <SID>open_in_normal_window()<CR>

nnoremap <leader>tt :FloatermToggle<CR>
tnoremap <leader>tt <C-\><C-n>:FloatermToggle<CR>
tnoremap <leader>tn <C-\><C-n>:FloatermNew<CR>
tnoremap <leader>tk <C-\><C-n>:FloatermNext<CR>
tnoremap <leader>tj <C-\><C-n>:FloatermPrev<CR>



nnoremap <C-h> :wincmd h<CR>
nnoremap <C-j> :wincmd j<CR>
nnoremap <C-k> :wincmd k<CR>
nnoremap <C-l> :wincmd l<CR>
nnoremap <leader>w <C-w>

nnoremap <S-w> :wa<CR>

noremap <C-p> :GFiles --exclude-standard --others --cached<Cr>
noremap <leader>b :Buffers<Cr>
noremap <leader>t :Windows<Cr>

noremap <leader>f :Format<CR>
nnoremap <leader>u :UndotreeToggle<CR>


nnoremap <leader>cl :Vista!!<CR>
nnoremap <leader>cL :Vista coc<CR>



" javascript snippetsgcc
inoremap clg console.log();<Esc>==f(a

