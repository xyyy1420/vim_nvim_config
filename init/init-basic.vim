" Disable parentheses matching depends on system. This way we should address all cases (?)
set noshowmatch
" NoMatchParen " This doesnt work as it belongs to a plugin, which is only loaded _after_ all files are.
" Trying disable MatchParen after loading all plugins
"
function! g:FuckThatMatchParen ()
    if exists(":NoMatchParen")
        :NoMatchParen
    endif
endfunction

augroup plugin_initialize
    autocmd!
    autocmd VimEnter * call FuckThatMatchParen()
augroup END


"----------------------------------------------------------------------
"基础设置
"----------------------------------------------------------------------

"允许退格键删除任何字符
set backspace=indent,eol,start 

"开启鼠标
set mouse=a
set selection=exclusive
set selectmode=mouse,key

"设置命令超时
set ttimeout
set ttimeoutlen=50

"如果在vms系统上不开启backup
if has("vms")
  set nobackup      " do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif

" 保存50行历史
set history=50		

"----------------------------------------------------------------------
" 显示
"----------------------------------------------------------------------
"设置显示制表符等隐藏字符
set list
"总是显示状态栏
set laststatus=2
"设置命令行高度为2
set cmdheight=2
"设置显示行号
set number
"总是显示状态栏
set signcolumn=yes
"总是显示标签栏
set showtabline=2
"右下角显示命令
set showcmd
"显示当前行行号
set ruler
"设置终端256色
set t_Co=256
"设置黑色背景
set background=dark

set termguicolors
"设置颜色主题
"colorscheme ayu move to init_plugin.vim 
"colorscheme nightfox
"colorscheme nightfly 
"colorscheme oxocarbon
"colorscheme tokyonight-night 

"set guifont=DroidSansMono_Nerd_Font:h10
set guifont=Sarasa_Mono_SC_Nerd:h14

"修改默认注释颜色
"hi Comment ctermfg=DarkCya

set cursorline
hi CursorLine cterm=NONE ctermbg=darkred ctermfg=white

" 设置光标位于屏幕上下10行距离，除非是上界和下界
set scrolloff=10

"----------------------------------------------------------------------
"缩进
"----------------------------------------------------------------------
"设置缩进和智能缩进，会根据上一行自动缩进下一行，如果下一行空置会自动删除缩进
"set cindent
"set autoindent
"set smartindent
"set indentexpr
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab


"----------------------------------------------------------------------
"搜索
"----------------------------------------------------------------------

" 搜索时忽略大小写
set ignorecase
" 智能搜索大小写判断，默认忽略大小写，除非搜索内容包含大写字母
set smartcase
" 查找输入时动态增量显示查找结果
set incsearch

"----------------------------------------------------------------------
"编码设置
"----------------------------------------------------------------------

if has('multi_byte')
    set fileencodings=ucs-bom,utf-8,cp936,gbk,gb18030,big5,euc-jp,latin1
    set fileencoding=utf-8
    set encoding=utf-8
    set termencoding=utf-8
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
    "显示括号匹配
    set showmatch
    " 高亮搜索内容
    set hlsearch
    syntax enable
    syntax on

endif

"----------------------------------------------------------------------
" 其他设置
"----------------------------------------------------------------------
"
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
"set listchars=tab:\|\ ,trail:.,extends:>,precedes:<

set listchars=tab:>-,trail:-

" 如遇Unicode值大于255的文本，不必等到空格再折行
set formatoptions+=m
" 合并两行中文时，不在中间加空格
set formatoptions+=B

"set fileformats=unix,doc,mac

"----------------------------------------------------------------------
" 代码折叠
"----------------------------------------------------------------------

if has('folding')
"    set foldenable
"    set fdm=indent
"    set foldlevel=99
    nnoremap <space> za
endif

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
set wildignore+=*.txt,*.log


"----------------------------------------------------------------------
" 文件备份
"----------------------------------------------------------------------

silent! call mkdir(expand('~/.vim/backup'),"p",0755)
silent! call mkdir(expand('~/.vim/swap'),"p",0755)
" 备份由backup和writebackup来确定，创建备份的位置由backupskip backupcopy backupdir 和backupext来确定

" backup 打开vim会删除所有旧备份，为当前文件创建备份
set backup

" writebackup打开，vim会在编辑会话期间，创建一个备份，退出会话编辑，就会删除
set writebackup

"设置backupfile的目录
set backupdir=~/.vim/backup
"设置swapfile的目录
set directory=~/.vim/swap
"设置backup文件后缀
set backupext=.bak

"无交换文件
set noswapfile
"无撤销历史文件
set noundofile

"----------------------------------------------------------------------
" 其他设置
"----------------------------------------------------------------------

"set autochdir

"工作目录下的文件搜索
"set path+=,,


if $TMUX != ''
    set ttimeoutlen=30
elseif $ttimeoutlen > 80 || &ttimeoutlen <=0
    set ttimeoutlen=80
endif

"恢复到上一次关闭时光标位置
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

