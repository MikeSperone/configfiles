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

" Theme
let g:airline_powerline_fonts=1
let g:airline_theme='molokai'
let g:monokai_term_italic = 1
let g:monokai_gui_italic = 1
set laststatus=2
 
"  Spaces and Tabs
filetype plugin indent on
set tabstop=4
set shiftwidth=4
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

" disable escape sequences
set noesckeys

" Moving Between Windows
"  Ctrl + h,j,k,l to move L, Dn, Up, R
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" F3 - un-highlight search
nnoremap <F3> :set hlsearch!<CR>

" F5/F6 -> code fold/unfold
nnoremap <F5> zc<CR>
nnoremap <F6> zo<CR>

" F7/F9 - forward/backwards in buffer
nnoremap <F7> :bp<CR>
nnoremap <F9> :bn<CR>

" Searching
set hlsearch

" code folding
set foldlevelstart=99

" Javascript code folding
augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END
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
let g:syntastic_javascript_checkers = ['eslint']

" Airline - show buffer, filenames only
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_tabs = 0
"  show hostname
let g:airline#extensions#tabline#buffers_label = '%{hostname()}'
