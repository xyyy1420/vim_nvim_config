"  init-plugins.vim Author "xyyy <xyyy1420@gmail.com>" Date 04.11.2022

"----------------------------------------------------------------------
" 默认情况下的分组，可以再前面覆盖之
"----------------------------------------------------------------------
if !exists('g:bundle_group')
    let g:bundle_group = ['basic' ]
    let g:bundle_group += [ 'color' ]
    let g:bundle_group += [ 'header' ]

    let g:bundle_group += [ 'g_format' ]
"    let g:bundle_group += [ 'format' ]

    "let g:bundle_group += [ 'coc' ]
    let g:bundle_group += [ 'pandoc' ]
    let g:bundle_group += [ 'fzf' ]

    let g:bundle_group += [ 'markdown_preview']

    if has('nvim')
        let g:bundle_group += [ 'treesitter' ]
        let g:bundle_group += [ 'telescope' ]
        let g:bundle_group += [ 'toggleterm' ]
        let g:bundle_group += [ 'harpoon' ]
        let g:bundle_group += [ 'fcitx' ]
        let g:bundle_group += [ 'todo-comments' ]
        let g:bundle_group += [ 'formater' ]
"        let g:bundle_group += [ 'task' ]
    endif

"    let g:bundle_group+=['comment']
    let g:bundle_group+=['navigator']
    let g:bundle_group+=['mason']
    let g:bundle_group+=['coq']
"    let g:bundle_group+=['null-ls']
"    let g:bundle_group+=['trouble']

    if has ('vim')
        let g:bundle_group += [ 'ui' ]
        let g:bundle_group += [ 'tags' ]
        let g:bundle_group += [ 'async' ]
    endif

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

    "快速移动
    Plug 'easymotion/vim-easymotion'
    let g:EasyMotion_do_mapping=0
    nmap s <Plug>(easymotion-overwin-f)
    nmap s <Plug>(easymotion-overwin-f2)

    let g:EasyMotion_smartcase=1

    map <leader>l <Plug>(easymotion-lineforward)
    map <leader>j <Plug>(easymotion-j)
    map <leader>k <Plug>(easymotion-k)
    map <leader>h <Plug>(easymotion-linebackward)
    map <leader>w <Plug>(easymotion-w)
    map <leader>b <Plug>(easymotion-b)
    let g:EasyMotion_startofline=0
    let g:EasyMotion_smartcase=1
"    map / <Plug>(easymotion-sn)
"    omap / <Plug>(easymotion-tn)

    " 注释
    Plug 'numToStr/Comment.nvim'


endif

"----------------------------------------------------------------------
" 搜索插件 
"----------------------------------------------------------------------
if index(g:bundle_group,'fzf')>=0
    Plug 'junegunn/fzf',{'do':{ -> fzf#install() }}
    Plug 'junegunn/fzf.vim'
    Plug 'yuki-yano/fzf-preview.vim',{'branch':'release/rpc'}

    "开启预览窗口
    let g:fzf_preview_window = ['right,50%','ctrl-/']
    " Commands : -------------------------
    " Files
    " GFiles
    " GFiles?
    " Buffers
    " Colors
    " Ag
    " Rg
    " Lines
    " BLines
    " Tags
    " BTags
    " Marks
    " Windows
    " Locate
    " History
    " History:
    " History/
    " Snippets
    " Commits
    " ------------------------------------


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
    if has('nvim')
        "Plug 'folke/tokyonight.nvim',{'branch':'main'}
        Plug 'EdenEast/nightfox.nvim'
        Plug 'bluz71/vim-nightfly-colors'
    else
        Plug 'ayu-theme/ayu-vim'
        let ayucolor="mirage"
    endif
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

    "提供保存时的自动格式化，分别调用对应的格式化程序
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

"nvim特有的格式化，需要逐个语言配置，工作量较大，还在放置
if index(g:bundle_group,'neoformat')>=0
    Plug 'sbdchd/neoformat'
    let g:neoformat_enabled_python = ['autopep8','yapf','docformatter']
    let g:neoformat_enabled_c=['astyle']
    let g:neoformat_enabled_cpp=['astyle']
    let g:neoformat_enabled_go=['gofmt']
endif

"自行配置的clang格式化，还没完成
if index(g:bundle_group,'format')>=0

    "因为是在从缓冲区写入文件之前执行函数，所以如果该文件第一次在vim中创建，该
    "文件实际还不存在，所以会出错，所以这里做了调整，但是这种情况下需要保存两
    "次才能实现格式化，还有待调整 TODO 修复二次保存才能格式化这个BUG
    "如果能通用几份clang-format配置来格式化所有的文件就好了

    function! Formatonsave()
        if filereadable(expand('%:p'))
            let l:formatdiff = 1
            py3f /usr/share/clang/clang-format.py
        endif
    endfunc

    if filereadable("./.clang-format")
        autocmd BufWritePre *.h,*.c call Formatonsave()
    endif
endif

"----------------------------------------------------------------------
" tag插件 仅在vim环境中使用，而且没有经过完整的调整，问题比较多
"----------------------------------------------------------------------
if index(g:bundle_group,'tags')>=0
    Plug 'skywind3000/vim-gutentags'
    Plug 'skywind3000/gutentags_plus'

"    let $GTAGSLABEL = 'native-pygments'
"    let $GTAGSCONF = '/usr/share/gtags/gtags.conf'

    let g:gutentags_project_root = ['.root','.git']
    let g:gutentags_ctags_tagfile = '.tags'

    let g:gutentags_cache_dir = expand('~/.cache/tags')

    let g:gutentags_modules=[]
"
    if executable('ctags')
        let g:gutentags_modules += ['ctags']
    endif
"
    if executable('gtags') && executable('gtags-cscope')
        let g:gutentags_modules += ['gtags_cscope']
    endif

"    let g:gutentags_ctags_extra_args=['--gtagslabel=pygments']
"    let g:gutentags_ctags_extra_args+=['--fields=+niazS','--extra=+q']
"    let g:gutentags_ctags_extra_args+=['--c++-kinds=+px']
"    let g:gutentags_ctags_extra_args+=['--c-kinds=+px']

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

    " fine this gtags plugin die 
    
endif


"----------------------------------------------------------------------
" 异步运行 vim模式下的异步运行，nvim中有原生的
"----------------------------------------------------------------------
if index(g:bundle_group,'async')>=0
    Plug 'skywind3000/asyncrun.vim'
    let g:asyncrun_open = 8
endif


"----------------------------------------------------------------------
" COC补全
"----------------------------------------------------------------------
if index(g:bundle_group,'coc')>=0

    Plug 'neoclide/coc.nvim',{'branch':'release'}
    set updatetime=300
    set signcolumn=yes


    inoremap <silent><expr> <TAB>
          \ coc#pum#visible() ? coc#pum#next(1) :
          \ CheckBackspace() ? "\<Tab>" :
          \ coc#refresh()
    inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

    " Make <CR> to accept selected completion item or notify coc.nvim to format
    " <C-g>u breaks current undo, please make your own choice.
    inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                                  \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

    function! CheckBackspace() abort
        let col=col('.') - 1
        return !col || getline('.')[col-1] =~# '\s'
    endfunction

"    inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
"    inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
"    inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
"    inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"
    let g:coc_snippet_next = '<C-j>'
    let g:coc_snippet_prev = '<C-k>'

    nmap <silent> [g <Plug>(coc-diagnosis-prev)
    nmap <silent> ]g <Plug>(coc-diagnosis-next)

    if has('nvim')
        inoremap <silent><expr> <c-space> coc#refresh()
    else
        inoremap <silent><expr> <c-@> coc#refresh()
    endif

"	 使用telescope-coc插件替代了这部分功能
"    nmap <silent> <leader>gd <Plug>(coc-definition)
"    nmap <silent> <leader>gy <Plug>(coc-type-definition)
"    nmap <silent> <leader>gi <Plug>(coc-implementation)
"    nmap <silent> <leader>gr <Plug>(coc-reference)

    function! ShowDocumentation()
        if CocAction('hasProvider','hover')
            call CocActionAsync('doHover')
        else
            call feedkeys('K','in')
        endif
    endfunction
    nnoremap <silent> K :call ShowDocumentation()<CR>

    autocmd CursorHold * silent call CocActionAsync('highlight')
    
    "autocmd FileType json syntax match Comment +\/\/.\+$+

    if has('nvim-0.4.0') || has('patch-8.2.0750')
        nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
        nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
        inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
        inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
        vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
        vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    endif

endif

"----------------------------------------------------------------------
" PANDOC插件
"----------------------------------------------------------------------
if index(g:bundle_group,'pandoc')>=0
    Plug 'vim-pandoc/vim-pandoc'
    Plug 'vim-pandoc/vim-pandoc-syntax'
    let g:pandoc#modules#disabled=['spell']
endif



"----------------------------------------------------------------------
" NVIM特有插件
"----------------------------------------------------------------------
if has('nvim')

    "nvim语法解析器 配置文件treesitter.lua
    if index(g:bundle_group,'treesitter')>=0
        Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    endif

    "一个高度可扩展的列表模糊查找器，配置文件 telescope.lua
    if index(g:bundle_group,'telescope')>=0

        "nvim的一个库
        Plug 'nvim-lua/plenary.nvim'
        "来自vim中popup api的nvim库，将提供与vim兼容的popup api
        Plug 'nvim-lua/popup.nvim'
        "telescope本体
        Plug 'nvim-telescope/telescope.nvim',{'tag':'0.1.x'}
        "原生的fzf支持，用于提高telescope搜索速度
        Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
        nnoremap <leader>ff <cmd>Telescope find_files<cr>
        nnoremap <leader>fg <cmd>Telescope live_grep<cr>
        nnoremap <leader>fb <cmd>Telescope buffers<cr>
        nnoremap <leader>ft <cmd>Telescope help_tags<cr>
        nnoremap <leader>fz <cmd>Telescope zoxide list<cr>

        "与coc联动的插件，主要用于代码导航
        if index(g:bundle_group,'coc')>=0
            Plug 'fannheyward/telescope-coc.nvim'
            nmap <silent> <leader>gm :Telescope coc mru<CR>
            nmap <silent> <leader>gl :Telescope coc locations<CR>
            nmap <silent> <leader>gr :Telescope coc references<CR>
            nmap <silent> <leader>gd :Telescope coc definitions<CR>
        "    nmap <silent> <leader>gd :Telescope coc declarations<CR>
            nmap <silent> <leader>gi :Telescope coc implementations<CR>
            nmap <silent> <leader>gt :Telescope coc type_definitions<CR>
        endif

        "与zoxide联动的插件，主要提供对zoxide数据库搜索功能 快捷键leader fz
        Plug 'jvgrootveld/telescope-zoxide'

    endif

    "用于在nvim中编辑的期间开启多个可切换的终端，配置文件toggleterm.lua
    if index(g:bundle_group,"toggleterm")>=0 
        Plug 'akinsho/toggleterm.nvim'
    endif

    "用于nvim中task管理
    if index(g:bundle_group,"task")>=0 
        Plug 'jedrzejboczar/toggletasks.nvim'
    endif


"    Plug 'da-moon/telescope-toggleterm.nvim'
    "Telescope toggleterm << command open buffers with toggleterm which opened before
    
    if index(g:bundle_group,'markdown_preview')>=0
        Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
        let g:mkdp_auto_start=0
        let g:mkdp_auto_close=1
        let g:mkdp_refresh_slow=0
        let g:mkdp_open_to_the_world=0
    endif


    if index(g:bundle_group,'harpoon')>=0
        Plug 'ThePrimeagen/harpoon'
        nmap <silent> <leader>ga :lua require("harpoon.mark").add_file()<CR>
        nmap <silent> <leader>gm :lua require("harpoon.ui").toggle_quick_menu()<CR>
        nmap <silent> <leader>nn :lua require("harpoon.ui").nav_next()<CR>
        nmap <silent> <leader>np :lua require("harpoon.ui").nav_prev()<CR>
    endif


    "自动中英文切换
    if index(g:bundle_group,'fcitx')>=0
        Plug 'h-hg/fcitx.nvim'
    endif

    if index(g:bundle_group,'navigator')>=0
        Plug 'neovim/nvim-lspconfig'
        Plug 'ray-x/guihua.lua', {'do': 'cd lua/fzy && make' }
        Plug 'ray-x/navigator.lua'
    endif
   
    if index(g:bundle_group,'mason')>=0
        Plug 'williamboman/mason.nvim'
        Plug 'williamboman/mason-lspconfig.nvim'
        Plug 'neovim/nvim-lspconfig'
    endif

    if index(g:bundle_group,'coq')>=0
        Plug 'ms-jpq/coq_nvim',{'branch':'coq'}
        Plug 'ms-jpq/coq.artifacts',{'branch':'artifacts'}
"        Plug 'ms-jpq/coq.thirdparty',{'branch':'3p'}
    endif

    if index(g:bundle_group,'null-ls')>=0
        Plug 'jose-elias-alvarez/null-ls.nvim'
        Plug 'jay-babu/mason-null-ls.nvim'
    endif

    if index(g:bundle_group,'trouble')>=0
        Plug 'nvim-tree/nvim-web-devicons'
        Plug 'folke/trouble.nvim'
    endif
 
    if index(g:bundle_group,'todo-comments')>=0
        Plug 'nvim-lua/plenary.nvim'
        Plug 'folke/todo-comments.nvim'
    endif   

    if index(g:bundle_group,'formater')>=0
        Plug 'mhartington/formatter.nvim'
    endif

    Plug 'lewis6991/hover.nvim'

    "Plug 'Wansmer/treesj'

endif


call plug#end()

if has('nvim')
    if index(g:bundle_group,'treesitter')>=0
        source ~/jxy_vim/init/nvim_plug_config/treesitter.lua
    endif

    if index(g:bundle_group,'color')>=0
        source ~/jxy_vim/init/nvim_plug_config/nightfox.lua
    endif

    if index(g:bundle_group,'telescope')>=0 
        source ~/jxy_vim/init/nvim_plug_config/telescope.lua
    endif

    if index(g:bundle_group,'toggleterm')>=0 
        source ~/jxy_vim/init/nvim_plug_config/toggleterm.lua
    endif

    if index(g:bundle_group,'task')>=0
        source ~/jxy_vim/init/nvim_plug_config/toggletasks.lua
    endif

    " source ~/jxy_vim/init/telescope_mappings.lua
    if index(g:bundle_group,'comment')>=0
        source ~/jxy_vim/init/nvim_plug_config/comment.lua
    endif
    " 配置编辑中，还没完成
    "     source ~/jxy_vim/init/treesj.lua

    if index(g:bundle_group,'navigator')>=0
        source ~/jxy_vim/init/nvim_plug_config/nvim_navigator.lua
    endif

    if index(g:bundle_group,'mason')>=0
        source ~/jxy_vim/init/nvim_plug_config/nvim_mason.lua
    endif

    if index(g:bundle_group,'coq')>=0
        source ~/jxy_vim/init/nvim_plug_config/nvim_coq_settings.lua
    endif

    if index(g:bundle_group,'null-ls')>=0
        source ~/jxy_vim/init/nvim_plug_config/nvim_mason_null.lua
        source ~/jxy_vim/init/nvim_plug_config/nvim_null_ls.lua
    endif

    if index(g:bundle_group,'trouble')>=0
        source ~/jxy_vim/init/nvim_plug_config/nvim_trouble.lua
    endif
 
    " HACK:
    " NOTE:
    " TODO:
    if index(g:bundle_group,'todo-comments')>=0
        source ~/jxy_vim/init/nvim_plug_config/nvim_todo_comments.lua
    endif   
    if index(g:bundle_group,'formater')>=0
    endif   

    source ~/jxy_vim/init/nvim_plug_config/nvim_hover.lua

    set completeopt=menu,menuone,noselect
endif

