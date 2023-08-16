local wilder=require('wilder')
wilder.setup({
  modes={':','/','?'},
  branch={
    cmdline_pipeline=(
    {
      language='python',
      fuzzy=1,
      fuzzy_filter=wilder.vim_fuzzy_filter()
    })
  },
  python_search_pipeline=({
    pattern = wilder.python_fuzzy_pattern(),
    sorter=wilder.python_difflib_sorter(),
    engine='re',
  })
})
