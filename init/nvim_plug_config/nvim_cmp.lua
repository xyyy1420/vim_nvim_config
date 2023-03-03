-- Set up nvim-cmp.
local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

local cmp = require("cmp")

local luasnip = require("luasnip")

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
    },
    window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete({}),

        ["<CR>"] = cmp.mapping.confirm({
            select = false,
            behavior = cmp.ConfirmBehavior.Replace,
        }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.

        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),


        --["<C-j>"] = cmp.mapping(function(_)
        --    if vim.fn["vsnip#available"](1) == 1 then
        --        feedkey("<Plug>(vsnip-expand-or-jump)", "")
        --    end
        --end, { "i", "s" }),

        --["<C-h>"] = cmp.mapping(function()
        --    if vim.fn["vsnip#jumpable"]( -1) == 1 then
        --        feedkey("<Plug>(vsnip-jump-prev)", "")
        --    end
        --end, { "i", "s" }),


        ["<C-j>"] = cmp.mapping(function(fallback)
            -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
            -- they way you will only jump inside the snippet region
            if luasnip.expand_or_locally_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),

        ["<C-k>"] = cmp.mapping(function(fallback)
            if luasnip.jumpable( -1) then
                luasnip.jump( -1)
            else
                fallback()
            end
        end, { "i", "s" }),

    }),
    -- mapping = cmp.mapping.preset.insert({
    --  ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    --  ['<C-f>'] = cmp.mapping.scroll_docs(4),
    --  ['<C-Space>'] = cmp.mapping.complete(),
    --  ['<C-e>'] = cmp.mapping.abort(),
    --  ['<CR>'] = cmp.mapping.confirm({ select = true,behavior = cmp.ConfirmBehavior.Replace }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    -- }),
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        --{ name = "vsnip" }, -- For vsnip users.
        { name = 'luasnip' }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
        { name = "path",    option = {} },

    }, {
        { name = "buffer" }
    }),
})
