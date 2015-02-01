" Defines functions called by various mappings/autocmds

" Change the contents of Startify, depending on our working directory
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

" General purpose function for determining if in the Linux kernel (or Buildroot)
" Pre-req for ToggleWD()
function IsInKernelSource()
    return ! empty(findfile('Kbuild', '.;'))
endfunction

" More intelligent working directory switching
function ToggleWD()
    if expand('%') =~ "/"
		lcd %:p:h
    else
        if IsInKernelSource()
            let g:rooter_patterns = ['.git/']
        else
            let g:rooter_patterns = g:rooter_default_patterns
        endif

		Rooter
    endif
endfunction

" Function for automatically disabling easytags when the tags file is too big
function ToggleEasytags()
    let l:tagsfile = findfile('tags', expand('<afile>:p:h') . ';')
    if empty(l:tagsfile)
        let l:tagsfile = expand("$HOME/.vim/tags")
    endif

    if(empty(l:tagsfile))
        echomsg 'Couldnt find tags file'
        return
    endif

    let l:size = system('stat -c %s ' . l:tagsfile)
    if l:size > 1000000 && g:easytags_auto_update
        let g:easytags_auto_update = 0
        echomsg "Large tags file detected - disabling auto-updates"
    endif
endfunction

