" Name:         Untitled.vim
" Description:  Project-sekai inspired vim plugin
" Author:       MeF

if exists('g:loaded_untitled')
    finish
endif
let g:loaded_untitled = 1

if !exists('*popup_create')
    finish
endif
if !exists('*rand')
    finish
endif

command! Untitled call untitled#untitled()

