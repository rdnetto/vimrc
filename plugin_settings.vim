" Plugin settings (in alphabetic order)

" Airline
let g:airline_theme = 'powerlineish'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" CtrlP
let g:ctrlp_working_path_mode = 'rc'
let g:ctrlp_mruf_max = 1000
let g:ctrlp_mruf_exclude = '/var/tmp/.*XX.*'
let g:ctrlp_reuse_window = 'startify'

" EasyMotion - don't require a double tap of leader key
let g:EasyMotion_leader_key = '<Leader>'

" Easytags - requires hasktags package for Haskell support
let g:easytags_file = '$HOME/.vim/tags'
let g:easytags_dynamic_files = 2
let g:easytags_auto_update = 1
let g:easytags_languages = {
\   'haskell': {
\     'cmd': "/usr/bin/hasktags",
\       'args': ["-c"],
\       'fileoutput_opt': '-f',
\       'stdout_opt': '-f-',
\       'recurse_flag': ''
\   }
\}

" Eclim - needed for integration with YCM
let g:EclimCompletionMethod = 'omnifunc'

" Haskell mode
let g:haddock_browser = "xdg-open"

" Hdevtools
let g:hdevtools_options = '-g -hide-package=monads-tf -g -fglasgow-exts'

" Latex-Box
let g:LatexBox_Folding = 1
let g:no_atp_maps = 1

" Neco-ghc
let g:necoghc_enable_detailed_browse = 1

" NERDTree
let g:NERDTreeMouseMode = 3
let g:NERDTreeQuitOnOpen = 1

" PyMode
let g:pymode_lint_ignore = "C0301,C901,E128,E221,E226,E261,E501,E731,W0401,W391"
let g:pymode_lint_mccabe_complexity = 25
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_lint_checkers = ['pep8']

" Smeargle
let g:smeargle_colouring_scheme = ''

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

if g:profile  ==? "full"
    " Vim-dutyl - configure paths for D autocompletion
    call dutyl#register#tool('dcd-client', $HOME . '/bin/dcd-client')
    call dutyl#register#tool('dcd-server', $HOME . '/bin/dcd-server')
endif

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

" Vim-skip
let g:vimskip_mapforwardskip = '<Leader>s'
let g:vimskip_mapbackwardskip = '<Leader>S'
let g:vimskip_maptocenter = '<Leader>gs'

" Vim-Startify
let g:startify_list_order = ['sessions', 'files', 'dir', 'bookmarks']
let g:startify_session_persistence = 1
let g:startify_session_delete_buffers = 1
let g:startify_change_to_vcs_root = 1
let g:startify_empty_buffer_key = 'n'
let g:startify_relative_path = 1
let g:startify_files_number = 20
autocmd User Startified call AirlineRefresh
autocmd BufEnter * call UpdateStartify()

" Vim-unstack
let g:unstack_mapkey = '<S-Leader>s'
let g:unstack_populate_quickfix = 1

" WM Graphviz
let g:WMGraphviz_output = "png"

" YouCompleteMe
let g:ycm_complete_in_comments = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_semantic_triggers = {'haskell' : ['.']}
