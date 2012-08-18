"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call pathogen#infect()

" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugin
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Enable mouse usage in term
set mouse=a
set ttymouse=xterm2

" Fast saving
nmap <leader>w :w!<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the curors - when moving vertical..
set so=7

set wildmenu "Turn on WiLd menu
set wildmode=longest:full

set ruler "Always show current position

set cmdheight=2 "The commandbar height

se nu

set paste

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable "Enable syntax hl

" Set font according to system
set gfn=Monospace\ 10
set shell=/bin/bash

if has("gui_running")
  set guioptions-=T
  set t_Co=256
  set background=dark
  colorscheme peaksea
else
  colorscheme zellner
  set background=dark

endif

set encoding=utf8
try
    lang en_US
catch
endtry

set ffs=unix,dos,mac "Default file types

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set expandtab
set shiftwidth=4
set tabstop=4
set smarttab
set expandtab
set wrapmargin=80
"set colorcolumn=80

set lbr
set tw=500

" Folding settings
set foldmethod=indent       " fold based on indent
set foldnestmax=3           " deepest fold is 3 levels
"set nofoldenable            " dont fold by default

" Put special characaters in when tabs, leading, or trailing space are found.
set list listchars=tab:▸\ ,trail:⋅,nbsp:⋅
" Put special characters when wrap is off and line continues beyond right edge.
set listchars=extends:>,precedes:<

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines
"Python
set tabstop=4
set shiftwidth=4

" Find file in current directory and edit it.
function! Find(name)
  let l:list=system("find . -name '*".substitute(a:name, ' ', '*', 'g')."*' | perl -ne 'print \"$.\\t$_\"'")
  let l:num=strlen(substitute(l:list, "[^\n]", "", "g"))
  if l:num < 1
    echo "'".a:name."' not found"
    return
  endif
  if l:num != 1
    echo l:list
    let l:input=input("Which ? (CR=nothing)\n")
    if strlen(l:input)==0
      return
    endif
    if strlen(substitute(l:input, "[0-9]", "", "g"))>0
      echo "Not a number"
      return
    endif
    if l:input<1 || l:input>l:num
      echo "Out of range"
      return
    endif
    let l:line=matchstr("\n".l:list, "\n".l:input."\t[^\n]*")
  else
    let l:line=l:list
  endif
  let l:line=substitute(l:line, "^[^\t]*\t./", "", "")
  execute ":e ".l:line
endfunction
command! -nargs=1 Find :call Find("<args>")

" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vimrc

set showmatch "Show matching bracets when text indicator is over them

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map space to / (search) and c-space to ? (backgwards search)
map <space> /
map <c-space> ?
map <silent> <leader><cr> :noh<cr>

" Disable navigation via arrow keys to learn hjkl
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

map <F3> :NERDTreeToggle<CR><CR>
nmap <F4> :TagbarToggle<CR>
map <F5> :bp<CR><CR>
map <F6> :bn<CR><CR>

map <leader>cd :cd %:p:h<cr>
