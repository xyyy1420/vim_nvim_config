-- See :help ddc-options
-- Global config
vim.call('ddc#custom#patch_global', {
  sources = { 'lsp',  'around', 'buffer' },
  sourceOptions = {
    ['_'] = {
      matchers = { 'matcher_fuzzy' },
      sorters = { 'sorter_fuzzy' },
      converters = { 'converter_fuzzy' },
    },
    ['lsp'] = {
      mark = 'LSP',
      forceCompletionPattern = '\\.|:|->',
    },
    around = {
      mark = 'AROUND',
    },
    buffer = {
      mark = 'BUFFER',
    },
  },
})

-- Different source for markdown filetype
vim.call('ddc#custom#patch_filetype', 'markdown', { sources = { 'around', 'buffer' } })

-- Enable on startup
vim.call('popup_preview#enable')
vim.call('ddc#enable')
