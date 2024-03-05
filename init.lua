--[[
  File: init.lua
  Description: Entry point file for neovim
]]
-- Bootsraping plugin manager
vim.loader.enable()
require "lazy-bootstrap"
-- Settings
require "core.settings"
require "core.keybindings"


--require("plugins.coq")
-- Plugin management {{{
local lazy = require("lazy")
local opt={
--  spec={
--    {import="core.plugins"}
--  },
  defaults={
    lazy=false,
    version=false,
  },
  install={missing=true,colorscheme={"base16-colorscheme"}},
  checker={enabled=true},
  performance={
    rtp={
      disabled_plugin={
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      }
    }
  },
  profiling={
    loader=false,
    require=false,
  }
}

lazy.setup("core.plugins",opt)
-- }}}


-- vim:tabstop=2 shiftwidth=2 expandtab syntax=lua foldmethod=marker foldlevelstart=0 foldlevel=0
