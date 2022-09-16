" Force Markdown for *.md, since I'm never going to work with Modula-2 files
autocmd BufNewFile,BufRead *.md set filetype=markdown

" Add support for files using C preprocessor
autocmd BufNewFile,BufRead *.hsc set filetype=haskell

" Soy
autocmd BufNewFile,BufRead *.soy set filetype=soy

" Nix
autocmd BufNewFile,BufRead *.nix set filetype=nix

" Maven
autocmd BufNewFile,BufRead *.pom set filetype=xml
autocmd BufNewFile,BufRead *.pom set foldmethod=indent

" Kotlin
autocmd BufNewFile,BufRead *.kt set filetype=kotlin
autocmd BufNewFile,BufRead *.kts set filetype=kotlin

" JSON5
autocmd BufNewFile,BufRead *.json5 set filetype=json
