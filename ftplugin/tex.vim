" Only expand outer fold, not complete set
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>

" Needed for Latex-Box
set foldmethod=expr

" Avoid excessively long lines
set textwidth=130

" Remap function keys so that they perform equivalent functions
" F5: display PDF at current position (requires app-vim/automatictexplugin)
nnoremap <silent> <F5> :SyncTex!<CR>
nnoremap <silent> <F8> :wa<CR>:Latexmk<CR>:LatexView<CR>
nnoremap <silent> <S-F8> :wa<CR>:Latexmk<CR>
nnoremap <silent> <F10> :LatexTOC<CR>

let g:LatexBox_split_width=50
let g:LatexBox_split_side="rightbelow"

" Convenient insert-mode mappings for opening/closing environments
imap <buffer> [[     \begin{
imap <buffer> ]]     <Plug>LatexCloseCurEnv
nmap <buffer> cl   <Plug>LatexChangeEnv

