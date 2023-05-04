" Name:         Untitled.vim
" Description:  Project-sekai inspired vim plugin
" Author:       MeF

highlight clear
if exists('syntax_on')
    syntax reset
endif

let g:colors_name = 'pjsekai_virtual_singers'

" set background=light
set background=dark

let s:group_color = untitled#vs#group_color
let s:miku        = untitled#vs#miku
let s:rin         = untitled#vs#rin
let s:len         = untitled#vs#len
let s:ruka        = untitled#vs#ruka
let s:meiko       = untitled#vs#meiko
let s:kaito       = untitled#vs#kaito

call untitled#set_color#set_color(s:group_color, s:meiko, s:kaito, s:miku, s:rin, s:len, s:ruka, ['235', '#262626'])
