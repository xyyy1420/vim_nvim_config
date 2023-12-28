require("auto-indent").setup({
  lightmode = true,        -- Lightmode assumes tabstop and indentexpr not change within buffer's lifetime
  indentexpr = nil,
  ignore_filetype = {},    -- Disable plugin for specific filetypes, e.g. ignore_filetype = { 'javascript' }
})
