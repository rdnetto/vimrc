
" Only expand outer fold, not complete set
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>

" Needed for Latex-Box
set foldmethod=expr

" Remap function keys so that they perform equivalent functions
nnoremap <silent> <F8> :wa<CR>:Latexmk<CR>:LatexView<CR>
nnoremap <silent> <S-F8> :wa<CR>:Latexmk<CR>
nnoremap <silent> <F10> :LatexTOC<CR>

let g:LatexBox_split_width=50
let g:LatexBox_split_side="rightbelow"

" Convenient insert-mode mappings for opening/closing environments
imap <buffer> [[     \begin{
imap <buffer> ]]     <Plug>LatexCloseCurEnv
nmap <buffer> cl   <Plug>LatexChangeEnv

