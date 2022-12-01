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

