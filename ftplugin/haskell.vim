" Autocompletion via neco-ghc
let g:haskellmode_completion_ghc = 0
setlocal omnifunc=necoghc#omnifunc

setlocal makeprg=stack\ build

" ghc-mod mappings
nnoremap <silent> <leader>ht :GhcModType!<CR>
nnoremap <silent> <leader>hI :GhcModTypeInsert!<CR>
nnoremap <silent> <leader>hl :GhcModTypeClear<CR>
nnoremap <silent> <leader>hi :GhcModInfo!<CR>

" Auto-sort imports
autocmd BufWritePre <buffer> HaskellSortImport

