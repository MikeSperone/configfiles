"
"  Vimrc
"  Michael Sperone, 2017
"

syntax enable

" Colors
colorscheme molokai
set background=dark

"  Spaces and Tabs
filetype plugin indent on
set tabstop=4
set softtabstop=4
set expandtab
set autoindent

" Directory (netrw)
"  1: wide (file info)
"  3: tree

" Landscape View Setup
"
let g:netrw_liststyle = 1 
let g:netrw_browse_split = 4
let g:netrw_altv = 1

" Searching
set hlsearch
