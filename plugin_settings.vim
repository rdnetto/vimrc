" Plugin settings (in alphabetic order)

" Airline
let g:airline_theme = 'powerlineish'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" EasyMotion - don't require a double tap of leader key
let g:EasyMotion_leader_key = '<Leader>'

" Haskell-vim - disable indentation, since vim-haskell-indent for that instead
let g:haskell_indent_disable = 1

" Latex-Box
let g:LatexBox_Folding = 1
let g:no_atp_maps = 1

" Neco-ghc
let g:necoghc_enable_detailed_browse = 1

" Neomake
let g:neomake_open_list = 2
" This has to be invoked explicitly as :NeomakeProject stackbuild
let s:mapexpr = 'substitute(v:val, "\n", "", "g")'
let g:neomake_stackbuild_maker = {
    \ 'exe': 'stack',
    \ 'args': ['build'],
    \ 'mapexpr': s:mapexpr,
    \ 'errorformat':
        \ '%-G%\s%#,' .
        \ '%f:%l:%c:%trror: %m,' .
        \ '%f:%l:%c:%tarning: %m,'.
        \ '%f:%l:%c: %trror: %m,' .
        \ '%f:%l:%c: %tarning: %m,' .
        \ '%E%f:%l:%c:%m,' .
        \ '%E%f:%l:%c:,' .
        \ '%Z%m'
    \ }


" NERDTree
let g:NERDTreeMouseMode = 3
let g:NERDTreeQuitOnOpen = 1

" PyMode
let g:pymode_lint_ignore = "C0301,C901,E128,E221,E226,E261,E501,E731,W0401,W391"
let g:pymode_lint_mccabe_complexity = 25
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_lint_checkers = ['pep8']
let g:pymode_rope = 0

" Tagbar
let g:tagbar_sort = 0
let g:tagbar_show_linenumbers = -1
let g:tagbar_singleclick = 1
let g:tagbar_autoshowtag = 1

" TaskList
let g:tlWindowPosition = 1                  " Open TaskList on the bottom of the screen
let g:tlTokenList = ['WIP', 'BUG', 'TODO']

" Vebugger - enable keymaps
" TODO: add keymap/function for autostarting debugger
let g:vebugger_leader='<Leader>d'
let g:vebugger_view_source_cmd='edit'

" Vim-gitgutter
let g:gitgutter_realtime = 0
let g:gitgutter_map_keys = 0
let g:gitgutter_signs = 0
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk
nmap <leader>gg :GitGutterSignsToggle<CR>
nmap <Leader>ga <Plug>GitGutterStageHunk
nmap <Leader>gr <Plug>GitGutterRevertHunk
nmap <Leader>gp <Plug>GitGutterPreviewHunk

" Vim-Rooter
let g:rooter_default_patterns = ['Makefile', '.git', '.git/', '_darcs/', '.hg/', '.bzr/', '.svn/']
let g:rooter_patterns = g:rooter_default_patterns
let g:rooter_use_lcd = 1
let g:rooter_disable_map = 1

" Vim-Startify
let g:startify_custom_header = startify#fortune#boxed()
let g:startify_list_order = ['sessions', 'files', 'dir', 'bookmarks']
let g:startify_session_persistence = 1
let g:startify_session_delete_buffers = 1
let g:startify_change_to_vcs_root = 1
let g:startify_empty_buffer_key = 'n'
let g:startify_relative_path = 1
let g:startify_files_number = 20
autocmd User Startified AirlineRefresh
autocmd BufEnter * call UpdateStartify()

" WM Graphviz
let g:WMGraphviz_output = 'png'

" YouCompleteMe
let g:ycm_complete_in_comments = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_semantic_triggers = {'haskell' : ['.']}

