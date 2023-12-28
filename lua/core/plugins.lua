--[[
  File: plugins.lua
  Description: This file needed for loading plugin list into lazy.nvim and loading plugins
  Info: Use <zo> and <zc> to open and close foldings
  See: https://github.com/folke/lazy.nvim
]]
require "helpers/globals"

return {
-- Startuptime{{{
{
  'tweekmonster/startuptime.vim',
},
--}}}

-- Mason {{{
{
  "williamboman/mason.nvim",
  build = ":MasonUpdate",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },
  config = function()
    require "plugins.mason"
  end
},
-- }}}

-- CMP {{{
{
  'hrsh7th/nvim-cmp',
  event = "InsertEnter",
  dependencies = {
    {
      'L3MON4D3/LuaSnip',
      delete_check_events="TextChanged",
      dependencies = {
        'rafamadriz/friendly-snippets',
        config = function ()
          require("luasnip.loaders.from_vscode").lazy_load()
        end,
      },

      config=function ()
        require("luasnip/loaders/from_vscode").load({paths={"~/.local/share/nvim/lazy/friendly-snippets/snippets"}})
      end
    },
    'saadparwaiz1/cmp_luasnip',

    'hrsh7th/cmp-nvim-lsp',

    'hrsh7th/cmp-path',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'hrsh7th/cmp-nvim-lua',
    'ray-x/cmp-treesitter',

    'neovim/nvim-lspconfig',

    'lukas-reineke/cmp-under-comparator'
  },
  opts = function()
    require "plugins.cmp"
  end
},
-- }}}

-- Git Signs{{{
{
  'lewis6991/gitsigns.nvim',
  config = function()
    require "plugins.gitsigns"
  end
},
-- }}}

-- Trouble {{{
{
  "folke/trouble.nvim",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    require "plugins.trouble"
  end,
},
-- }}}

-- Nvim-various-textobjs {{{
{
  "chrisgrieser/nvim-various-textobjs",
  opts = { useDefaultKeymaps = true },
},
-- }}}

-- Theme: nvim-base16 {{{
{
  "RRethy/nvim-base16",
  lazy = false,
  config = function()
    require "plugins.colorscheme.nvim-base16"
  end
},
-- }}}

---- Hardtime{{{
----  {
----  "m4xshen/hardtime.nvim",
----  opts = {}
----  },
---- }}}

-- toggleterm{{{
{
  'akinsho/toggleterm.nvim', 
  version = "*", 
  config = true,
  opts=function ()
    require 'plugins.toggleterm'
  end
},
-- }}}

-- Register {{{
{
  "tversteeg/registers.nvim",
  name = "registers",
  keys = {
    {"\"",mode={"n","v"}},
    {"<C_R>",mode={"i"}}
  },
  cmd = "Registers",
  config = function()
    require "plugins.register"
  end,
},
-- }}}

-- oil {{{

{
  'stevearc/oil.nvim',
  opts = function ()
    require "plugins.oil"
  end,
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
},
-- }}}

-- Neoformat {{{
{
  'sbdchd/neoformat',
},
-- }}}

-- Tmux {{{
-- set keybinding in tmux and nvim
{
  'aserowy/tmux.nvim',
  configs=function ()
    require 'plugins.tmux'
  end
},

--}}}

-- Flash {{{
{
  "folke/flash.nvim",
  event = "VeryLazy",
 -- stylua: ignore
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
  config = function ()
    require "plugins.flash_config"
  end,
},
--}}}

--Lspsaga {{{
--{
--  'nvimdev/lspsaga.nvim',
--  config = function()
--    require('lspsaga').setup({
--      symbol_in_winbar={
--        enable=false,
--      }
--    })
--  end,
--  dependencies = {
--    'nvim-treesitter/nvim-treesitter', -- optional
--    'nvim-tree/nvim-web-devicons'     -- optional
--    }
--},
----}}}

-- Centerpad {{{
{
  "smithbm2316/centerpad.nvim" ,
},

--}}}

-- surround {{{
{
  "tpope/vim-surround" ,
},
--}}}

{
  "willothy/flatten.nvim",
  config = true,
  -- or pass configuration with
  -- opts = {  }
  -- Ensure that it runs first to minimize delay when opening file from terminal
  lazy = false,
  priority = 1001,
},

{
  "vidocqh/auto-indent.nvim",
  config = function ()
    require "plugins.auto-indent"
  end,

},

{
  "stevearc/conform.nvim",
  opts={},
  lazy=true, --set true for now, when i config it ok, i will enable it

},

{
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- calling `setup` is optional for customization
    require("fzf-lua").setup({'fzf-native'})
  end
},

{
  "ms-jpq/coq_nvim",
  -- optional for icon support
  dependencies = { "ms-jpq/coq.artifacts","ms-jpq/coq.thirdparty" },
  config = function()
    require "plugins.coq"
  end
},

{
  "LeonHeidelbach/trailblazer.nvim",
  config = function()
      require("trailblazer").setup({
          -- your custom config goes here
      })
  end,
}

}
---- packer example: wait for config for lazy
--use {
--  "LunarVim/bigfile.nvim",
--}

