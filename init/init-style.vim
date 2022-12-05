
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
"设置显示制表符等隐藏字符
set list
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
colorscheme nightfox

set guifont=DroidSansMono_Nerd_Font:h10

"修改默认注释颜色
"hi Comment ctermfg=DarkCya

set cursorline
hi CursorLine cterm=NONE ctermbg=darkred ctermfg=white
