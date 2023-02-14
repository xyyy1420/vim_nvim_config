-- require("lspsaga").setup()
require("mason").setup({
    pip = {
        -- Whether to upgrade pip to the latest version in the virtual environment before installing packages.
        upgrade_pip = true,

        -- These args will be added to `pip install` calls. Note that setting extra args might impact intended behavior
        -- and is not recommended.
        --
        -- Example: { "--proxy", "https://proxyserver" }
        install_args = {},
    },
    -- Controls to which degree logs are written to the log file. It's useful to set this to vim.log.levels.DEBUG when
    -- debugging issues with package installations.
    log_level = vim.log.levels.INFO,
    -- Limit for the maximum amount of packages to be installed at the same time. Once this limit is reached, any further
    -- packages that are requested to be installed will be put in a queue.
    max_concurrent_installers = 4,
    github = {
        -- The template URL to use when downloading assets from GitHub.
        -- The placeholders are the following (in order):
        -- 1. The repository (e.g. "rust-lang/rust-analyzer")
        -- 2. The release version (e.g. "v0.3.0")
        -- 3. The asset name (e.g. "rust-analyzer-v0.3.0-x86_64-unknown-linux-gnu.tar.gz")
        download_url_template = "https://github.com/%s/releases/download/%s/%s",
    },
    -- The provider implementations to use for resolving package metadata (latest version, available versions, etc.).
    -- Accepts multiple entries, where later entries will be used as fallback should prior providers fail.
    -- Builtin providers are:
    --   - mason.providers.registry-api (default) - uses the https://api.mason-registry.dev API
    --   - mason.providers.client                 - uses only client-side tooling to resolve metadata
    providers = {
        "mason.providers.registry-api",
        "mason.providers.client"
    },
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
            apply_language_filter = "<C-f>",
        },
    },
})
require("mason-lspconfig").setup({
    automatic_installation = true,
})

local lsp_on_attach = function(client, bufnr)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'gh', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    -- vim.keymap.set('n', '<space>wl', function()
    -- print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    -- end, bufopts)
    -- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    -- vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("mason-lspconfig").setup_handlers {
    function(server_name)
        require("lspconfig")[server_name].setup { on_attach = lsp_on_attach, capabilities = capabilities }
    end,
}
--local capabilities = vim.lsp.protocol.make_client_capabilities()
--capabilities.offsetEncoding = { "utf-16" }
--require("lspconfig").clangd.setup({ capabilities = capabilities, on_attach = lsp_on_attach })
