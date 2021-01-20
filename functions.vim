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
    if expand('%') =~# '/'
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

" Function for jumping back and forth between source and header files
function! GotoHeader()
    if(expand('%:e') ==? 'c' || expand('%:e') ==? 'cpp')
        execute ':edit ' . expand('%:r') . '.h'
    elseif(expand('%:e') ==? 'h')
        execute ':edit ' . expand('%:r') . '.c*'
    else
        echoerr 'ERROR: Unknown filetype'
    endif
endfunction

" Function for connecting to kgdb (using helper script to get symbol table info)
function! KgdbConnect()
    let l:lines = systemlist('../debug.sh')

    if(len(l:lines) == 1)
        echoerr l:lines[0]
        return
    endif

    let l:debugger = vebugger#gdb#start('vmlinux', {'con' : l:lines[0]})
    call vebugger#toggleTerminalBuffer()
    echom 'Connected to ' . l:lines[0]

    for l:line in l:lines[1:]
        call vebugger#writeLine(l:line)
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

function! IncreaseFontSize(amount)
    " See :help guifont for syntax
    " Because there can be multiple modifiers, we need to look after the fontsize as well
    let l:matches = matchlist(g:GuiFont, '\v^(.*:h)([0-9]+)(.*)$')
    let l:head = l:matches[1]
    let l:size = l:matches[2]
    let l:tail = l:matches[3]

    let l:size = str2nr(l:size) + a:amount
    exec 'GuiFont ' . l:head . l:size . l:tail
endfunction

function! ResetFontSize()
    " Set font to whatever Konsole uses
    " We can't do this heuristically because Shuriken and Yuki have the same DPI
    if has('nvim')
        let s:cmd = 'GuiFont Droid Sans Mono:h'
    else
        let s:cmd = 'set guifont=Droid\ Sans\ Mono '
    endif

    let s:fontsize = system("awk '($1 == \"font_size\") {print $2 }' ~/.config/kitty/kitty.conf")
    execute s:cmd . s:fontsize
endfunction

