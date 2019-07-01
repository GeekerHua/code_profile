

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'              "" 左侧目录树
""Plug 'Valloric/MatchTagAlways'          "" 自动查找标签,需要vim支持python，还需要重新编译，太麻烦
""Plugin 'Valloric/YouCompleteMe'
Plug 'docunext/closetag.vim'            "" 自动关闭标签
Plug 'vim-airline/vim-airline'          "" 漂亮的状态栏
Plug 'ryanoasis/vim-devicons'           "" 文件类型icon
Plug 'ryanoasis/vim-devicons'           "" 色值增加对应色背景
Plug 'ybian/smartim'                    "" 自动切换输入法
Plug 'Valloric/YouCompleteMe',{'do':'python3 install.py --all'}

""Plug 'itchyny/lightline.vim'
call plug#end()

filetype plugin on
""set tabstop=4
set number	            "" 显示行号
syntax on               "" 高亮显示
set showmode	        "" 在底部显示当前模式
set showcmd             "" 命令模式下显示指令
set mouse=a             "" 支持鼠标
set expandtab           "" tab转为空格
set autoindent          "" 按下回车键后，下一级缩进与上一级保持一致
set cursorline          "" 光标行高亮
set textwidth=80        "" 一行显示多少字符
set wrap                "" 自动折行
set linebreak           "" 不会在单词内部折行
set wrapmargin=2        "" 折行处于右边缘的空出字符数
set scrolloff=5         "" 垂直滚动预留行数
set sidescrolloff=15    "" 水平滚动预留字符数
set laststatus=2        "" 是否显示状态栏。0 表示不显示，1 表示只在多窗口时显示，2 表示显示。
set ruler               "" 状态栏显示光标位置
set showmatch           "" 高亮另一半标点符号
set hlsearch            "" 高亮显示搜索匹配结果
set ignorecase          "" 搜索忽略大小写
set smartcase           "" 如果同时打开了ignorecase，那么对于只有一个大写字母的搜索词，将大小写敏感；其他情况都是大小写不敏感。比如，搜索Test时，将不匹配test；搜索test时，将匹配Test。
set noerrorbells        "" 出错时不发生响声
"" set visualbell          "" 出错时闪屏
set listchars=tab:»■,trail:■
set list                "" 显示行尾多余的空格
set wildmenu            "" 命令模式下，底部操作指令按下 Tab 键自动补全。第一次按下 Tab，会显示所有匹配的操作指令的清单；第二次按下 Tab，会依次选择各个指令。
set wildmode=longest:list,full
set hlsearch
set t_Co=256            "" 支持256色显示

let g:smartim_default =  'com.apple.keylayout.ABC'         "" 默认英文输入法

" 显示中文帮助
if version >= 603
    set helplang=cn
    set encoding=utf-8
endif

if has("autocmd")
    filetype on
    autocmd FileType ruby setlocal ts=2 sts=2 sw=2 et
    autocmd FileType javascript setlocal ts=5 sts=4 sw=4 noet
endif


