-- global
-- vim.g global
-- vim.b buffer
-- vim.w windows
-- vim.bo buffer local
-- vim.wo windows-local

-- basic --
-- 允许退格键删除任何字符
vim.o.backspace = indent, eol, start

-- 设置命令超时
vim.o.ttimeout = true
vim.o.ttimeoutlen = 50

-- 保存50行历史
vim.o.history = 50


-- display --

-- 设置显示制表符等隐藏字符
vim.o.list = true
-- 替换制表符显示字符
vim.o.listchars = "tab:>-,trail:-,space:>"
-- 总是显示状态栏
vim.o.laststatus = 2
-- 设置命令行高度为2
vim.o.cmdheight = 2
-- 设置显示行号
vim.wo.number = true
-- 使用相对行号
vim.wo.relativenumber = true
-- 总是显示状态栏
vim.o.signcolumn = true
-- 总是显示标签栏
vim.o.showtabline = 2
-- 右下角显示命令
vim.o.showcmd = true
-- 显示当前行行号
vim.o.ruler = true
-- 设置终端256色
vim.o.t_Co = 256
-- 设置黑色背景
vim.o.background = "dark"
-- 在TUI开启24-bit RGB
vim.o.termguicolors = true
-- jkhl 移动时光标周围保留8行
vim.o.scrolloff = 10
vim.o.sidescrolloff = 10
vim.o.guifont = "Sarasa_Mono_SC_Nerd:h14"
-- 高亮所在行
vim.wo.cursorline = true
-- split window 从下边和右边出现
vim.o.splitbelow = true
vim.o.splitright = true
-- 不可见字符的显示，这里只把空格显示为一个点
vim.o.list = true
vim.o.listchars = "space:·"
-- 永远显示 tabline
vim.o.showtabline = 2


-- encoding --
vim.o.encoding = "UTF-8"
vim.o.fileencoding = 'utf-8'
vim.o.termencoding = utf - 8

-- indent --
-- 设置缩进和智能缩进，会根据上一行自动缩进下一行，如果下一行空置会自动删除缩进
vim.o.smartindent = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

-- search --
-- 搜索时忽略大小写
vim.o.ignorecase = true
-- 智能搜索大小写判断，默认忽略大小写，除非搜索内容包含大写字母
vim.o.smartcase = true
-- 查找输入时动态增量显示查找结果
vim.o.incsearch = true



-- highlight --
vim.o.hlsearch = true


-- complete --
vim.o.wildmenu = true
-- Dont' pass messages to |ins-completin menu|
vim.o.shortmess = vim.o.shortmess .. 'c'
-- 补全最多显示10行
vim.o.pumheight = 10
-- 自动补全不自动选中
vim.g.completeopt = "menu,menuone,noselect,noinsert"

-- autoload --
-- 当文件被外部程序修改时，自动加载
vim.o.autoread = true
vim.bo.autoread = true



-- file backup --
vim.o.backup = true
vim.o.writebackup = true
vim.o.backupdir = "~/.vim/backup"
vim.o.directory = "~/.vim/swap"
vim.o.backupnext = ".bak"
vim.o.noswapfile = true
vim.o.noundofile = true




-- other --
local buf_read_post_function = function()
    if line("'\"") > 1 and line("'\"") <= line("$") then
        exec "normal! g`\""
    end
end

vim.api.nvim_create_autocmd({ "BufReadPost" }, {
    pattern = "*",
    callback = buf_read_post_function,
})


-- 显示左侧图标指示列
vim.wo.signcolumn = "yes"
-- 右侧参考线，超过表示代码太长了，考虑换行
vim.wo.colorcolumn = "80"
-- 缩进2个空格等于一个Tab
vim.o.tabstop = 2
vim.bo.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftround = true
-- >> << 时移动长度
vim.o.shiftwidth = 2
vim.bo.shiftwidth = 2


-- 禁止折行
vim.wo.wrap = false
-- 光标在行首尾时<Left><Right>可以跳到下一行
vim.o.whichwrap = '<,>,[,]'
-- 允许隐藏被修改过的buffer
vim.o.hidden = true

-- smaller updatetime
vim.o.updatetime = 300
