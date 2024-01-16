" 这是一行注释

set tabstop=4   "按下 Tab 键时，Vim 显示的空格数。
set shiftwidth=4    "在文本上按下>>（增加缩进）、<<（取消缩进）或者==（取消全部缩进）时，每一级的字符数。
set expandtab    "将 Tab 转为空格
set softtabstop=4    "Tab 转为多少个空格

" 自动缩进
set autoindent
set smartindent

set number   " 显示行号
set cursorline    " 突出显示当前行
set wrap    "自动折行，即太长的行分成几行显示。
set linebreak    "只有遇到指定的符号（如空格、连词号和其他标点符号），才发生折行，不会在单词内部折行。
set textwidth=80    "设置行宽
set relativenumber    "显示光标所在的当前行的行号，其他行都为相对于该行的相对行号。
set scrolloff=5    "垂直滚动时，光标距离顶部/底部的位置（单位：行）。
set laststatus=2    "是否显示状态栏。0 表示不显示，1 表示只在多窗口时显示，2 表示显示。

set ruler    "在状态栏显示光标的当前位置（位于哪一行哪一列）。
set showmode    "在底部显示，当前处于命令模式还是插入模式。
set showcmd    " 显示命令

set nocompatible   " 不与 Vi 兼容（采用 Vim 自己的操作命令）
syntax enable    " 语法高亮
set mouse=a    " 鼠标可用

" 配色方案
set t_Co=256
set background=dark
colorscheme desert

set showmatch    "光标遇到圆括号、方括号、大括号时，自动高亮对应的另一个括号。
set hlsearch    "搜索时，高亮显示匹配结果。
set incsearch    "输入搜索模式时，每输入一个字符，就自动跳到第一个匹配的结果。
set ignorecase    "搜索时忽略大小写。
set smartcase    "如果打开了ignorecase，那么对于只有一个大写字母的搜索词，将大小写敏感；其他大小写不敏感

set spell spelllang=en_us    "打开英语单词的拼写检查。
set nobackup    "不创建备份文件。默认文件保存时，会额外创建一个备份，文件名是在原文件名的末尾添加一个波浪号
set noswapfile    "不创建交换文件。交换文件主要用于系统崩溃时恢复文件，文件名的开头是.、结尾是.swp
set undofile    "保留撤销历史。

"设置备份文件、交换文件、操作历史文件的保存位置。
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//
set undodir=~/.vim/.undo//

set noerrorbells    "出错时，不要发出响声。
set visualbell    "出错时，发出视觉提示，通常是屏幕闪烁。
set history=1000    "Vim 需要记住多少次历史操作。
set autoread    "打开文件监视。在编辑过程中文件发生外部改变（如被别的编辑器编辑了），就会发出提示。

"如果行尾有多余的空格（包括 Tab 键），该配置将让这些空格显示成可见的小方块。
set listchars=tab:»■,trail:■
set list

"命令模式下，底部操作指令按下 Tab 键自动补全。第一次按下 Tab，会显示所有匹配的操作指令的清单；第二次按下 Tab，会依次选择各个指令。
set wildmenu
set wildmode=longest:list,full


" 注意：这里设置使用 Ctrl + 上下左右来切换窗口，请查看官方文档来自定义
nnoremap <C-Down> <C-W><C-J>
nnoremap <C-Up> <C-W><C-K>
nnoremap <C-Left> <C-W><C-H>
nnoremap <C-Right> <C-W><C-L>

map <T> :MBEbp<CR>
map <R> :MBEbn<CR>

"Enable folding
set foldmethod=indent
set foldlevel=99

"Enable folding with the spacebar
nnoremap <space> za


filetype off " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'VundleVim/YouCompleteMe'


" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
" All of your Plugins must be added before the following line
call vundle#end() " required
filetype plugin indent on " required

"添加 tagbar 插件
Plugin 'majutsushi/tagbar'

" 配置 tagbar 插件
let g:tagbar_ctags_bin='ctags' "ctags 程序的路径
let g:tagbar_width=30 "窗口宽度设置为 30
let g:tagbar_left=0 "设置在 vim 左边显示
let g:tagbar_map_openfold = "zv" "按 zv 组合键打开标签，默认 zc 关闭标签

"如果是 C 语言的程序的话，tagbar 自动开启
autocmd BufReadPost .cpp,.c,.h,.hpp,.cc,.cxx call tagbar#autoopen()

"我设置 F2 为打开或者关闭的快捷键，根据你的习惯更改
nnoremap <silent> <F2> :TagbarToggle<CR>

"添加 nerdtree 插件
Plugin 'scrooloose/nerdtree'

" 配置 nerdtree 插件，
let NERDTreeWinPos='left' "设置在 vim 左侧显示
let NERDTreeWinSize=30 "设置宽度为 30
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

autocmd vimenter * NERDTree

wincmd w

autocmd VimEnter * wincmd w

autocmd StdinReadPre * let s:std_in=1

autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

autocmd StdinReadPre * let s:std_in=1

autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" 我设置 F3 为打开或者关闭的快捷键，你可以自定义
map <F3> :NERDTreeToggle<CR>
wincmd w

autocmd VimEnter * wincmd w

autocmd StdinReadPre * let s:std_in=1

autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

autocmd StdinReadPre * let s:std_in=1

autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" 我设置 F3 为打开或者关闭的快捷键，你可以自定义
map <F3> :NERDTreeToggle<CR>

" 安装插件
Plugin 'fholgado/minibufexpl.vim'

" 配置插件信息，官方文档提供配置信息
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
let g:miniBufExplMoreThanOne=0


