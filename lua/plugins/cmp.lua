--[[
  File: cmp.lua
  Description: CMP plugin configuration (with lspconfig)
  See: https://github.com/hrsh7th/nvim-cmp
]]

local has_words_before=function ()
  unpack = unpack or table.unpack
  local line,col=unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0,line-1,line,true)[1]:sub(col,col):match("%s") == nil
end

local cmp = require('cmp')
local lspkind = require('lspkind')
local luasnip = require('luasnip')

cmp.setup{
  snippet = {
    expand = function(args)
      require'luasnip'.lsp_expand(args.body) -- Luasnip expand
    end,
  },

  -- Mappings for cmp
  mapping = {

    -- Autocompletion menu
    ['<C-y>'] = cmp.mapping(cmp.mapping.complete(), { 'i' }),
    -- ['<CR>'] = cmp.config.disable,                      -- Turn off autocomplete on <CR>
    -- ['<CR>'] = cmp.mapping.confirm({select=true}),                      -- Turn off autocomplete on <CR>
    ['<CR>'] = cmp.mapping({
      i=function (fallback)
        if cmp.visible() and cmp.get_active_entry() then
          cmp.confirm({behavior=cmp.ConfirmBehavior.Replace,select=false})
        else
          fallback()
        end
      end,
      s=cmp.mapping.confirm({select = true}),
      c=cmp.mapping.confirm({behavior=cmp.ConfirmBehavior.Replace,select=true}),
    }),                      -- Turn off autocomplete on <CR>

    -- ['<C-y>'] = cmp.mapping.confirm({ select = true }), -- Turn on autocomplete on <C-y>
--     ['<C-y>'] = cmp.config.disable, -- Turn on autocomplete on <C-y>

    -- Use <C-e> to abort autocomplete
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(), -- Abort completion
      c = cmp.mapping.close(), -- Close completion window
    }),

    -- Use <C-p> and <C-n> to navigate through completion variants
    -- ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
    -- ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
    -- ['<Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
    --    ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i' ,'c'}),
    -- ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i','c'}),

    ['<Tab>'] = cmp.mapping(function (fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jumpable()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end,{"i","s"}),
    ['<S-Tab>'] =  cmp.mapping(function (fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end,{"i","s"}),

  },

  sources = cmp.config.sources({
    { name = 'nvim_lsp' },                -- LSP
    { name = 'nvim_lsp_signature_help' }, -- LSP for parameters in functions
    { name = 'nvim_lua' },                -- Lua Neovim API
    { name = 'luasnip' },                 -- Luasnip
    { name = 'buffer' },                  -- Buffers
    { name = 'path' },                    -- Paths
    { name = 'treesitter' },              -- Treesitter
--    { name = "emoji" },                   -- Emoji
  }, {
  }),

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({'/','?'},{
    mapping=cmp.mapping.preset.cmdline(),
    sources={
      {name='buffer'}
    }
  }),

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':',{
    mapping=cmp.mapping.preset.cmdline(),
    sources=cmp.config.sources({
      {name='path'}
    },{
      {name='cmdline'}
    }),
    enabled=function ()
      local disabled={
        IncRename=true
      }
      local cmd=vim.fn.getcmdline():match("%S+")
      return not disabled[cmd] or cmp.close()
    end
  }),

  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol', -- Show only symbol annotations
      maxwidth = 50,   -- Prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
    })
  },
}


-- Add snippets from Friendly Snippets
require("luasnip/loaders/from_vscode").lazy_load()

