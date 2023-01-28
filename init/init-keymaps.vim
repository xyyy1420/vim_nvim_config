"----------------------------------------------------------------------
" 终端下功能键修正
"----------------------------------------------------------------------
"function! s:key_escape(name,code)
"    if has('nvim') == 0 && has('gui_running') == 0
"        exec "set ".a:name."=\e".a:code
"    endif
"endfunc
"
"call s:key_escape('<F1>', 'OP')
"call s:key_escape('<F2>', 'OQ')
"call s:key_escape('<F3>', 'OR')
"call s:key_escape('<F4>', 'OS')
"call s:key_escape('<S-F1>', '[1;2P')
"call s:key_escape('<S-F2>', '[1;2Q')
"call s:key_escape('<S-F3>', '[1;2R')
"call s:key_escape('<S-F4>', '[1;2S')
"call s:key_escape('<S-F5>', '[15;2~')
"call s:key_escape('<S-F6>', '[17;2~')
"call s:key_escape('<S-F7>', '[18;2~')
"call s:key_escape('<S-F8>', '[19;2~')
"call s:key_escape('<S-F9>', '[20;2~')
"call s:key_escape('<S-F10>', '[21;2~')
"call s:key_escape('<S-F11>', '[23;2~')
"call s:key_escape('<S-F12>', '[24;2~')

"----------------------------------------------------------------------
" INSERT 模式下使用 EMACS 键位
"----------------------------------------------------------------------
inoremap <c-a> <home>
inoremap <c-e> <end>
inoremap <c-d> <del>
inoremap <c-_> <c-k>

"----------------------------------------------------------------------
" 设置CTRL+HJKL移动光标
"----------------------------------------------------------------------
noremap <C-h> <left>
noremap <C-j> <down>
noremap <C-k> <up>
noremap <C-l> <right>
inoremap <C-h> <left>
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-l> <right>

"----------------------------------------------------------------------
" 命令 模式下使用 EMACS 键位
"----------------------------------------------------------------------
cnoremap <c-h> <left>
cnoremap <c-j> <down>
cnoremap <c-k> <up>
cnoremap <c-l> <right>

"----------------------------------------------------------------------
" NORMAL模式的tab切换
"----------------------------------------------------------------------
noremap <silent><leader>tc :tabnew<cr>
noremap <silent><leader>tq :tabclose<cr>
noremap <silent><leader>tn :tabnext<cr>
noremap <silent><leader>tp :tabprev<cr>
noremap <silent><leader>to :tabonly<cr>

function! Tab_MoveLeft()
    let l:tabnr = tabpagenr() - 2
    if l:tabnr >= 0
        exec 'tabmove '.l:tabnr
    endif
endfunc

function! Tab_MoveRight()
    let l:tabnr = tabpagenr() + 1
    if l:tabnr <= tabpagenr('$')
        exec 'tabmove '.l:tabnr
    endif
endfunc

noremap <silent><leader>tl :call Tab_MoveLeft()<cr>
noremap <silent><leader>tr :call Tab_MoveRight()<cr>
noremap <silent><m-left> :call Tab_MoveLeft()<cr>
noremap <silent><m-right> :call Tab_MoveRight()<cr>

"----------------------------------------------------------------------
" 设置数字键切换tab 
"----------------------------------------------------------------------
noremap <silent><leader>1 <esc>1gt<cr>
noremap <silent><leader>2 <esc>2gt<cr>
noremap <silent><leader>3 <esc>3gt<cr>
noremap <silent><leader>4 <esc>4gt<cr>
noremap <silent><leader>5 <esc>5gt<cr>
noremap <silent><leader>6 <esc>6gt<cr>
noremap <silent><leader>7 <esc>7gt<cr>
noremap <silent><leader>8 <esc>8gt<cr>
noremap <silent><leader>9 <esc>9gt<cr>
noremap <silent><leader>0 <esc>10gt<cr>

"----------------------------------------------------------------------
" 设置ALT切换tab 
"----------------------------------------------------------------------
noremap <silent><m-1> :tabn 1<cr>
noremap <silent><m-2> :tabn 2<cr>
noremap <silent><m-3> :tabn 3<cr>
noremap <silent><m-4> :tabn 4<cr>
noremap <silent><m-5> :tabn 5<cr>
noremap <silent><m-6> :tabn 6<cr>
noremap <silent><m-7> :tabn 7<cr>
noremap <silent><m-8> :tabn 8<cr>
noremap <silent><m-9> :tabn 9<cr>
noremap <silent><m-0> :tabn 0<cr>
inoremap <silent><m-1> <ESC>:tabn 1<cr>
inoremap <silent><m-2> <ESC>:tabn 2<cr>
inoremap <silent><m-3> <ESC>:tabn 3<cr>
inoremap <silent><m-4> <ESC>:tabn 4<cr>
inoremap <silent><m-5> <ESC>:tabn 5<cr>
inoremap <silent><m-6> <ESC>:tabn 6<cr>
inoremap <silent><m-7> <ESC>:tabn 7<cr>
inoremap <silent><m-8> <ESC>:tabn 8<cr>
inoremap <silent><m-9> <ESC>:tabn 9<cr>
inoremap <silent><m-0> <ESC>:tabn 0<cr>

"----------------------------------------------------------------------
" 快速打开vim配置文件，并在保存时刷新vim
"----------------------------------------------------------------------
map <silent> <Leader>ss :source ~/.vimrc<cr>
map <silent> <Leader>ee :e ~/.vimrc<cr>
autocmd! bufwritepost .vimrc source ~/.vimrc

"----------------------------------------------------------------------
" 快速打开buffers
"----------------------------------------------------------------------
"noremap <silent><leader>b :buffers<cr>

"----------------------------------------------------------------------
" 快速保存会话
"----------------------------------------------------------------------
noremap <silent><leader>mks :mksession Session.vim<cr>
noremap <silent><leader>sas :mks!<cr>

"----------------------------------------------------------------------
" 映射\y为保存选中内容到临时文件中 \p恢复出来
"----------------------------------------------------------------------
vmap <leader>y :w! /tmp/vitmp<CR>
nmap <leader>p :r /tmp/vitmp<CR>


"----------------------------------------------------------------------
" 映射符号表查找键位
"----------------------------------------------------------------------
"noremap <silent> <leader>gs :GscopeFind s <C-R><C-W><cr>
"noremap <silent> <leader>gg :GscopeFind g <C-R><C-W><cr>
"noremap <silent> <leader>gc :GscopeFind c <C-R><C-W><cr>
"noremap <silent> <leader>gt :GscopeFind t <C-R><C-W><cr>
"noremap <silent> <leader>ge :GscopeFind e <C-R><C-W><cr>
"noremap <silent> <leader>gf :GscopeFind f <C-R>=expand("<cfile>")<cr><cr>
"noremap <silent> <leader>gi :GscopeFind i <C-R>=expand("<cfile>")<cr><cr>
"noremap <silent> <leader>gd :GscopeFind d <C-R><C-W><cr>
"noremap <silent> <leader>ga :GscopeFind a <C-R><C-W><cr>
"noremap <silent> <leader>gz :GscopeFind z <C-R><C-W><cr>

"使用Ctrl j/k来快速跳转上次或者下次修改的地方
nmap <C-j> <C-i>
nmap <C-k> <C-o>


"每次搜索跳转的时候都将光标处放置在窗口中央
noremap n nzz
noremap N Nzz

"使用Ctrl w +/-的组合键位，来实现上下分屏时的大小
noremap <c-w>+ :res +5<CR>
noremap <c-w>- :res -5<CR>
