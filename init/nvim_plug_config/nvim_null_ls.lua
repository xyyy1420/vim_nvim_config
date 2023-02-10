local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting
local code_actions = null_ls.builtins.code_actions
local diagnostics = null_ls.builtins.diagnostics
local hover = null_ls.builtins.hover
local completion = null_ls.builtins.completion

null_ls.setup({
	debug = false,
	sources = {
		diagnostics.markdownlint,
        formatting.astyle,
        formatting.autopep8,
        formatting.beautysh,
        completion.vsnip,
		formatting.prettier.with({
			filetypes = { "go", "markdown","rust", "c", "cpp", "python", "lua", "json" },
		}),
	},
	on_attach = function(client)
		if client.server_capabilities.documentFormattingProvider then
			vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format()")
		end
	end,
})
