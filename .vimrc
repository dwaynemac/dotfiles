execute pathogen#infect()
execute pathogen#helptags()

syntax on                               " show syantax hightlight
filetype plugin indent on

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
set ruler                               " show row and column in footer
set scrolloff=2                         " minimun lines above/below cursor

set laststatus=2                        " always show status bar
set statusline=%f%m%r%h%w\ %{fugitive#statusline()}\ [%l,%c]\ [%L,%p%%]

set clipboard=unnamed                   " use the system clipboard

set wildmenu                            " enable bash style tab completion
set wildmode=list:longest,full

" highlight the status bar when in insert mode
if version >= 700
  au InsertEnter * hi StatusLine ctermfg=235 ctermbg=2
  au InsertLeave * hi StatusLine ctermbg=240 ctermfg=12
endif

let mapleader = ","

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

" Run specs with ',t' via Gary Bernhardt
function! RunTests(filename)
  " Write the file and run tests for the given filename
  :w
  if match(a:filename, '\.feature$') != -1
    call ExecThis("script/features " . a:filename)
  elseif match(a:filename, '_test\.rb$') != -1
    call ExecThis("ruby -Itest " . a:filename)
  else
    if filereadable("script/test")
      call ExecThis("script/test " . a:filename)
    elseif filereadable("Gemfile")
      call ExecThis("bundle exec rspec --color " . a:filename)
    else
      call ExecThis("rspec --color " . a:filename)
    end
  end
endfunction

" wrap expression execution for easier vmux, etc, integration
function! ExecThis(expression)
  let a:use_vimux = 1
  if a:use_vimux == 1
    " run in vimux
    let g:VimuxOrientation = "h" 
    let g:VimuxHeight = "40"
    call VimuxRunCommand(a:expression)
  else
    " run in vim's pane
    :silent !clear
    exec ":!" . a:expression
  end
endfunction

function! SetTestFile()
  " Set the spec file that tests will be run for.
  let t:grb_test_file=@%
endfunction

function! RunTestFile(...)
  if a:0
    let command_suffix = a:1
  else
    let command_suffix = ""
  endif

  " Run the tests for the previously-marked file.
  let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\|_test.rb\)$') != -1
  if in_test_file
    call SetTestFile()
  elseif !exists("t:grb_test_file")
    return
  end
  call RunTests(t:grb_test_file . command_suffix)
endfunction

function! RunNearestTest()
  let spec_line_number = line('.')
  call RunTestFile(":" . spec_line_number . " -b")
endfunction

" run test runner
map <leader>t :call RunTestFile()<cr>
map <leader>T :call RunNearestTest()<cr>

" open in github commit over which's hash caret is standing on
:command Greview exec ":!git review <cword>"

" open directory of gem of given name
:command -nargs=1 Rgem exec "e `bundle show <args>`"
