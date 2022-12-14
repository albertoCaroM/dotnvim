" returns all modified files of the current git repo
" `2>/dev/null` makes the command fail quietly, so that when we are not
" in a git repo, the list will be empty
function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" same as above, but show untracked files, honouring .gitignore
function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_bookmarks = [
      \ { 'i': '~/.config/nvim/init.lua' },
      \ { 'm': '~/.machinerc' },
      \ { 'p': '~/.config/nvim/lua/bruto/plugins.lua' },
     \ ]


let g:startify_lists = [
        \ { 'type': 'files',     'header': ['   MRU']            },
        \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
        \ { 'type': 'sessions',  'header': ['   Sessions']       },
        \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
        \ { 'type': function('s:gitModified'),  'header': ['   git modified']},
        \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
        \ { 'type': 'commands',  'header': ['   Commands']       },
        \ ]

let g:startify_session_dir = '~/.config/nvim/session'
"  You can automatically restart a session like this
let g:startify_session_autoload = 1
" Let Startify take care of buffers
let g:startify_session_delete_buffers = 1
let g:startify_change_to_vcs_root = 1
" If you want Unicode
let g:startify_fortune_use_unicode = 1
" Automatically Update Sessions
let g:startify_session_persistence = 1
" Get rid of empy buffer and quit
let g:startify_enable_special = 0
"  My custom header
" 
let g:ascii=[
      \ '       ____             __       _                           _____       ',
      \ '      / __ )_______  __/ /_____ ( )_____   _________  ____  / __(_)___ _ ',
      \ '     / __  / ___/ / / / __/ __ \|// ___/  / ___/ __ \/ __ \/ /_/ / __ `/ ',
      \ '    / /_/ / /  / /_/ / /_/ /_/ / (__  )  / /__/ /_/ / / / / __/ / /_/ /  ',
      \ '   /_____/_/   \__,_/\__/\____/ /____/   \___/\____/_/ /_/_/ /_/\__, /   ',
      \ '                                                               /____/    ',
      \ ]
 

if exists("startify#fortune#cowsay")
let g:startify_custom_header = g:ascii + startify#fortune#cowsay()
endif




