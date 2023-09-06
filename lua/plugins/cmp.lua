--[[
  File: cmp.lua
  Description: CMP plugin configuration (with lspconfig)
  See: https://github.com/hrsh7th/nvim-cmp
]] 

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end

local cmp = require('cmp')
local luasnip = require('luasnip')
cmp.setup {
    snippet = {
        expand = function(args)
            require'luasnip'.lsp_expand(args.body) -- Luasnip expand
        end
    },

    preselect = require('cmp').PreselectMode.None,
    complete = {
        completeopt=menu,menuone,noinsert,noselect,
        autocomplete=false,
    },

    -- Mappings for cmp
    mapping = {
        -- Autocompletion menu
        -- ['<C-y>'] = cmp.mapping(cmp.mapping.complete(), {'i'}),
        ['<C-y>'] = cmp.config.disable,
        -- ['<CR>'] = cmp.config.disable,                      -- Turn off autocomplete on <CR>
        -- ['<CR>'] = cmp.mapping.confirm({select=true}),                      -- Turn off autocomplete on <CR>
        ['<CR>'] = cmp.mapping({
            i = function(fallback)
                if cmp.visible() and cmp.get_active_entry() then
                    cmp.confirm({
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = false
                    })
                else
                    fallback()
                end
            end,
            s = cmp.mapping.confirm({select = true}),
            c = cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Replace,
                select = true
            })
        }), -- Turn off autocomplete on <CR>

        -- ['<C-y>'] = cmp.mapping.confirm({ select = true }), -- Turn on autocomplete on <C-y>

        -- Use <C-e> to abort autocomplete
        ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(), -- Abort completion
            c = cmp.mapping.close() -- Close completion window
        }),
  
        ['<C-p>'] = cmp.mapping.disable,
        ['<C-n>'] = cmp.mapping.disable,
        -- Use <C-p> and <C-n> to navigate through completion variants
        -- ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
        -- ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
        -- ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i' ,'c'}),
        -- ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i','c'}),

        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
--            elseif luasnip.expand_or_jumpable() then
--                luasnip.expand_or_jumpable()
--            elseif has_words_before() then
--                cmp.complete()
            else
                fallback()
            end
        end, {"i", "s"}),

        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            --elseif luasnip.jumpable(-1) then
            --    luasnip.jump(-1)
            else
                fallback()
            end
        end, {"i", "s"}),

        ["<C-j>"] = cmp.mapping(function(fallback)
            if luasnip.expand_or_locally_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, {"i", "s"}),
        ["<C-k>"] = cmp.mapping(function(fallback)
            if luasnip.expand_or_locally_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, {"i", "s"})
    },

    sources = cmp.config.sources({
        {name = 'luasnip'}, -- Luasnip
        {name = 'nvim_lsp'}, -- LSP
        {name = 'spell',
            option={
                keep_all_entries=false,
                enable_in_context=function ()
                    return true
                end
            }
        }, -- Spell
        {name = 'nvim_lsp_signature_help'}, -- LSP for parameters in functions
        {name = 'treesitter'}, -- Treesitter
        {name = 'nvim_lua'}, -- Lua Neovim API
        {name = 'buffer',keyword_length=10}, -- Buffers
        {name = 'path'}, -- Paths
   }, {}),

    sorting={
        comparators={
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.score,
            require "cmp-under-comparator".under,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
        }
    }

}

-- Add snippets from Friendly Snippets
require("luasnip/loaders/from_vscode").lazy_load()

