set nocompatible                        " be iMproved, required by vundle
filetype off                            " required by vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugin 'tpope/vim-fugitive' " me tira errores no se de que
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-projectionist'
Plugin 'tpope/vim-surround'
Plugin 'skalnik/vim-vroom'         " test runner
Plugin 'scrooloose/nerdtree'       " tree 
Plugin 'ctrlpvim/ctrlp.vim'        " fuzzy open
Plugin 'mileszs/ack.vim'           " search in repo
Plugin 'kchmck/vim-coffee-script'
Plugin 'pangloss/vim-javascript'
Plugin 'esneider/YUNOcommit.vim'
Plugin 'wakatime/vim-wakatime'


" All of your Plugins must be added before the following line
call vundle#end()            " required by vundle
filetype plugin indent on    " required by vundle

"
" Brief Vundle help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
"
" Put your non-Plugin stuff after this line

syntax on                               " show syantax hightlight
set background=dark

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
" saco el status line xq fugitive no está funcionando
"set statusline=%f%m%r%h%w\%{fugitive#statusline()}\ [%l,%c] "\ [%L,%p%%]

set clipboard=unnamed                   " use the system clipboard

set wildmenu                            " enable bash style tab completion
set wildmode=list:longest,full

" highlight the status bar when in insert mode
if version >= 700
  au InsertEnter * hi StatusLine ctermfg=235 ctermbg=2
  au InsertLeave * hi StatusLine ctermbg=240 ctermfg=12
endif

"VROOM (test runner) configurations
let g:vroom_ignore_color_flag=1

"Ack.vim
if executable('ag') " use silver searcher if installed
  let g:ackprg = 'ag --vimgrep'
endif

"
" leader shortcuts
" 

let mapleader = ","

map <Leader>f :Ack!<Space> 

" Vroom test runner
map <leader>T :VroomRunNearestTest<cr>
map <leader>t :VroomRunTestFile<cr>

"NERD Tree
map <leader>w :NERDTree<cr>

"ctrip Fuzzy Search - Quick Open
map <leader>e :CtrlP .<cr>

" map git commands
" ,l show git log for current file
" ,d shows git diff for current file
map <leader>l :!clear && git log -p %<cr>
map <leader>d :!clear && git diff %<cr>

" Replace xxx => yyy with xxx: yyy
nmap <Leader>h :s/\:\([a-zA-Z_]*\)\s=>/\1\:/g<cr>
vmap <Leader>h :'<,'>s/\:\([a-zA-Z_]*\)\s=>/\1\:/g<cr>

" YUNOCommit configuration
let g:YUNOcommit_after = 30

" make MacVIM respect this color configuration
" let macvim_skip_colorscheme=1
colorscheme desert

" I use rspec in rails projects
" projects specific herustics may be configured in .projections.json
let g:projectionist_heuristics = {
      \  "app/models/*.rb": {"alternate": "spec/models/{}_spec.rb"}
      \}
