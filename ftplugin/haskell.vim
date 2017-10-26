" Autocompletion via neco-ghc
let g:haskellmode_completion_ghc = 0
setlocal omnifunc=necoghc#omnifunc

nnoremap <buffer> <silent> <F8> :wa<CR>:call InteroBuild()<CR>
nnoremap <buffer> <silent> <S-F8> :wa<CR>:NeomakeProject stackbuild<CR>

" ghc-mod mappings
nnoremap <silent> <leader>ht :GhcModType!<CR>
nnoremap <silent> <leader>hI :GhcModTypeInsert!<CR>
nnoremap <silent> <leader>hl :GhcModTypeClear<CR>
nnoremap <silent> <leader>hi :GhcModInfo!<CR>

" Replace tags with Intero
nnoremap <silent> <C-]> :InteroGoToDef<CR>

" Auto-sort imports
autocmd BufWritePre <buffer> HaskellSortImport

" Helper function for switching to intero and reloading files
" We invoke this from the hotkey instead of on BufWritePost, to ensure it only happens once when multiple files are open.
function! InteroBuild()
    call intero#repl#send(':! clear')
    call intero#repl#send(':reload')
endfunction
