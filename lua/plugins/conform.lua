require("conform").setup({
  format={
    timeout_ms=3000,
    async=false,
    quiet=false,
  },
  formatters_by_ft={
    lua = {"stylua"},
    python = {"isort","black"},
  }
})
