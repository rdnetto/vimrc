" =============== Begin NeoBundle Initialization ===============
" Initialize
if has ('vim_starting')
    set nocompatible
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))
let g:neobundle#install_max_processes = 8
let g:neobundle#install_process_timeout = 500

" NeoBundle dependencies
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/unite.vim'

NeoBundle 'Shougo/vimproc.vim', {
            \ 'build' : {
            \     'windows' : 'tools\\update-dll-mingw',
            \     'cygwin' : 'make -f make_cygwin.mak',
            \     'mac' : 'make -f make_mac.mak',
            \     'unix' : 'make -f make_unix.mak',
            \    },
            \ }

" Plugins are divided into two profiles: light and full. (full is a superset of light)
let s:profileFile = expand('~/.vim/profile')
if filereadable(s:profileFile)
    let s:profile = readfile(s:profileFile, '', 1)[0]
else
    let s:profile = 'light'
endif

" Colour schemes
" Nice color schemes: pablo, xterm16, relaxedgreen, vividchalk.
" Comparison: http://vimcolorschemetest.googlecode.com/svn/html/index-c.html
NeoBundle 'Relaxed-Green'
NeoBundle 'tomasr/molokai'

" UI
NeoBundle 'bling/vim-airline'
NeoBundle 'mhinz/vim-startify'
NeoBundle 'kien/ctrlp.vim.git'
NeoBundle 'chrisbra/Recover.vim'
NeoBundle 'scrooloose/nerdtree.git'
NeoBundle 'vim-scripts/TaskList.vim'
NeoBundle 'bogado/file-line'
NeoBundle 'nathanaelkane/vim-indent-guides'

" Movement
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'jayflo/vim-skip'
NeoBundle 'nelstrom/vim-visual-star-search'

" Text objects
NeoBundle 'michaeljsmith/vim-indent-object'

" Text editing
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'tpope/vim-speeddating'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'tpope/vim-characterize'
NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'scrooloose/nerdcommenter'

" Misc
NeoBundle 'restore_view.vim'
NeoBundle 'tpope/vim-eunuch'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'airblade/vim-rooter'

if s:profile  ==? "full"
    " Tag support (requires exuberant-ctags)
    NeoBundle 'majutsushi/tagbar'
    NeoBundle 'xolox/vim-misc'
    NeoBundle 'xolox/vim-pyref'
    NeoBundle 'xolox/vim-easytags'

    " Git integration
    NeoBundle 'airblade/vim-gitgutter'
    NeoBundle 'tpope/vim-fugitive'

    if has('ruby')
        NeoBundle 'FriedSock/smeargle'
    endif

    " Omnicomplete
    NeoBundle 'Valloric/YouCompleteMe', {
                \ 'build' : {
                \     'unix' : './install.sh --clang-completer --system-libclang',
                \    },
                \ }

    " Debugging
    NeoBundle 'mattboehm/vim-unstack'
    NeoBundle 'idanarye/vim-vebugger'

    " Language specific
    NeoBundle 'klen/python-mode'
    NeoBundle 'adimit/prolog.vim'
    NeoBundle 'wannesm/wmgraphviz.vim'
    NeoBundle 'eagletmt/ghcmod-vim'
    NeoBundle 'bitc/vim-hdevtools'
    NeoBundle 'Twinside/vim-haskellFold'
    NeoBundle 'LaTeX-Box-Team/LaTeX-Box'

endif

" Finalize
call neobundle#end()
NeoBundleCheck

" Enable built-in plugins
filetype indent on
syntax on
runtime macros/matchit.vim
" =============== End NeoBundle Initialization ================

"  2 moving around (searching & patterns)
set incsearch			    "Show matches for partially typed searches
set ignorecase	    		"Searches are case insensitive...
set smartcase	    		"unless they have uppercase letters
set autochdir               "Set working directory to path of current file

"  3 tags
set tagrelative
set tags=$HOME/.vim/tags

"  4 displaying text
set wrap
set linebreak		    	"Wrap lines at convenient points
set scrolloff=3			    "See the surrounding lines when cursor is at the edge of the screen
set nu	     	    	    "Absolute line numbers
set window=40
set textwidth=0             "Disable automatically creating a new line after 80 chars
set nolist

"  5 syntax, highlighting and spelling
set hlsearch
set spellfile=$HOME/.vim/spell/en.utf-8.add

"  6 multiple windows
set laststatus=2		    "Always show the status bar
set hidden			        "Keep files open in the background

"  8 terminal
set title	    		    "Set title in console

"  9 mouse
set mousemodel=popup_setpos "Enable context menu (right-click) in GUI

" 11 messages and info
set showcmd
set nosmd                   "Don't show mode, as Powerline makes it redundant
set ruler		    	    "Line/Col numbers in corner

" 13 editing text
set bs=2			        "Working backspace
set nrformats=hex           "Don't use octal when incrementing numbers with leading zeros

" 14 tabs and indenting
set autoindent
set nosmartindent           "Disabled - causes issues with filetype based indentation
set smarttab
set expandtab			    "Expand tabs to spaces
set tabstop=4	    		"Width of a tab
set shiftwidth=4	    	"Use tabstop value for indenting

" 15 folding
set foldmethod=syntax		"Use syntax-dependent folding
set nofoldenable        	"Don't fold by default

" 18 reading and writing files
set autoread			    "Read files when modified

" 20 command line editing
set history=100
set wildmode=list:longest,full	"ZSH-style path completion
set wildmenu
set wildignore=*.o,*.obj,*~     "Ignore these files when doing path-completion
set wildignore+=*vim/backups*
set wildignore+=*.png,*.jpg,*.gif
set wildignorecase

silent !mkdir ~/.vim/undo > /dev/null 2>&1
set undodir=~/.vim/undo		"Persistent undo
set undofile

" Set colorscheme
if has("gui_running")
    colorscheme molokai
else
    colorscheme relaxedgreen
endif

" Set font, accounting for DPI. Desktop has 86, laptop has 96
if system("xdpyinfo | perl -ne '/resolution.*x([0-9]+)/ && print $1;'") < 90
    set guifont=DejaVu\ Sans\ Mono\ 11
else
    set guifont=DejaVu\ Sans\ Mono\ 12
endif

" Plugin settings
let g:EasyMotion_leader_key = '<Leader>'    " Don't require a double tap of leader key for EasyMotion
let g:vebugger_leader='<Leader>d'           " Enable keymaps. TODO: add keymap/function for autostarting debugger

" PyMode settings
let g:pymode_lint_ignore = "E501,E251,E262,E226,E261,W0401,E303,E128,E124,W391,E203,C0110,C0301"
let g:pymode_lint_mccabe_complexity = 25
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0

" Airline settings
let g:airline_theme = 'powerlineish'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
nmap <Leader>atw :AirlineToggleWhitespace<CR>

" CtrlP settings
let g:ctrlp_working_path_mode = 'rc'
let g:ctrlp_mruf_max = 1000
let g:ctrlp_mruf_exclude = '/var/tmp/.*XX.*'
let g:ctrlp_reuse_window = 'startify'

" NERDTree settings
let g:NERDTreeMouseMode = 3
let g:NERDTreeQuitOnOpen = 1

" Tagbar settings
let g:tagbar_sort = 0
let g:tagbar_show_linenumbers = -1
let g:tagbar_singleclick = 1
let g:tagbar_autoshowtag = 1

" TaskList
let g:tlWindowPosition = 1                  " Open TaskList on the bottom of the screen
let g:tlTokenList = ['WIP', 'BUG', 'TODO']

" Easytags settings - requires hasktags package for Haskell support
let g:easytags_dynamic_files = 2
let g:easytags_languages = {
\   'haskell': {
\     'cmd': "/usr/bin/hasktags",
\       'args': ["-c"],
\       'fileoutput_opt': '-f',
\       'stdout_opt': '-f-',
\       'recurse_flag': ''
\   }
\}

" YouCompleteMe settings
let g:ycm_complete_in_comments = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_confirm_extra_conf = 0

" WM Graphviz settings
let g:WMGraphviz_output = "png"

" Vim-unstack settings
let g:unstack_mapkey = '<S-Leader>s'
let g:unstack_populate_quickfix = 1

" Vim-gitgutter settings
let g:gitgutter_realtime = 0
let g:gitgutter_map_keys = 0
let g:gitgutter_signs = 0
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk
nmap <leader>gg :GitGutterSignsToggle<CR>
nmap <Leader>ga <Plug>GitGutterStageHunk
nmap <Leader>gr <Plug>GitGutterRevertHunk
nmap <Leader>gp <Plug>GitGutterPreviewHunk

" Smeargle settings
let g:smeargle_colouring_scheme = ''

" Haskell mode settings
let g:haddock_browser = "xdg-open"

" Hdevtools settings
let g:hdevtools_options = '-g -hide-package=monads-tf -g -fglasgow-exts'

" Latex-Box settings
let g:LatexBox_Folding = 1

" Eclim setting - needed for YCM
let g:EclimCompletionMethod = 'omnifunc'

" Vim-skip settings
let g:vimskip_mapforwardskip = '<Leader>s'
let g:vimskip_mapbackwardskip = '<Leader>S'
let g:vimskip_maptocenter = '<Leader>gs'

" Vim-Startify settings
let g:startify_list_order = ['sessions', 'files', 'dir', 'bookmarks']
let g:startify_session_persistence = 1
let g:startify_empty_buffer_key = 'n'
let g:startify_relative_path = 1
let g:startify_files_number = 20
autocmd User Startified call AirlineRefresh
autocmd BufEnter * call UpdateStartify()

function UpdateStartify()
    if getcwd() == $HOME
        let g:startify_list_order = [
                \ ['   Most Recently Used Files:'], 'files',
                \ ['   Sessions:'], 'sessions',
                \ ['   Bookmarks:'], 'bookmarks']
    else
        let l:dir = substitute(getcwd(), '^' . $HOME, '~', '')
        let g:startify_list_order = [
                \ ['   Most Recently Used Files:'], 'files',
                \ ['   MRU Files in ' . l:dir . ':'], 'dir',
                \ ['   Sessions:'], 'sessions',
                \ ['   Bookmarks:'], 'bookmarks']
    endif
endfunction

" Legacy code to handle old versions of Startify correctly
call UpdateStartify()

" Mappings for vim-Rooter
map <silent> <unique> <Leader>cd <Plug>RooterChangeToRootDirectory
autocmd BufEnter *.* :Rooter
let g:rooter_patterns = ['Makefile', '.git', '.git/', '_darcs/', '.hg/', '.bzr/', '.svn/']

" Relative line numbers in Normal mode only
:set relativenumber
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

" Fix Y so that is behaves like D
map Y y$

" Remap home button to act like ^ instead of 0
" NOTE: make sure that you have no trailing spaces, as they affect mappings
nmap <Home> ^
imap <Home> <Esc>^i

" Use Ctrl+Backspace to delete the last word
imap <C-BS> <C-W>

" Use Ctrl+Tab / Ctrl+Shift+Tab to cycle through buffers
nnoremap <silent> <c-tab> :bn<cr>
nnoremap <silent><c-s-tab> :bp<cr>

" Easy-align mapping
vnoremap <silent> <Leader><Space> :EasyAlign<Space>

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

" Remap function keys
nnoremap <silent> <F2> :CtrlPTag<CR>
nnoremap <silent> <F3> :CtrlPMRUFiles<CR>
nnoremap <silent> <S-F3> :CtrlPBuffer<CR>
nnoremap <silent> <F4> :bd<CR>
nnoremap <silent> <S-F4> :bd!<CR>
nnoremap <silent> <F6> :ccl<CR>
nnoremap <silent> <F8> :wa<CR>:make<CR>
nnoremap <silent> <S-F8> :w<CR>:make<CR>
nnoremap <silent> <F9> <Plug>TaskList
nnoremap <silent> <F10> :TagbarOpenAutoClose<CR>

" Use Enter or <C-L> to clear highlighting
nnoremap <silent> <CR> :let @/=""<CR><CR>
nnoremap <silent> <C-L> :let @/=""<CR><C-L>

" Use Space to toggle folds
nnoremap <silent> <Space> za

" Show trailing whitepace and spaces before a tab:
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/
