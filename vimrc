"---------------------------------------------------------------------------
" Initializing

syntax on
execute pathogen#infect()
set path+=**
set wildmenu
set nocompatible
scriptencoding utf-8
let g:EasyMotion_leader_key = '<Leader>' 

"---------------------------------------------------------------------------
" set theme to darkbackground

set background=dark
set hlsearch
colorscheme hybrid_reverse
let g:hybrid_custom_term_colors = 1

"---------------------------------------------------------------------------
" line numbering and indentation

set number
set relativenumber
filetype plugin indent on
set nowrap
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set autoindent
set shiftwidth=2 softtabstop=2 expandtab

"autocmd VimEnter * NERDTree
set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs

"---------------------------------------------------------------------------
" File Settings

set fileformat=unix
set fileformats=unix
set fileencoding=utf-8
set fileencodings=utf-8
set encoding=utf-8
set ambiwidth=double

set backup
set showcmd

"---------------------------------------------------------------------------
" Command rempas

command! Wq :wq
command! W :w
command! Q :q
cabbrev fzf FZF 

"---------------------------------------------------------------------------
" Binding remaps

noremap <TAB>q <C-W>w
noremap <TAB>s <C-W>s
noremap <TAB>v <C-W>v
map <F2> :NERDTreeToggle<CR>
map <F3> :setlocal spell! spelllang=en_us<CR> 

"---------------------------------------------------------------------------
" Airline

let g:airline_theme = "hybrid"

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#syntastic#enabled=0
let g:ycm_show_diagnostics_ui=0
let g:airline#extensions#whitespace#enabled=0
let g:airline#extensions#whitespace#show_message=0
let g:airline_symbols.maxlinenr = ''

"---------------------------------------------------------------------------
" Settings things

let g:vim_markdown_folding_disabled = 1
" let g:indentLine_color_term = 254
let g:indentLine_char = '▏'
