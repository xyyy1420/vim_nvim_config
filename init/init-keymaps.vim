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
" 快速打开vim配置文件，并在保存时刷新vim
"----------------------------------------------------------------------
map <silent> <Leader>ss :source ~/.vimrc<cr>
map <silent> <Leader>ee :e ~/.vimrc<cr>
autocmd! bufwritepost .vimrc source ~/.vimrc

"----------------------------------------------------------------------
" 快速打开buffers 这部分迁移到toggleterm
"----------------------------------------------------------------------
"noremap <silent><leader>b :buffers<cr>

"----------------------------------------------------------------------
" 映射\y为保存选中内容到临时文件中 \p恢复出来
"----------------------------------------------------------------------
vnoremap <leader>y :w! /tmp/vitmp<CR>
nnoremap <leader>p :r /tmp/vitmp<CR>

"使用Ctrl j/k来快速跳转上次或者下次修改的地方
nnoremap <C-j> <C-i>
nnoremap <C-k> <C-o>


"每次搜索跳转的时候都将光标处放置在窗口中央
noremap n nzz
noremap N Nzz

"使用Ctrl w +/-的组合键位，来实现上下分屏时的大小
noremap <c-w>+ :res +5<CR>
noremap <c-w>- :res -5<CR>
