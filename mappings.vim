" Holds maps and autocmds

" ----------------------------------------------------------------------------------------------------
" Basic maps / core functionality
" ----------------------------------------------------------------------------------------------------

" Fix Y so that is behaves like D
map Y y$

" Relative line numbers in Normal mode only
:set relativenumber
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

" Remap home button to act like ^ instead of 0
nmap <Home> ^
imap <Home> <Esc>^i

" Use Ctrl+Backspace to delete the last word
imap <C-BS> <C-W>

" Use Ctrl+Tab / Ctrl+Shift+Tab to cycle through buffers
nnoremap <silent> <c-tab> :bn<cr>
nnoremap <silent><c-s-tab> :bp<cr>

" Arrow key mappings.
nnoremap <Up>   gk
nnoremap <Down> gj
inoremap <silent> <Up>   <C-o>gk
inoremap <silent> <Down> <C-o>gj

" Clipboard mappings
vnoremap <C-X> "+x
vnoremap <C-C> "+y
cmap <C-V> <C-R>+
imap <C-V> <C-R>+

" Use Space to toggle folds
nnoremap <silent> <Space> za

" Use Enter or <C-L> to clear highlighting
nnoremap <silent> <CR> :let @/=""<CR><CR>
nnoremap <silent> <C-L> :let @/=""<CR><C-L>

" Show trailing whitepace and spaces before a tab:
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/

" ----------------------------------------------------------------------------------------------------
" Mappings
" ----------------------------------------------------------------------------------------------------

" Function keys
nnoremap <silent> <F2> :Tags<CR>
nnoremap <silent> <F3> :call SmartFiles()<CR>
nnoremap <silent> <S-F3> :Buffers<CR>
nnoremap <silent> <F4> :bd<CR>
nnoremap <silent> <S-F4> :bd!<CR>
nnoremap <silent> <F6> :call GotoHeader()<CR>
nnoremap <silent> <F7> :ccl<CR>
nnoremap <silent> <F8> :wa<CR>:make<CR>
nnoremap <silent> <S-F8> :w<CR>:make<CR>
nmap     <silent> <F9> <Plug>TaskList
nnoremap <silent> <F10> :TagbarOpenAutoClose<CR>

" Easy-align mapping
nmap <Leader><Space> <Plug>(EasyAlign)
vmap <Leader><Space> <Plug>(EasyAlign)

" Mapping to toggle whitespace warnings
nmap <Leader>atw :AirlineToggleWhitespace<CR>

" Hack to work around plugins which break airline
nmap <silent> <Leader>ar :AirlineRefresh<CR>

" Mapping for toggling working directory (wrapper for Vim-Rooter)
map <silent> <unique> <Leader>cd :call ToggleWD()<CR>

" ----------------------------------------------------------------------------------------------------
" Autocmds
" ----------------------------------------------------------------------------------------------------

" Update working directory
autocmd BufAdd * silent! lcd %<afile>:h
autocmd BufFilePost,BufReadPost * silent! lcd %:p:h

" Disable easytags for large files
autocmd BufRead * call ToggleEasytags()

" Make Vebugger actions set the repeat.vim hook
nmap <silent> <Plug>VBGrepeat :VBGrepeat<CR>
autocmd User Vebugger_PostUserAction call repeat#set("\<Plug>VBGrepeat", v:count)

