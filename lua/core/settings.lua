--[[
  File: settings.lua
  Description: Base settings for neovim
  Info: Use <zo> and <zc> to open and close foldings
]]

require "helpers/globals"

-- Set associating between turned on plugins and filetype
cmd[[filetype plugin on]]

-- Disable comments on pressing Enter
cmd[[autocmd FileType * setlocal formatoptions-=cro]]

-- Tabs {{{
opt.expandtab = true                -- Use spaces by default
opt.shiftwidth = 2                  -- Set amount of space characters, when we press "<" or ">"
opt.tabstop = 2                     -- 1 tab equal 2 spaces
opt.smartindent = true              -- Turn on smart indentation. See in the docs for more info
-- }}}

-- Clipboard {{{
opt.clipboard = 'unnamedplus' -- Use system clipboard
opt.fixeol = false -- Turn off appending new line in the end of a file
-- }}}

-- Folding {{{
opt.foldmethod = 'syntax'
-- }}}

-- Search {{{
opt.ignorecase = true               -- Ignore case if all characters in lower case
opt.joinspaces = false              -- Join multiple spaces in search
opt.smartcase = true                -- When there is a one capital letter search for exact match
opt.showmatch = true                -- Highlight search instances
-- }}}

-- Window {{{
opt.splitbelow = true               -- Put new windows below current
opt.splitright = true               -- Put new vertical splits to right
-- }}}

-- Wild Menu {{{
opt.wildmenu = true
opt.wildmode = "longest:full,full"
-- }}}

-- Default Plugins {{{
local disabled_built_ins = {
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
    "spellfile_plugin",
    "matchit"
}

for _, plugin in pairs(disabled_built_ins) do
    g["loaded_" .. plugin] = 1
end
-- }}}

-- customs {{{
g.loaded_matchparen = 2

o.noshowmatch = true
-- }}}

-- Timings {{{

o.updatetime = 1000
o.timeout = true
o.timeoutlen = 500
o.ttimeoutlen = 10

-- }}}

-- display {{{
o.list=true
--总是显示状态栏
o.laststatus=2
--设置命令行高度为2
o.cmdheight=1
--设置显示行号
o.number=true
--总是显示标签栏
o.showtabline=2
--右下角显示命令
o.showcmd=true
--显示当前行行号
o.ruler=true
--设置终端256色
o.t_Co=256



  
--}}}

-- Encode {{{
o.fileencoding="utf-8"
o.encoding="utf-8"
o.termencoding="utf-8"
--}}}

vim.opt.spell=true
vim.opt.spelllang={'en_us'}
-- vim: tabstop=2 shiftwidth=2 expandtab syntax=lua foldmethod=marker foldlevelstart=1
