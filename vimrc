" Plugins are divided into two profiles: light and full. (full is a superset of light)
let s:profileFile = expand('~/.vim/profile')
if filereadable(s:profileFile)
    let g:profile = readfile(s:profileFile, '', 1)[0]
else
    let g:profile = 'light'
endif

" Load bundles
call plug#begin('~/.vim/bundle')
source ~/.vim/bundles.vim
call plug#end()

" Settings
source ~/.vim/core_settings.vim
source ~/.vim/plugin_settings.vim

" Functions and mappings
source ~/.vim/functions.vim
source ~/.vim/mappings.vim

