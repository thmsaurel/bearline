" Beargeek statusline
" " TITLE "
"
" File Name         : beargeek.vim
" Created By        : Thomas Aurel
" Creation Date     : January  2th, 2015
" Version           : 0.1
" Last Change       : January  3th, 2015 at 02:05:15
" Last Changed By   : Thomas Aurel
"
if !g:beargeek_statusline
    finish
endif

set laststatus=2
function! BeargeekMode()
    if mode() ==# "i"
        let l:mode="insert"
    elseif mode() ==# "R"
        let l:mode="remplace"
    elseif mode() =~# '\v(v|V|s|S)'
        let l:mode="visual"
    else
        let l:mode="normal"
    endif
    return l:mode
endfunction

set statusline=%#sl_mode#%{BeargeekMode()}\ %#sl_separator#>\ %#sl_file#%f\ 
set statusline+=%#sl_readonly#%r
set statusline+=%#sl_modified#%m
set statusline+=%#sl_separator#\ %=\ %#sl_filetype#%y%#sl_separator#\ <\ %c\ -\ %l/%L[%02p%%]

highlight sl_readonly ctermfg=1
highlight sl_modified ctermfg=2

