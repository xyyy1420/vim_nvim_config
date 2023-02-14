"  init-plugins.vim Author "xyyy <xyyy1420@gmail.com>" Date 04.11.2022

"----------------------------------------------------------------------
" 默认情况下的分组，可以再前面覆盖之
"----------------------------------------------------------------------
if !exists('g:bundle_group')
    let g:bundle_group = ['basic' ]
    let g:bundle_group += [ 'color' ]
    let g:bundle_group += [ 'header' ]

    let g:bundle_group += [ 'pandoc' ]
    let g:bundle_group += [ 'fzf' ]

    let g:bundle_group += [ 'markdown_preview']

    let g:bundle_group += [ 'treesitter' ]
    let g:bundle_group += [ 'telescope' ]
    let g:bundle_group += [ 'toggleterm' ]
    let g:bundle_group += [ 'harpoon' ]
    let g:bundle_group += [ 'fcitx' ]
    let g:bundle_group += [ 'todo-comments' ]
"        let g:bundle_group += [ 'lspsaga' ]
"        let g:bundle_group += [ 'task' ]

"    let g:bundle_group+=['comment']
    let g:bundle_group+=['mason']
    let g:bundle_group+=['nvim_cmp']
    let g:bundle_group+=['null-ls']
    let g:bundle_group+=['indent_blankline']
    let g:bundle_group+=['registers']

"    let g:bundle_group+=['autopairs']

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
    Plug 'ggandor/leap.nvim'
    Plug 'tpope/vim-repeat'

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
" vim主题插件 
"----------------------------------------------------------------------
if index(g:bundle_group,'color')>=0
    Plug 'EdenEast/nightfox.nvim'
    Plug 'bluz71/vim-nightfly-colors'
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
" PANDOC插件
"----------------------------------------------------------------------
if index(g:bundle_group,'pandoc')>=0
    Plug 'vim-pandoc/vim-pandoc'
    Plug 'vim-pandoc/vim-pandoc-syntax'
    let g:pandoc#modules#disabled=['spell']
endif

"----------------------------------------------------------------------
" NVIM
"----------------------------------------------------------------------

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


if index(g:bundle_group,'mason')>=0
    Plug 'williamboman/mason.nvim'
    Plug 'williamboman/mason-lspconfig.nvim'
    Plug 'neovim/nvim-lspconfig'
endif


if index(g:bundle_group,'null-ls')>=0
    Plug 'nvim-lua/plenary.nvim'
    Plug 'jose-elias-alvarez/null-ls.nvim'
    Plug 'jay-babu/mason-null-ls.nvim'
endif

if index(g:bundle_group,'todo-comments')>=0
    Plug 'nvim-lua/plenary.nvim'
    Plug 'folke/todo-comments.nvim'
endif   


if index(g:bundle_group,'nvim_cmp')>=0
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'

    " For vsnip users.
    Plug 'hrsh7th/cmp-vsnip'
    Plug 'hrsh7th/vim-vsnip'

    " For luasnip users.
    "Plug 'L3MON4D3/LuaSnip'
    "Plug 'saadparwaiz1/cmp_luasnip'

    " For ultisnips users.
    "Plug 'SirVer/ultisnips'
    "Plug 'quangnguyen30192/cmp-nvim-ultisnips'

    " For snippy users.
    " Plug 'dcampos/nvim-snippy'
    " Plug 'dcampos/cmp-snippy'
endif

if index(g:bundle_group,'indent_blankline')>=0
    Plug 'lukas-reineke/indent-blankline.nvim'
endif

if index(g:bundle_group,'lspsaga')>=0
    Plug 'glepnir/lspsaga.nvim'
endif

if index(g:bundle_group,'autopairs')>=0
    Plug 'windwp/nvim-autopairs'
endif

if index(g:bundle_group,'registers')>=0
    Plug 'tversteeg/registers.nvim'
endif


"Plug 'Wansmer/treesj'



call plug#end()

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

if index(g:bundle_group,'comment')>=0
    source ~/jxy_vim/init/nvim_plug_config/comment.lua
endif

if index(g:bundle_group,'mason')>=0
    source ~/jxy_vim/init/nvim_plug_config/nvim_mason.lua
endif


if index(g:bundle_group,'null-ls')>=0
    source ~/jxy_vim/init/nvim_plug_config/nvim_mason_null.lua
    source ~/jxy_vim/init/nvim_plug_config/nvim_null_ls.lua
endif

if index(g:bundle_group,'todo-comments')>=0
    source ~/jxy_vim/init/nvim_plug_config/nvim_todo_comments.lua
endif   

if index(g:bundle_group,'nvim_cmp')>=0
    set completeopt=menu,menuone,noselect
    source ~/jxy_vim/init/nvim_plug_config/nvim_cmp.lua
endif   


"TODO:配置leap移动
if index(g:bundle_group,'basic')>=0
    source ~/jxy_vim/init/nvim_plug_config/nvim_leap.lua

endif

if index(g:bundle_group,'indent_blankline')>=0
    source ~/jxy_vim/init/nvim_plug_config/nvim_indent_blank.lua
endif

if index(g:bundle_group,'autopairs')>=0
    source ~/jxy_vim/init/nvim_plug_config/nvim_autopairs.lua
endif


if index(g:bundle_group,'registers')>=0
    source ~/jxy_vim/init/nvim_plug_config/nvim_registers.lua
endif


" 配置编辑中，还没完成
"     source ~/jxy_vim/init/treesj.lua

