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


-- Plugin management {{{
local lazy = require("lazy")
local opt={
  install={missing=true,}
}

require("plugins.coq")

lazy.setup("core.plugins",opt)
-- }}}

-- vim:tabstop=2 shiftwidth=2 expandtab syntax=lua foldmethod=marker foldlevelstart=0 foldlevel=0
