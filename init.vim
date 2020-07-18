syntax on
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

""---COLORSCHEME
if !has('gui_running')
	set t_Co=256
endif
set termguicolors     " enable true colors support
autocmd vimenter * colorscheme gruvbox 
set background=dark   
"




" Check if NERDTree is open or active
function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

function! CheckIfCurrentBufferIsFile()
  return strlen(expand('%')) > 0
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && CheckIfCurrentBufferIsFile() && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
autocmd BufRead * call SyncTree()

function! ToggleTree()
  if CheckIfCurrentBufferIsFile()
    if IsNERDTreeOpen()
      NERDTreeClose
    else
      NERDTreeFind
    endif
  else
    NERDTree
  endif
endfunction

" open NERDTree with ctrl + n
nmap <C-n> :call ToggleTree()<CR>

" ---- Coc completion
source ~/.config/nvim/coc.vim

command! -nargs=0 Prettier :CocCommand prettier.formatFile
""  Mappings
:let mapleader = " "

inoremap jj <Esc>
nnoremap <C-h> :wincmd h<CR>
nnoremap <C-j> :wincmd j<CR>
nnoremap <C-k> :wincmd k<CR>
nnoremap <C-l> :wincmd l<CR>

noremap <C-p> :GFiles --exclude-standard --others --cached<Cr>
noremap <leader>b :Buffers<Cr>
noremap <leader>t :Windows<Cr>

noremap <leader>f :Prettier<CR>
nnoremap <leader>u :UndotreeToggle<CR>

nnoremap <leader>w :w<CR>


" ------VIM-PLUG ---- plugins
call plug#begin(stdpath('data') . '/plugged')
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
"-----------------------------------------
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'mbbill/undotree'
""---------------------------- - -  - -  - - - -  - - 
Plug 'Yggdroot/indentLine'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
call plug#end()
