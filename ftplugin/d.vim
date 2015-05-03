" Start DCD server (Dutyl doesn't do this automatically)
if filereadable($HOME . '/.config/dcd/dcd.conf')
    DUDCDstartServer
    autocmd VimLeave * DUDCDstopServer
else
    echom 'Please create ~/.config/dcd/dcd.conf to enable autocompletion.'
    echom 'See: https://github.com/Hackerpilot/DCD'
endif

