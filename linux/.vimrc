" 基础显示与交互
set background=dark     " 适配深色终端
set incsearch           " 输入搜索内容时实时跳转
set scrolloff=5         " 光标上下保留 5 行视野，避免紧贴边缘
set mouse=a             " 开启鼠标支持 (iTerm2 中按住 Option 键可临时恢复系统选择)
set number              " 显示行号，方便定位
set cursorline          " 高亮当前行，视觉更清晰

" 输入法与按键优化
set ttimeout            " 开启功能键超时检测
set ttimeoutlen=100     " 解决 Esc 键延迟问题
set nrformats=bin,hex   " 支持 0b 二进制和 0x 十六进制的增减运算
set langnoremap         " 优化非英文输入法下的模式切换
set nolangremap

" 字符编码
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,gb18030,gbk,default,latin1

" 自动化路径与持久化
" 统一存放在 ~/.vim/cache 目录下，避免污染工作目录
let s:cache_dir = expand('~/.vim/cache')
let s:undo_dir = s:cache_dir . '/undo'
let s:swap_dir = s:cache_dir . '/swap'
let s:back_dir = s:cache_dir . '/backup'

" 自动创建不存在的目录
if !isdirectory(s:cache_dir) | call mkdir(s:cache_dir, "p") | endif
if !isdirectory(s:undo_dir)  | call mkdir(s:undo_dir, "p")  | endif
if !isdirectory(s:swap_dir)  | call mkdir(s:swap_dir, "p")  | endif
if !isdirectory(s:back_dir)  | call mkdir(s:back_dir, "p")  | endif

set undofile " 开启持久化撤销
let &undodir = s:undo_dir . '//'
let &directory = s:swap_dir . '//'
let &backupdir = s:back_dir . '//'

" 文件处理与补全
set display=truncate " 长行截断显示
set suffixes=.bak,~,.o,.info,.swp,.aux,.bbl,.blg,.brf,.cb,.dvi,.idx,.ilg,.ind,.inx,.jpg,.log,.out,.png,.toc

" 语法高亮
if has("syntax")
  syntax on
endif

" 自动缩进
filetype plugin indent on
set expandtab " 用空格代替 Tab
set tabstop=4
set shiftwidth=4
