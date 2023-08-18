--[[
  File: plugins.lua
  Description: This file needed for loading plugin list into lazy.nvim and loading plugins
  Info: Use <zo> and <zc> to open and close foldings
  See: https://github.com/folke/lazy.nvim
]]
require "helpers/globals"

return {
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

  -- Telescope {{{
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "ahmedkhalf/project.nvim",
    },
    config = function()
      require "plugins.telescope"
    end
  },
  -- }}}

  -- fzf-native {{{
   {
     'nvim-telescope/telescope-fzf-native.nvim',
     build = 'make'
   },
  --}}}

-- -- CMP {{{
-- {
--   'hrsh7th/nvim-cmp',
--   event = "InsertEnter",
--   dependencies = {
--     {
--       'L3MON4D3/LuaSnip',
--       delete_check_events="TextChanged"
--     },
--     'saadparwaiz1/cmp_luasnip',
--
--     'hrsh7th/cmp-nvim-lsp',
--
--     'hrsh7th/cmp-path',
--     'hrsh7th/cmp-emoji',
--     'hrsh7th/cmp-nvim-lsp-signature-help',
--     'hrsh7th/cmp-nvim-lua',
--     'rafamadriz/friendly-snippets',
--     'ray-x/cmp-treesitter',
--
--     'neovim/nvim-lspconfig',
--
--     'lukas-reineke/cmp-under-comparator'
--   },
--   config = function()
--     require "plugins.cmp"
--   end
-- },
-- -- }}}

  -- Git Signs{{{
  {
    'lewis6991/gitsigns.nvim',
    lazy = false,
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

  -- TreeSitter {{{
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      {
        "nvim-treesitter/nvim-treesitter-textobjects",
        init = function ()
          require("lazy.core.loader").disable_rtp_plugin("nvim-treesitter-textobjects")
          load_textobjects = true
        end,
      }
    },
    opts = function()
      require "plugins.treesitter"
    end
  },
  -- }}}

-- Nvim-various-textobjs {{{
  {
    "chrisgrieser/nvim-various-textobjs",
    lazy = false,
    opts = { useDefaultKeymaps = true },
  },
-- }}}

  -- Theme: Sonokai {{{
  {
    "sainnhe/sonokai",
    lazy = true,
    config = function()
      require "plugins.colorscheme.sonokai"
    end
  },
  -- }}}

  -- Hardtime{{{
 --  {
 --  "m4xshen/hardtime.nvim",
 --  opts = {}
 --  },
  -- }}}

  -- Wilder{{{
  {
  "gelguy/wilder.nvim",
  event='CmdlineEnter',
  dependencies = {
    'roxma/nvim-yarp',
    'roxma/vim-hug-neovim-rpc'
  },
  config=function ()
    require "plugins.wilder"
  end
  },
  -- }}}

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

 -- harpoon {{{
  {
    "ThePrimeagen/harpoon",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts=function ()
      require('plugins.harpoon')
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

 -- symbols-outline {{{
  {
    "simrat39/symbols-outline.nvim",
    opts = function ()
      require "plugins.symbols-outline"
    end
  },
  -- }}}

 -- coq {{{
  {
    'ms-jpq/coq_nvim',branch= 'coq',
    dependencies={
      {'ms-jpq/coq.artifacts', branch='artifacts'},
      {'ms-jpq/coq.thirdparty', branch= '3p'},
      "neovim/nvim-lspconfig"
    },
  },
 -- }}}

 -- Distant {{{
    {
      'chipsenkbeil/distant.nvim',
      branch = 'v0.3',
      config = function()
        require('distant'):setup()
      end
    },
  -- }}}

  -- Neoformat {{{
    {
      'sbdchd/neoformat',
    },
  -- }}}

-- Tmux {{{
  {
    'aserowy/tmux.nvim',
    configs=function ()
      require 'plugins.tmux'
    end
  },

--}}}

-- Material {{{
  {
    "marko-cerovac/material.nvim" ,
    opts=function ()
      require "plugins.material"
    end

  },

--}}}


}


-- vim:tabstop=2 shiftwidth=2 expandtab syntax=lua foldmethod=marker foldlevelstart=0 foldlevel=0
