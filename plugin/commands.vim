command! Capitalize :normal!  "_yiwvgU
command! CleanCurrentFile :call CleanCurrentFile()
command! DeleteActualFile :call DeleteActualFile()
command! CodeEmpty :norm I``````k
" https://dev.to/dlains/create-your-own-vim-commands-415b
command! -range -nargs=? -complete=filetype  Code  :call CodeMarkDown(<line1> , <line2>, <f-args>)

":call nvim_put(['cat'], 'c', v:false, v:true) ; insert 'cat' right where the cursor is, as if you typed `:normal! icat`
":call nvim_put(['cat'], 'l', v:true, v:true) ; insert 'cat' on the next line



