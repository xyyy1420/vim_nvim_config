
let s:home = fnamemodify(resolve(expand('<sfile>:p')),':h:h')

function! s:path(path)
    let path = expand(s:home . '/' . a:path)
    return substitute(path,'\\','/','g')
endfunc


call plug#begin(get(g:,'bundle_home','~/.vim/plugged'))
    Plug 'neovim/nvim-lspconfig'
    Plug 'ray-x/guihua.lua', {'do': 'cd lua/fzy && make' }
    Plug 'ray-x/navigator.lua'
    Plug 'nvim-treesitter/nvim-treesitter'
    Plug 'williamboman/mason.nvim'
    Plug 'williamboman/mason-lspconfig.nvim'

    Plug 'ms-jpq/coq_nvim',{'branch':'coq'}
    Plug 'ms-jpq/coq.artifacts',{'branch':'artifacts'}
    Plug 'ms-jpq/coq.thirdparty',{'branch':'3p'}

    "配置中
    Plug 'jose-elias-alvarez/null-ls.nvim'

call plug#end()

source ~/jxy_vim/nvim_navigator.lua

source ~/jxy_vim/nvim_mason.lua

source ~/jxy_vim/nvim_coq.vim

source ~/jxy_vim/nvim_null_ls.lua

set completeopt=menu,menuone,noselect
