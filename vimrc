"  1 important
version 6.0
set nocompatible

" =============== Begin Vundle Initialization ===============
filetype off                "This needs to be disabled for this section

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Bundles to be managed: (do not put comments on the same lines as these)
" Nice color schemes: pablo, xterm16, relaxedgreen, vividchalk.
" Comparison: http://vimcolorschemetest.googlecode.com/svn/html/index-c.html

" vim-scripts on github is assumed
Bundle 'Relaxed-Green'
Bundle 'restore_view.vim'

" This requires the exuberant-ctags package
Bundle 'taglist.vim'
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-pyref'
Bundle 'xolox/vim-easytags'

Bundle 'gmarik/vundle'
Bundle 'kien/ctrlp.vim.git'
Bundle 'scrooloose/nerdtree.git'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/syntastic'
Bundle 'Lokaltog/vim-powerline'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'junegunn/vim-easy-align'
Bundle 'sjl/gundo.vim.git'
Bundle 'vim-scripts/ShowMarks'
Bundle 'vim-scripts/TaskList.vim'
Bundle 'klen/python-mode'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-eunuch'
Bundle 'tpope/vim-speeddating'
Bundle 'airblade/vim-gitgutter'
Bundle 'mileszs/ack.vim'
Bundle 'adimit/prolog.vim'
Bundle 'wannesm/wmgraphviz.vim'
Bundle 'nelstrom/vim-visual-star-search'
Bundle 'kana/vim-textobj-user'
Bundle 'kana/vim-textobj-lastpat'
Bundle 'tpope/vim-abolish'
Bundle 'mattboehm/vim-unstack'
Bundle 'michaeljsmith/vim-indent-object'
Bundle 'Valloric/YouCompleteMe'
Bundle 'Shougo/vimproc.vim'
Bundle 'eagletmt/ghcmod-vim'
Bundle 'bitc/vim-hdevtools'
Bundle 'Twinside/vim-haskellFold'
Bundle 'tomasr/molokai'

" Set colorscheme
if has("gui_running")
    colorscheme molokai
else
    colorscheme relaxedgreen
endif

filetype plugin indent on	"Enable filetype detection
syntax on
runtime macros/matchit.vim  "Enable built-in matchit plugin
" ===============  End Vundle Initialization  ===============


"  2 moving around (searching & patterns)
set incsearch			    "Show matches for partially typed searches
set ignorecase	    		"Searches are case insensitive...
set smartcase	    		"unless they have uppercase letters
set autochdir               "Set working directory to path of current file

"  3 tags
set tagrelative

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

"  6 multiple windows
set laststatus=2		    "Always show the status bar
set hidden			        "Keep files open in the background

"  8 terminal
set title	    		    "Set title in console

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

" Set font, accounting for DPI. Desktop has 86, laptop has 96
if system("xdpyinfo | perl -ne '/resolution.*x([0-9]+)/ && print $1;'") < 90
    set guifont=DejaVu\ Sans\ Mono\ 11
else
    set guifont=DejaVu\ Sans\ Mono\ 12
endif

" Plugin settings
let g:EasyMotion_leader_key = '<Leader>'    " Don't require a double tap of leader key for EasyMotion


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

" Gundo settings
let g:gundo_preview_bottom=1
let g:gundo_right=1

" YouCompleteMe settings
let g:ycm_complete_in_comments = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_confirm_extra_conf = 0

" WM Graphviz settings
let g:WMGraphviz_output = "png"

" Vim-unstack settings
let g:unstack_populate_quickfix = 1

" Vim-gitgutter settings
let g:gitgutter_realtime = 0

" Haskell mode settings
let g:haddock_browser = "xdg-open"

" Hdevtools settings
let g:hdevtools_options = '-g -hide-package=monads-tf'

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
nnoremap <silent> <F5> :NERDTreeToggle<CR>
nnoremap <silent> <F6> :ccl<CR>
nnoremap <silent> <F7> :GundoToggle<CR>
nnoremap <silent> <F8> :wa<CR>:make<CR>
nnoremap <silent> <S-F8> :w<CR>:make<CR>
map <F9> <Plug>TaskList
nnoremap <silent> <F10> :TlistToggle<CR>:set cursorline<CR>

" Use Enter or <C-L> to clear highlighting
nnoremap <CR> :let @/=""<CR><CR>
nnoremap <C-L> :let @/=""<CR><C-L>

" Use Space to toggle folds
nnoremap <silent> <Space> @=(foldlevel('.')?'zA':"\<Space>")<CR>

" Show trailing whitepace and spaces before a tab:
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/
