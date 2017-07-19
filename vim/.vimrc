"
"  Vimrc
"  Michael Sperone, 2017
"
set number
syntax enable

" Colors
colorscheme molokai
set background=dark
set t_Co=256

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

" Git Gutter
" https://github.com/airblade/vim-gitgutter

set updatetime=1000
let g:gitgutter_map_keys=0
