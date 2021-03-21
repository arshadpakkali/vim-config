set nocompatible

"" ------VIM-PLUG ---- plugins
call plug#begin(stdpath('data') . '/plugged')
" Plug 'sheerun/vim-polyglot'
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
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
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
" lsp configs
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'


call plug#end()  "syntax on already enabled on this
" -------------------------------------------------------------------
"
"---------Configs 
"

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
" nmap <C-n> :CocCommand explorer<CR>

" ---- Coc completion
" source ~/.config/nvim/coc.vim

" autocmd FileType scss setl iskeyword+=@-@

" command! -nargs=0 Prettier :CocCommand prettier.formatFile

:let maplocalleader = "."

inoremap jj <Esc>
tnoremap jj <c-\><c-n>


" copy/yank to clip board
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

" Terminal open 
" Maps ctrl-b + c to open a new tab window
nnoremap <LocalLeader>t :tabnew +terminal<CR>
nnoremap <LocalLeader>` :tabnext<CR>


nnoremap <C-h> :wincmd h<CR>
nnoremap <C-j> :wincmd j<CR>
nnoremap <C-k> :wincmd k<CR>
nnoremap <C-l> :wincmd l<CR>

nnoremap <S-w> :wa<CR>

noremap <leader>l :noh<Cr>
noremap <C-p> :GFiles --exclude-standard --others --cached<Cr>
noremap <leader>b :Buffers<Cr>
noremap <leader>t :Windows<Cr>

noremap <leader>f :Format<CR>
" nnoremap <leader>u :UndotreeToggle<CR>

" javascript snippetsgcc
inoremap clg console.log();<Esc>==f(a

let g:user_emmet_settings = {
      \'javascript':{
      \'snippets':{
      \'fn' : "(${cursor})=>{\n\t\n};",
      \}
      \}
      \} 

lua require("init")
" Use completion-nvim in every buffer
autocmd BufEnter * lua require'completion'.on_attach()
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
imap <silent> <c-space> <Plug>(completion_trigger)


" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect
"


:lua << EOF
local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  elseif client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  end

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end
end

EOF


