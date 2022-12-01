"  init-plugins.vim Author "xyyy <xyyy1420@gmail.com>" Date 04.11.2022

"----------------------------------------------------------------------
" 默认情况下的分组，可以再前面覆盖之
"----------------------------------------------------------------------
if !exists('g:bundle_group')
    let g:bundle_group = ['basic' ]
    let g:bundle_group += [ 'format' ]
    let g:bundle_group += [ 'search' ]
    let g:bundle_group += [ 'color' ]
    let g:bundle_group += [ 'header' ]
    let g:bundle_group += [ 'async' ]
    let g:bundle_group += [ 'ui' ]
    let g:bundle_group += [ 'leaderf' ]
    let g:bundle_group += [ 'coc' ]
endif

let s:home = fnamemodify(resolve(expand('<sfile>:p')),':h:h')

function! s:path(path)
    let path = expand(s:home . '/' . a:path)
    return substitute(path,'\\','/','g')
endfunc


call plug#begin(get(g:,'bundle_home','~/.vim/plugged'))

"----------------------------------------------------------------------
" 基础插件
"----------------------------------------------------------------------
if index(g:bundle_group,'basic')>=0
    Plug 'ryanoasis/vim-devicons'
    Plug 'easymotion/vim-easymotion'
    let g:EasyMotion_do_mapping=0
    nmap s <Plug>(easymotion-overwin-f)
    nmap s <Plug>(easymotion-overwin-f2)

    let g:EasyMotion_smartcase=1

    map <leader>j <Plug>(easymotion-j)
    map <leader>k <Plug>(easymotion-k)

    map / <Plug>(easymotion-sn)
    omap / <Plug>(easymotion-tn)


    Plug 'justinmk/vim-syntax-extra'


endif

"----------------------------------------------------------------------
" 搜索插件 
"----------------------------------------------------------------------
if index(g:bundle_group,'search')>=0
    Plug 'junegunn/fzf',{'do':{ -> fzf#install() }}
    Plug 'junegunn/fzf.vim'

    let g:fzf_preview_window = ['right,50%','ctrl-/']


endif

"----------------------------------------------------------------------
" quickui插件 
"----------------------------------------------------------------------
if index(g:bundle_group,'ui')>=0
    Plug 'skywind3000/vim-quickui'
    let g:quickui_color_scheme = 'papercol dark'
    function! TermExit(code)
        echom "Terminal exit code: ".a:code
    endfunc
    let opts={'w':80,'h':14,'callback':'TermExit','border':1}
    let opts.title='Terminal'

    "leader sh 开一个终端窗口
    noremap <leader>sh :call quickui#terminal#open('fish',opts)<cr>

    "根据tag预览定义
    "nnoremap <F3> :call quickui#tools#preview_tag('')<cr>

    nnoremap <leader>b :call quickui#tools#list_buffer('tabedit')<cr>
    "esc/ctrl+[退出
    "enter用switchbuf规则打开
    "Space用switchbuf规则打开
    "ctrl+e 在当前窗口中编辑
    "ctrl+x 在新的拆分中打开
    "ctrl+] 在新的垂直拆分中拆分
    "ctrl+t 在新的标签页打开
    "ctrl+g 用:drop打开
    "/搜索
    "?向后搜索

endif

"----------------------------------------------------------------------
" vim主题插件 
"----------------------------------------------------------------------
if index(g:bundle_group,'color')>=0
    Plug 'ayu-theme/ayu-vim'
    let ayucolor="mirage"
endif

"----------------------------------------------------------------------
"  作者信息插件 
"----------------------------------------------------------------------
if index(g:bundle_group,'header')>=0
    Plug 'alpertuna/vim-header'
    let g:header_field_author='xyyy'
    let g:header_field_author_email='xyyy1420@gmail.com'
    map <c-e> :AddMinHeader<CR>
endif

"----------------------------------------------------------------------
" 利用clang-format格式化的插件，格式化文件在项目目录 
"----------------------------------------------------------------------

if index(g:bundle_group,'g_format')>=0
    Plug 'google/vim-maktaba'
    Plug 'google/vim-codefmt'
    Plug 'google/vim-glaive'

    augroup autoformat_settings
      autocmd FileType bzl AutoFormatBuffer buildifier
      autocmd FileType c,cpp,proto,javascript,arduino AutoFormatBuffer clang-format
      autocmd FileType dart AutoFormatBuffer dartfmt
      autocmd FileType go AutoFormatBuffer gofmt
      autocmd FileType gn AutoFormatBuffer gn
      autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
      autocmd FileType java AutoFormatBuffer google-java-format
      autocmd FileType python AutoFormatBuffer yapf
      " Alternative: autocmd FileType python AutoFormatBuffer autopep8
      autocmd FileType rust AutoFormatBuffer rustfmt
      autocmd FileType vue AutoFormatBuffer prettier
      autocmd FileType swift AutoFormatBuffer swift-format
    augroup END

endif


if index(g:bundle_group,'format')>=0

    "因为是在从缓冲区写入文件之前执行函数，所以如果该文件第一次在vim中创建，该
    "文件实际还不存在，所以会出错，所以这里做了调整，但是这种情况下需要保存两
    "次才能实现格式化，还有待调整 TODO 修复二次保存才能格式化这个BUG
    function! Formatonsave()
        if filereadable(".clang-format")
            if filereadable(expand('%:p'))
                let l:formatdiff = 1
                py3f /usr/share/clang/clang-format.py
            endif
        endif
    endfunc

    autocmd BufWritePre *.h,*.c,*.cpp call Formatonsave()
endif



"----------------------------------------------------------------------
" tag插件 
"----------------------------------------------------------------------
if index(g:bundle_group,'tags')>=0
    Plug 'skywind3000/vim-gutentags'
    Plug 'skywind3000/gutentags_plus'

    let $GTAGSLABEL = 'native-pygments'
    let $GTAGSCONF = '/usr/share/gtags/gtags.conf'

    let g:gutentags_project_root = ['.root']
    let g:gutentags_ctags_tagfile = '.tags'

    let g:gutentags_cache_dir = expand('~/.cache/tags')

    let g:gutentags_modules=[]

    if executable('ctags')
        let g:gutentags_modules += ['ctags']
    endif

    if executable('gtags') && executable('gtags-cscope')
        let g:gutentags_modules += ['gtags_cscope']
    endif

    let g:gutentags_ctags_extra_args=[]
    let g:gutentags_ctags_extra_args=['--fields=+niazS','--extra=+q']
    let g:gutentags_ctags_extra_args+=['--c++-kinds=+px']
    let g:gutentags_ctags_extra_args+=['--c-kinds=+px']

    let g:gutentags_auto_add_gtags_cscope=0
    "禁用默认键盘映射
    let g:gutentags_plus_nomap = 1

    "查找当前符号
    noremap <silent> <leader>gs :GscopeFind s <C-R><C-W><cr>
    "查找当前定义
    noremap <silent> <leader>gg :GscopeFind g <C-R><C-W><cr>
    "查找调用该函数的函数
    noremap <silent> <leader>gc :GscopeFind c <C-R><C-W><cr>
    "查找这个文本字符串
    noremap <silent> <leader>gt :GscopeFind t <C-R><C-W><cr>
    "查找这个egrep的模式串
    noremap <silent> <leader>ge :GscopeFind e <C-R><C-W><cr>
    "查找这个文件
    noremap <silent> <leader>gf :GscopeFind f <C-R>=expand("<cfile>")<cr><cr>
    "查找包含这个文件的文件
    noremap <silent> <leader>gi :GscopeFind i <C-R>=expand("<cfile>")<cr><cr>
    "查找这个函数调用的函数
    noremap <silent> <leader>gd :GscopeFind d <C-R><C-W><cr>
    "查找分配了当前符号的位置
    noremap <silent> <leader>ga :GscopeFind a <C-R><C-W><cr>
    "在ctags数据库中查找当前单词
    noremap <silent> <leader>gz :GscopeFind z <C-R><C-W><cr>
    "let g:gutentags_define_advanced_commands = 1
    let g:gutentags_define_advanced_commands = 1
    
endif


"----------------------------------------------------------------------
" 异步运行 
"----------------------------------------------------------------------
if index(g:bundle_group,'async')>=0
    Plug 'skywind3000/asyncrun.vim'
    let g:asyncrun_open = 8
endif

"----------------------------------------------------------------------
" 模糊搜索LeaderF 
"----------------------------------------------------------------------
if index(g:bundle_group,'leaderf')>=0
    Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }

    " 字体和图标显示
"    let g:Lf_ShowDevIcons = 1
"    let g:Lf_DevIconsFont = "DroidSansMono Nerd Font Mono"

    set ambiwidth=double

    " 窗口显示方式为弹出，支持预览
    let g:Lf_WindowPosition = 'popup'
    let g:Lf_PreviewInPopup =1

    let g:Lf_ShortcutF = "<leader>ff"
    " 不需要search buffer，因为已经使用quickui来搜索buffer了
    "noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s","")<CR><CR>
    noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
    noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
    "noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>
    noremap <leader>fr <esc>:Rg<CR>

    noremap <C-B> :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR><CR>
    noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR><CR>
" Leaderf virsual mode search visually selected text literally
    xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR><CR>
    noremap go :<C-U>Leaderf! rg --recall<CR><CR>

" LeaderF - Gtags
    let g:Lf_GtagsAutoGenerate = 1
    let g:Lf_Gtagslabel = 'native-pygments'
    let g:Lf_RootMarkers = ['.git','.hg','.svn','.proj']
    noremap <leader>jr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
    noremap <leader>jd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
    noremap <leader>jo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
    noremap <leader>jn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
    noremap <leader>jp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>
    noremap <leader>fg :<C-U><C-R>=printf("Leaderf gtags --all")<CR><CR>
    noremap <leader>fu :<C-U><C-R>=printf("Leaderf gtags --update")<CR><CR>

" LeaderF - snippet
"//    Plug 'skywind3000/LeaderF-snippet'
"//    Plug 'Sirver/ultisnips'
"//    Plug 'honza/vim-snippets'
"//    let g:UltiSnipsExpandTrigger="<>"
"//
"//    let g:Lf_PreviewResult = get(g:, 'Lf_PreviewResult',{})
"//    let g:Lf_PreviewResult.snippet = 1
"//    noremap <leader>fs :<C-U><C-R>=printf("Leaderf snippet")<CR><CR>
    " Leaderf man
    let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': 'DroidSansMono Nerd Font Mono' }
endif


"----------------------------------------------------------------------
" COC补全
"----------------------------------------------------------------------
if index(g:bundle_group,'coc')>=0
    Plug 'neoclide/coc.nvim',{'branch':'release'}
    set updatetime=300
    set signcolumn=yes

    inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
    inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
    inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
    inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"


    let g:coc_snippet_next = '<C-j>'
    let g:coc_snippet_prev = '<C-k>'
    "autocmd FileType json syntax match Comment +\/\/.\+$+

endif

call plug#end()
