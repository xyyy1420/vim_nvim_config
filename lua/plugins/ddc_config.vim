"call ddc#custom#patch_global('sources', ['lsp'])
"call ddc#custom#patch_global('sourceOptions', #{
"      \   lsp: #{
"      \     mark: 'lsp',
"      \     forceCompletionPattern: '\.\w*|:\w*|->\w*',
"      \   },
"      \ })
"
"call ddc#custom#patch_global('sourceParams', #{
"      \   lsp: #{
"      \     snippetEngine: denops#callback#register({
"      \           body -> vsnip#anonymous(body)
"      \     }),
"      \     enableResolveItem: v:true,
"      \     enableAdditionalTextEdit: v:true,
"      \   }
"      \ })
"call ddc#custom#patch_filetype(['c', 'cpp', "lua"], 'sources', ['around'])
