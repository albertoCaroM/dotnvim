:augroup ToogleCursorLineOnExitOrEnter
: autocmd!
: autocmd WinLeave *  setlocal nocursorline
: autocmd WinEnter *  setlocal cursorline
:augroup END

:augroup DisableNumberLinesOnTerminal
: autocmd!
: autocmd TermOpen * setlocal nonumber norelativenumber
:augroup END


:augroup  GoBackToPreviuousPositionOfCursorIfAny
:autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \  exe 'normal! g`"zvzz' |
      \ endif
:augroup END




