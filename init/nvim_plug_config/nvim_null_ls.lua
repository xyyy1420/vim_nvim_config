local null_ls=require('null-ls')
local formatting=null_ls.builtins.formatting

null_ls.setup({
    debug=false,
    sources={
        formatting.shfmt,

        formatting.stylua,
        formatting.prettier.with({
            filetypes={
                "go",
                "rust",
                "c",
                "cpp",
                "python",
                "lua",
                "json",

            }
        })
    },
    on_attach=function (client)
        if client.resolved_capabilities.document_formatting then
            vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
        end
    end,

})
