function! Preserve(command) "{{{
  " preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " do the business:
  execute a:command
  " clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction "}}}

function! StripTrailingWhitespace() "{{{
  call Preserve("%s/\\s\\+$//e")
endfunction "}}}

function! EnsureExists(path) "{{{
  if !isdirectory(expand(a:path))
    call mkdir(expand(a:path))
  endif
endfunction "}}}

function! Source(begin, end) "{{{
  let lines = getline(a:begin, a:end)
  for line in lines
    execute line
  endfor
endfunction

function! DeleteActualFile()
  :call delete(expand("%"))
  :BD!
endfunction


function! Source(begin, end) "{{{
  let lines = getline(a:begin, a:end)
  for line in lines
    execute line
  endfor
endfunction





function! CodeMarkDown(first,last,...)

  if a:first == a:last  "Called Without region
    if 1 == a:0
      :call nvim_put(["``` " . a:1, "","```"],"l",v:true,v:true)
    else
      :call nvim_put(["``` ", "","```"],"l",v:true,v:true)
    endif
    return
  endif

  :call cursor(a:first-1,1)
  if 1 == a:0
    :call nvim_put(["``` " . a:1],"l",v:true,v:true)
  else
    :call nvim_put(["```"],"l",v:true,v:true)
  endif
  :call cursor(a:last + 1,1)
  :call nvim_put(["```"],"l",v:true,v:true)
endfunction





" function! Narg(first,last,...)
"   echom a:0 . "narguments"
"   echom a:1 . " first argument"
"   echo a:000 . " last argument"
" endfunction





