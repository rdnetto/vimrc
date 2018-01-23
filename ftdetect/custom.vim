" Force Markdown for *.md, since I'm never going to work with Modula-2 files
autocmd BufNewFile,BufRead *.md set filetype=markdown

" Add support for files using C preprocessor
autocmd BufNewFile,BufRead *.hsc set filetype=haskell

" Soy
autocmd BufNewFile,BufRead *.soy set filetype=soy

" Nix
autocmd BufNewFile,BufRead *.nix set filetype=nix
