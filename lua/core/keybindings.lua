require "helpers/globals"
require "helpers/keyboard"

g.mapleader = '\\'                                                                 -- Use Space, like key for alternative hotkeys

-- LSP {{{
nm('K', '<cmd>lua vim.lsp.buf.hover()<CR>' )                                      -- Hover object
nm('ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')                                -- Code actions
nm('gR', '<cmd>lua vim.lsp.buf.rename()<CR>')                                     -- Rename an object
nm('gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')                                -- Go to declaration
 -- }}}

-- Telescope {{{
nm('gd', "<cmd>lua require('fzf-lua').lsp_definitions({jump_to_single_result=true})<CR>")                            -- Goto declaration
nm('<leader>p', '<cmd>FzfLua oldfiles<CR>')                                   -- Show recent files
nm('<leader>O', '<cmd>FzfLua git_files<CR>')                                  -- Search for a file in project
nm('<leader>o', '<cmd>FzfLua files<CR>')                                 -- Search for a file (ignoring git-ignore)
nm('<leader>i', '<cmd>FzfLua jumps<CR>')                                   -- Show jumplist (previous locations)
nm('<leader>b', '<cmd>FzfLua git_branches<CR>')                               -- Show git branches
nm('<leader>f', '<cmd>FzfLua live_grep<CR>')                                  -- Find a string in project
nm('<leader>q', '<cmd>FzfLua buffers<CR>')                                    -- Show all buffers
nm('<leader>a', '<cmd>FzfLua<CR>')                                            -- Show all commands
--nm('<leader>t', '<cmd>Telescope lsp_dynamic_workspace_symbols<CR>')              -- Search for dynamic symbols
-- }}}

-- Trouble {{{
nm('<leader>x', '<cmd>TroubleToggle<CR>')                                         -- Show all problems in project (with help of LSP)
nm('gr', '<cmd>Trouble lsp_references<CR>')                                       -- Show use of object in project
-- }}}

-- insert mode set Emacs {{{
im('<C-a>','<home>')
im('<C-e>','<end>')
im('<C-d>','<del>')
im('<C-_>','<C-k>')
-- }}}

-- CTRL+HJKL -> l d u r{{{
nm('<C-h>','<left>')
nm('<C-j>','<down>')
nm('<C-k>','<up>')
nm('<C-l>','<right>')
im('<C-h>','<left>')
im('<C-j>','<down>')
im('<C-k>','<up>')
im('<C-l>','<right>')
-- }}}

-- leader tabe{{{
nm('<leader>1','<esc>1gt<cr>')
nm('<leader>2','<esc>2gt<cr>')
nm('<leader>3','<esc>3gt<cr>')
nm('<leader>4','<esc>4gt<cr>')
nm('<leader>5','<esc>5gt<cr>')
nm('<leader>6','<esc>6gt<cr>')
nm('<leader>7','<esc>7gt<cr>')
nm('<leader>8','<esc>8gt<cr>')
nm('<leader>9','<esc>9gt<cr>')
nm('<leader>0','<esc>10gt<cr>')
--}}}

vim.api.nvim_set_keymap('n','<leader>z',"<cmd>lua require'centerpad'.toggle{leftpad=120,rightpad=120}<cr>",{silent=true,noremap=true})


-- vim:tabstop=2 shiftwidth=2 expandtab syntax=lua foldmethod=marker foldlevelstart=0 foldlevel=0
