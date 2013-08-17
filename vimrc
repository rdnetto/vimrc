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
Bundle 'vim-easy-align'
Bundle 'sjl/gundo.vim.git'
Bundle 'vimez/vim-showmarks'
Bundle 'klen/python-mode'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'airblade/vim-gitgutter'
Bundle 'mileszs/ack.vim'
Bundle 'davidhalter/jedi-vim'
Bundle 'adimit/prolog.vim'

" need 7.3.584+ for YCM
if v:version > 703 || (v:version == 703 && has('patch584'))
    Bundle 'Valloric/YouCompleteMe'

    "YCM uses the Jedi backend for Python autocompletion anyway, so disable it
    let g:jedi#popup_on_dot = 0
endif

colorscheme relaxedgreen    "Default colour scheme

filetype plugin indent on	"Enable filetype detection
syntax on
" ===============  End Vundle Initialization  ===============


"  2 moving around (searching & patterns)
set incsearch			    "Show matches for partially typed searches
set ignorecase	    		"Searches are case insensitive...
set smartcase	    		"unless they have uppercase letters
set autochdir               "Set working directory to path of current file

"  3 tags
set tags=.git/tags;$HOME
set tagrelative

"  4 displaying text
set wrap
set linebreak		    	"Wrap lines at convenient points
set scrolloff=3			    "See the surrounding lines when cursor is at the edge of the screen
set nu	     	    	    "Absolute line numbers
set window=40
set textwidth=0             "Disable automatically creating a new line after 80 chars

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
set wildmode=list:longest	"BASH-style path completion
set wildmenu
set wildignore=*.o,*.obj,*~     "Ignore these files when doing path-completion
set wildignore+=*vim/backups*
set wildignore+=*.png,*.jpg,*.gif
set wildignorecase

silent !mkdir ~/.vim/undo > /dev/null 2>&1
set undodir=~/.vim/undo		"Persistent undo
set undofile


" Plugin settings
let g:EasyMotion_leader_key = '<Leader>'    " Don't require a double tap of leader key for EasyMotion
let g:ctrlp_working_path_mode = 'rc'

" PyMode settings
let g:pymode_lint_ignore = "E501,E251,E262,E226,E261,W0401,E303,E128,E124,W391,E203"
let g:pymode_lint_mccabe_complexity = 25

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

" Gundo settings
let g:gundo_preview_bottom=1
let g:gundo_right=1

" YouCompleteMe settings
let g:ycm_complete_in_comments = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_insertion = 1


" Relative line numbers in Normal mode only
:set relativenumber
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

" Remap home button to act like ^ instead of 0
" NOTE: make sure that you have no trailing spaces, as they affect mappings
nmap <Home> ^
imap <Home> <Esc>^i

" Use Ctrl+Backspace to delete the last word
imap <C-BS> <C-W>

" Use Ctrl+Tab / Ctrl+Shift+Tab to cycle through buffers
nnoremap <c-tab> :bn<cr>
nnoremap <c-s-tab> :bp<cr>

" Clipboard mappings
vnoremap <C-X> "+x
vnoremap <C-C> "+y
map <C-S-V> "+gP
cmap <C-V> <C-R>+
imap <C-V> <C-R>+

" Remap function keys
nnoremap <silent> <F3> :CtrlPMRUFiles<CR>
nnoremap <silent> <F5> :NERDTreeToggle<CR>
nnoremap <silent> <F8> :GundoToggle<CR>
nnoremap <silent> <F10> :TlistToggle<CR>

" Use Enter to clear highlighting
nnoremap <CR> :let @/=""<CR>:<BS><CR>

" Show trailing whitepace and spaces before a tab:
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/
