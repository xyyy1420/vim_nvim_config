

if !exists('g:plugin_group')
	let g:plugin_group+=['basic']
	let g:plugin_group+=['format']
	let g:plugin_group+=['coc']
	let g:plugin_group+=['header']
	let g:plugin_group+=['treesitter']
	let g:plugin_group+=['telescope']
	let g:plugin_group+=['toggleterm']
	let g:plugin_group+=['pandoc']
endif


call plug#begin(get(g:,'plugin_home','~/.vim/plugged'))

if index(g:plugin_group,'basic')>=0

	" require set encoding=UTF-8
    Plug 'ryanoasis/vim-devicons'  
    Plug 'easymotion/vim-easymotion'
	"easymotion
	map <leader>l <Plug>(easymotion-lineforward)
	map <leader>j <Plug>(easymotion-j)
	map <leader>k <Plug>(easymotion-k)
	map <leader>h <Plug>(easymotion-linebackward)
	map <leader>w <Plug>(easymotion-w)
	map f <Plug>(easymotion-f)
	let g:EasyMotion_startofline=0
	let g:EasyMotion_smartcase=1
	"end

endif

if index(g:plugin_group,'format')>=0
endif

if index(g:plugin_group,'coc')>=0
endif

if index(g:plugin_group,'header')>=0
endif

if index(g:plugin_group,'treesitter')>=0
	if has('nvim')
	endif
endif

if index(g:plugin_group,'telescope')>=0
	if has('nvim')
	endif
endif

if index(g:plugin_group,'toggleterm')>=0
	if has('nvim')
	endif
endif

if index(g:plugin_group,'pandoc')>=0

endif

call plug#end()
