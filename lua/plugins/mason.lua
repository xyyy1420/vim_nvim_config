--[[
  File: mason.lua
  Description: Mason plugin configuration (with lspconfig)
  See: https://github.com/williamboman/mason.nvim
-- ]]
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")

mason.setup({
    pip = {upgrade_pip = true, install_args = {}},
    ui = {
        -- Whether to automatically check for new versions when opening the :Mason window.
        check_outdated_packages_on_open = true,

        -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
        -- border = "none",

        -- -- Width of the window. Accepts:
        -- -- - Integer greater than 1 for fixed width.
        -- -- - Float in the range of 0-1 for a percentage of screen width.
        -- width = 0.8,

        -- -- Height of the window. Accepts:
        -- -- - Integer greater than 1 for fixed height.
        -- -- - Float in the range of 0-1 for a percentage of screen height.
        -- height = 0.9,
        icons = {
            package_installed = "Y",
            package_pending = "P",
            package_uninstalled = "N"
        },
        keymaps = {
            -- Keymap to expand a package
            toggle_package_expand = "<CR>",
            -- Keymap to install the package under the current cursor position
            install_package = "i",
            -- Keymap to reinstall/update the package under the current cursor position
            update_package = "u",
            -- Keymap to check for new version for the package under the current cursor position
            check_package_version = "c",
            -- Keymap to update all installed packages
            update_all_packages = "U",
            -- Keymap to check which installed packages are outdated
            check_outdated_packages = "C",
            -- Keymap to uninstall a package
            uninstall_package = "X",
            -- Keymap to cancel a package installation
            cancel_installation = "<C-c>",
            -- Keymap to apply language filter
            apply_language_filter = "<C-f>"
        }
    }
})

mason_lspconfig.setup({
    automatic_installation = true,
    ensure_installed = {
        "lua_ls", -- LSP for Lua language
        "pyright" -- LSP for Python
    },
    handlers = nil
});

-- local lsp_on_attach = function(client, bufnr)
--     local bufopts = { noremap = true, silent = true, buffer = bufnr }
--     vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
--     vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
--     vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
--     vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
--     vim.keymap.set('n', 'gh', vim.lsp.buf.hover, bufopts)
--     vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
--     vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
--     -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
--     -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
--     -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
--     -- vim.keymap.set('n', '<space>wl', function()
--     -- print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--     -- end, bufopts)
--     -- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
--     -- vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
-- end
-- 
-- local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- local handlers={
--   function (server_name)
--     require("lspconfig")[server_name].setup {
--      on_attach = lsp_on_attach, capabilities = capabilities
--     }
--   end,
-- }
-- 
-- Setup every needed language server in lspconfig

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local handlers = {
    function(server_name)
        --    lspconfig[server_name].setup(require('coq').lsp_ensure_capabilities({}))
        lspconfig[server_name].setup({capabilities = capabilities})
    end
}

mason_lspconfig.setup_handlers(handlers)

