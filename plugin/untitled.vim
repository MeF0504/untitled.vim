" Name:         Untitled.vim
" Description:  Project-sekai inspired vim plugin
" Author:       MeF

if exists('g:loaded_untitled')
    finish
endif
let g:loaded_untitled = 1

if !has('popupwin') && !has('nvim')
    finish
endif

if !exists('*rand') && !has('reltime')
    finish
endif

command! Untitled call untitled#untitled()

