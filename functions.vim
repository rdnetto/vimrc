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

" Function for jumping back and forth between source and header files
function! GotoHeader()
    if(expand("%:e") == "c" || expand("%:e") == "cpp")
        execute ":edit " . expand("%:r") . ".h"
    elseif(expand("%:e") == "h")
        execute ":edit " . expand("%:r") . ".c*"
    else
        echoerr "ERROR: Unknown filetype"
    endif
endfunction

" Function for connecting to kgdb (using helper script to get symbol table info)
function! KgdbConnect()
    let l:lines = systemlist("../debug.sh")

    if(len(l:lines) == 1)
        echoerr l:lines[0]
        return
    endif

    let l:debugger = vebugger#gdb#start("vmlinux", {'con' : lines[0]})
    call vebugger#toggleTerminalBuffer()
    echom "Connected to " . lines[0]

    for line in l:lines[1:]
        call vebugger#writeLine(line)
    endfor
endfunction

" Function for dynamically choosing find / git ls-files for fzf
function! SmartFiles()
    silent !git rev-parse --is-inside-work-tree &>/dev/null
    if v:shell_error
        " error - this is not a git repo
        FilesMru
    else
        " 0 - this is a git repo
        ProjectMru
    endif
endfunction

