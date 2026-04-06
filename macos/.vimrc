set background=dark
set incsearch
set scrolloff=5
set mouse=a
set number
set cursorline

set ttimeout
set ttimeoutlen=100
set nrformats=bin,hex
set langnoremap
set nolangremap

set encoding=utf-8
set fileencodings=ucs-bom,utf-8,gb18030,gbk,default,latin1

let s:cache_dir = expand('~/.vim/cache')
let s:undo_dir = s:cache_dir . '/undo'
let s:swap_dir = s:cache_dir . '/swap'
let s:back_dir = s:cache_dir . '/backup'

if !isdirectory(s:cache_dir) | call mkdir(s:cache_dir, "p") | endif
if !isdirectory(s:undo_dir)  | call mkdir(s:undo_dir, "p")  | endif
if !isdirectory(s:swap_dir)  | call mkdir(s:swap_dir, "p")  | endif
if !isdirectory(s:back_dir)  | call mkdir(s:back_dir, "p")  | endif

set undofile
let &undodir = s:undo_dir . '//'
let &directory = s:swap_dir . '//'
let &backupdir = s:back_dir . '//'

set display=truncate
set suffixes=.bak,~,.o,.info,.swp,.aux,.bbl,.blg,.brf,.cb,.dvi,.idx,.ilg,.ind,.inx,.jpg,.log,.out,.png,.toc

if has("syntax")
  syntax on
endif

filetype plugin indent on
set expandtab
set tabstop=4
set shiftwidth=4
