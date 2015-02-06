" Beargeek statusline
" " TITLE "
"
" Created By        : Thomas Aurel
" Creation Date     : January  2th, 2015
" Version           : 0.1
" Last Change       : February  5th, 2015 at 12:52:11
" Last Changed By   : Thomas Aurel
"
if !exists("g:beargeek_statusline")
    let g:beargeek_statusline = 0
endif

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

function! s:sl_hion()
    " Statusline Syntax ON
    highlight sl_mode cterm=inverse,bold ctermfg=14 ctermbg=0
    highlight sl_file cterm=bold ctermfg=14
    highlight sl_filetype cterm=bold ctermfg=255
endfunction

function! s:sl_hioff()
    " Statusline Syntax OFF
    highlight sl_mode cterm=NONE ctermbg=234 ctermfg=237
    highlight sl_file cterm=NONE ctermbg=234 ctermfg=237
    highlight sl_filetype cterm=NONE ctermbg=234 ctermfg=237
endfunction

function! s:sl_ie()
    highlight sl_mode cterm=inverse,bold ctermfg=2 ctermbg=0
endfunction

function! s:sl_il()
    highlight sl_mode cterm=inverse,bold ctermfg=14 ctermbg=0
endfunction

highlight sl_readonly ctermfg=1
highlight sl_modified ctermfg=2

augroup sl_colors
    " Statusline autocmd
    autocmd!
    autocmd VimEnter * call s:sl_hion()
    autocmd WinEnter * call s:sl_hion()
    autocmd WinLeave * call s:sl_hioff()
    autocmd InsertEnter * call s:sl_ie()
    autocmd InsertLeave * call s:sl_il()
augroup END


