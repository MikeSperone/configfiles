"
"  Vimrc
"  Michael Sperone, 2017
"

" Start Pathogen
execute pathogen#infect()
 
set number

" Colors
syntax on
colorscheme molokai
set background=dark
set t_Co=256
let g:airline_powerline_fonts=1
let g:airline_theme='molokai'
set laststatus=2
 
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
let g:netrw_banner = 0
let g:netrw_winsize = 20
let g:netrw_liststyle = 1
let g:netrw_browse_split = 3
let g:netrw_altv = 1

" Resize windows
set winheight=30
set winminheight=5

" Moving Between Windows
"  Ctrl + h,j,k,l to move L, Dn, Up, R
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Searching
set hlsearch

" Git Gutter
" https://github.com/airblade/vim-gitgutter

set updatetime=1000
let g:gitgutter_map_keys=0

" Syntastic (Requires Installation)
"  Default setup, as recommended
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*i

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
