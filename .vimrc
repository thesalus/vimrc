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
set showcmd

" Enable mouse usage in term
set mouse=a
set ttymouse=xterm2

" Exclude files and directories
set wildignore+=*.swp,*.zip,*.gz,*.tar,*.so

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the curors - when moving vertical..
set so=7

set wildmenu "Turn on WiLd menu
set wildmode=longest:full

set ruler "Always show current position

set cmdheight=2 "The commandbar height

set nu

set paste
set hlsearch "Highlight search items

set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set t_Co=256 " Explicitly tell Vim that the terminal supports 256 colors

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable "Enable syntax hl

" Set font according to system
set gfn=Monospace\ 10
set shell=/bin/bash

let g:solarized_termcolors=256
if has("gui_running")
  set background=light
else
  set background=dark
endif
colorscheme solarized

set encoding=utf-8
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
set wrapmargin=80
"set colorcolumn=80

set lbr
set tw=500

" Folding settings
set foldmethod=indent       " fold based on indent
set foldnestmax=3           " deepest fold is 3 levels
set nofoldenable            " dont fold by default

" Put special characaters in when tabs, leading, or trailing space are found.
set list listchars=tab:▸\ ,trail:⋅,nbsp:⋅,extends:>,precedes:<

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

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

" Switch windows with ctrl + hjkl
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

nmap <F4> :TagbarToggle<CR>
map <F5> :bp<CR><CR>
map <F6> :bn<CR><CR>

map <leader>cd :cd %:p:h<cr>

nnoremap <leader>gs :Gstatus<CR><C-W>15+
nnoremap <leader>t :CtrlP<CR>
" Close the buffer and select the next best candidate
nnoremap <leader>w :bp<bar>sp<bar>bn<bar>bd<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Set options for plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:CommandTAlwaysShowDotFiles = 0
let g:NERDTreeShowHidden = 1
let g:nerdtree_tabs_open_on_console_startup = 0

" ctrlp Settings
let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
" Map backspace to delete character before cursor
let g:ctrlp_prompt_mappings = {
	\ 'PrtBS()': ['<c-h>'],
	\ 'PrtCurLeft()': ['<left>'],
	\ }

autocmd vimenter * EnableGitGutter
autocmd vimenter * wincmd p
"autocmd vimenter * TagbarOpen
