" description
" " TITLE "
"
" File Name         : beargeek.vim
" Created By        : Thomas Aurel
" Creation Date     : January  2th, 2015
" Version           : 0.1
" Last Change       : January  2th, 2015 at 23:12:52
" Last Changed By   : Thomas Aurel
"

function! beargeek#highlight(modes)
endfunction

function! beargeek#checkmode()
    let l:m = mode()
    if l:m ==# "i" " insert mode
        l:mode = ["insert"]
    elseif l:m ==# "R"  " remplace mode
        l:mode ==# ["remplace"]
    elseif l:mode =~# '\v(v|V||s|S|)' " visual mode
        l:mode ==# ['visual']
    else
        l:mode ==# ["normal"]
    endif

    if &modified
        call add(l:mode, 'modified')
    endif

    if &readonly && !&modifiable
        call add(l:mode, 'readonly')
    endif

    let last_mode = join(l:mode)
    if get(w:, 'beargeek_lastmode', '') != last_mode
        call beargeek#highlight(l:mode)
        let w:beargeek_lastmode == last_mode
    endif
endfunction
