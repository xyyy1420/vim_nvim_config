"----------------------------------------------------------------------
"基础设置
"----------------------------------------------------------------------

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

"按C语言格式缩进
set cindent
set autoindent
set smartindent
set shiftwidth=4

"开启鼠标
set mouse=a
set selection=exclusive
set selectmode=mouse,key


set ttimeout
set ttimeoutlen=50

"set list

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif

set history=50		" keep 50 lines of command line history
set showcmd		" display incomplete commands

" 设置光标永远在屏幕中间行，除非是上界和下界
set so=7

"----------------------------------------------------------------------
"搜索
"----------------------------------------------------------------------

" 搜索时忽略大小写
set ignorecase
" 智能搜索大小写判断，默认忽略大小写，除非搜索内容包含大写字母
set smartcase
" 高亮搜索内容
set hlsearch
" 查找输入时动态增量显示查找结果
set incsearch

"----------------------------------------------------------------------
"编码设置
"----------------------------------------------------------------------

if has('multi_byte')
    set encoding=utf-8
    set fileencoding=utf-8
    set fileencodings=ucs-bom,utf-8,gbk,gb18030,big5,euc-jp,latin1
endif

"----------------------------------------------------------------------
" 允许vim使用自带的脚本根据文件类型自动设置缩进
"----------------------------------------------------------------------
if has('autocmd')
    filetype plugin indent on
endif

"----------------------------------------------------------------------
" 语法高亮设置
"----------------------------------------------------------------------

if has('syntax')
    syntax enable
    syntax on
endif

"----------------------------------------------------------------------
" 其他设置
"----------------------------------------------------------------------
"
"显示括号匹配
set showmatch
"括号匹配显示时间为1(单位是十分之一秒)
set matchtime=1
" 显示最后一行
"set display=lastline
" 允许下方显示目录
set wildmenu
" 延迟绘制（提升性能）
"set lazyredraw
" 错误格式

" 显示Tab符，使用一高亮竖线代替
set list
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<
"set listchars=tab:>-,trail:-

" 如遇Unicode值大于255的文本，不必等到空格再折行
set formatoptions+=m
" 合并两行中文时，不在中间加空格
set formatoptions+=B

"set fileformats=unix,doc,mac

"----------------------------------------------------------------------
" 代码折叠
"----------------------------------------------------------------------

"if has('folding')
"    set foldenable
"    set fdm=indent
"    set foldlevel=99
"endif

"----------------------------------------------------------------------
" 文件搜索和补全时忽略下面扩展名
"----------------------------------------------------------------------
set suffixes=.bak,~,.o,.h,.info,.swp,.obj,.pyc,.pyo,.egg-info,.class

set wildignore=*.o,*.obj,*~,*.exe,*.a,*.pdb,*.lib "stuff to ignore when tab completing
set wildignore+=*.so,*.dll,*.swp,*.egg,*.jar,*.class,*.pyc,*.pyo,*.bin,*.dex
set wildignore+=*.zip,*.7z,*.rar,*.gz,*.tar,*.gzip,*.bz2,*.tgz,*.xz    " MacOSX/Linux
set wildignore+=*DS_Store*,*.ipch
set wildignore+=*.gem
set wildignore+=*.png,*.jpg,*.gif,*.bmp,*.tga,*.pcx,*.ppm,*.img,*.iso
set wildignore+=*.so,*.swp,*.zip,*/.Trash/**,*.pdf,*.dmg,*/.rbenv/**
set wildignore+=*/.nx/**,*.app,*.git,.git
set wildignore+=*.wav,*.mp3,*.ogg,*.pcm
set wildignore+=*.mht,*.suo,*.sdf,*.jnlp
set wildignore+=*.chm,*.epub,*.pdf,*.mobi,*.ttf
set wildignore+=*.mp4,*.avi,*.flv,*.mov,*.mkv,*.swf,*.swc
set wildignore+=*.ppt,*.pptx,*.docx,*.xlt,*.xls,*.xlsx,*.odt,*.wps
set wildignore+=*.msi,*.crx,*.deb,*.vfd,*.apk,*.ipa,*.bin,*.msu
set wildignore+=*.gba,*.sfc,*.078,*.nds,*.smd,*.smc
set wildignore+=*.linux2,*.win32,*.darwin,*.freebsd,*.linux,*.android


"set autochdir

set backup

set writebackup

set backupdir=~/.vim/tmp

set backupext=.bak

set noswapfile

set noundofile

set ts=4
set expandtab

silent! call mkdir(expand('~/.vim/tmp'),"p",0755)

"工作目录下的文件搜索
set path+=,,


if $TMUX != ''
    set ttimeoutlen=30
elseif $ttimeoutlen > 80 || &ttimeoutlen <=0
    set ttimeoutlen=80
endif


autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

"augroup InitFileTypesGroup
"    au!
"    au FileType c,cpp setlocal commentstring=//\ %s
"
"    au FileType markdown setlocal wrap
"
"    au FileType qf setlocal number
"
"augroup END

