--[[
  File: treesitter.lua
  Description: Configuration of tree-sitter
  See: https://github.com/tree-sitter/tree-sitter
]]
require'nvim-treesitter.configs'.setup {

  -- Needed parsers
  ensure_installed = {
    "lua",
    "python",
    "c",
    "rust",
    "cpp"
  },

  -- Install all parsers synchronously
  sync_install = true,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,


  -- Подсветка
  highlight = {
    -- Enabling highlight for all files
    enable = true,
    additional_vim_regex_highlighting = false,
    disable = {},
  },

  indent = {
    -- Disabling indentation for all files
    enable = true,
    disable = {},
  },
}
