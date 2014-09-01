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

" These plugins need to be compiled
NeoBundle 'Shougo/vimproc.vim', {
            \ 'build' : {
            \     'windows' : 'tools\\update-dll-mingw',
            \     'cygwin' : 'make -f make_cygwin.mak',
            \     'mac' : 'make -f make_mac.mak',
            \     'unix' : 'make -f make_unix.mak',
            \    },
            \ }

NeoBundle 'Valloric/YouCompleteMe', {
            \ 'build' : {
            \     'unix' : './install.sh --clang-completer --system-libclang',
            \    },
            \ }

" Nice color schemes: pablo, xterm16, relaxedgreen, vividchalk.
" Comparison: http://vimcolorschemetest.googlecode.com/svn/html/index-c.html

" vim-scripts on github is assumed
NeoBundle 'Relaxed-Green'
NeoBundle 'restore_view.vim'

" This requires the exuberant-ctags package
NeoBundle 'taglist.vim'
NeoBundle 'xolox/vim-misc'
NeoBundle 'xolox/vim-pyref'
NeoBundle 'xolox/vim-easytags'

NeoBundle 'kien/ctrlp.vim.git'
NeoBundle 'scrooloose/nerdtree.git'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'vim-scripts/TaskList.vim'
NeoBundle 'klen/python-mode'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'tpope/vim-eunuch'
NeoBundle 'tpope/vim-speeddating'
NeoBundle 'tpope/vim-characterize'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'adimit/prolog.vim'
NeoBundle 'wannesm/wmgraphviz.vim'
NeoBundle 'nelstrom/vim-visual-star-search'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kana/vim-textobj-lastpat'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'mattboehm/vim-unstack'
NeoBundle 'michaeljsmith/vim-indent-object'
NeoBundle 'eagletmt/ghcmod-vim'
NeoBundle 'bitc/vim-hdevtools'
NeoBundle 'Twinside/vim-haskellFold'
NeoBundle 'tomasr/molokai'
NeoBundle 'LaTeX-Box-Team/LaTeX-Box'
NeoBundle 'idanarye/vim-vebugger'
NeoBundle 'chrisbra/Recover.vim'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'jayflo/vim-skip'

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

" CtrlP settings
let g:ctrlp_working_path_mode = 'rc'
let g:ctrlp_mruf_max = 1000
let g:ctrlp_mruf_exclude = '/var/tmp/.*XX.*'

" NERDTree settings
let g:NERDTreeMouseMode = 3
let g:NERDTreeQuitOnOpen = 1

" TagList settings
let g:Tlist_Close_On_Select = 1
let g:Tlist_Exit_OnlyWindow = 1
let g:Tlist_GainFocus_On_ToggleOpen = 1
let g:Tlist_Show_Menu = 1
let g:Tlist_Use_Right_Window = 1
let g:Tlist_Use_SingleClick = 1
let g:Tlist_WinWidth = 50
let Tlist_File_Fold_Auto_Close = 1

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

" Relative line numbers in Normal mode only
:set relativenumber
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

" Fix Y so that is behaves like D
map Y y$

" Force Markdown for *.md, since I'm never going to work with Modula-2 files
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Remap F8 for Java files to call eclim
autocmd BufNewFile,BufReadPost *.java nnoremap <silent> <F8> :wa<CR>:Java<CR>
autocmd BufNewFile,BufReadPost *.java nnoremap <silent> <S-F8> :w<CR>:Java<CR>

" Remap home button to act like ^ instead of 0
" NOTE: make sure that you have no trailing spaces, as they affect mappings
nmap <Home> ^
imap <Home> <Esc>^i

" Use Ctrl+Backspace to delete the last word
imap <C-BS> <C-W>

" Use Ctrl+Tab / Ctrl+Shift+Tab to cycle through buffers
nnoremap <c-tab> :bn<cr>
nnoremap <c-s-tab> :bp<cr>

" Easy-align mapping
vnoremap <silent> <Leader><Space> :EasyAlign<Space>

" Arrow key mappings. 
nnoremap <Up>   gk
nnoremap <Down> gj
inoremap <buffer> <silent> <Up>   <C-o>gk
inoremap <buffer> <silent> <Down> <C-o>gj

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
map <F9> <Plug>TaskList
nnoremap <silent> <F10> :TlistToggle<CR>:set cursorline<CR>

" Use Enter or <C-L> to clear highlighting
nnoremap <CR> :let @/=""<CR><CR>
nnoremap <C-L> :let @/=""<CR><C-L>

" Use Space to toggle folds
nnoremap <silent> <Space> za

" Show trailing whitepace and spaces before a tab:
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/
