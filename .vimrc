
"set number

set nocompatible " required
filetype off " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

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
