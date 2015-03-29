execute pathogen#infect()
execute pathogen#helptags()

syntax on                               " show syantax hightlight
filetype plugin indent on
let g:solarized_termtrans = 1
set background=dark
colorscheme solarized

set encoding=utf-8

set autoindent                          " set auto indend
set tabstop=2                           " set indent to 2 spaces
set shiftwidth=2
set softtabstop=2
set expandtab                           " use spaces, not tab characters

:command Fold set foldmethod=indent     " :Fold will fold file by indentation -- syntax option also available
:command Unfold set nofoldenable

set relativenumber                      " show relavive line numbers

set showmatch                           " show bracket matches
set hlsearch                            " highlight all search matches
set incsearch                           " show search results as I type
:command C let @/=""                    " :C will clear search highlights

"set cursorline                          " highlight current line
set scrolloff=2                         " minimun lines above/below cursor

set laststatus=2                        " always show status bar
set ruler                               " show row and column in footer
set statusline=%f%m%r%h%w\%{fugitive#statusline()}\ [%l,%c]\ [%L,%p%%]

set clipboard=unnamed                   " use the system clipboard

set wildmenu                            " enable bash style tab completion
set wildmode=list:longest,full

" highlight the status bar when in insert mode
if version >= 700
  au InsertEnter * hi StatusLine ctermfg=235 ctermbg=2
  au InsertLeave * hi StatusLine ctermbg=240 ctermfg=12
endif

"
" leader shortcuts
" 

let mapleader = ","

"NERD Tree
map <leader>e :NERDTree<cr>

" map git commands
" ,l show git log for current file
" ,d shows git diff for current file
map <leader>l :!clear && git log -p %<cr>
map <leader>d :!clear && git diff %<cr>

" Replace xxx => yyy with xxx: yyy
nmap <Leader>h :s/\:\([a-zA-Z_]*\)\s=>/\1\:/g<cr>
vmap <Leader>h :'<,'>s/\:\([a-zA-Z_]*\)\s=>/\1\:/g<cr>

" gist-vim preferences
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

" vroom 
let g:vroom_use_vimux = 1
let g:vroom_map_keys = 0 " avoid vroom default shortcut
let g:VimuxOrientation = "h"
let g:VimuxHeight = "40"
map <leader>t :VroomRunTestFile<cr>
map <leader>T :VroomRunNearestTest<cr>

" integration with zeal offline api documentations
:nnoremap gz :!zeal --query "<cword>"&<CR><CR>
