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

let s:group_color = untitled#groups#vs#group_color
let s:miku        = untitled#groups#vs#miku
let s:rin         = untitled#groups#vs#rin
let s:len         = untitled#groups#vs#len
let s:ruka        = untitled#groups#vs#ruka
let s:meiko       = untitled#groups#vs#meiko
let s:kaito       = untitled#groups#vs#kaito

call untitled#set_color#set_color(s:group_color, s:meiko, s:kaito, s:miku, s:rin, s:len, s:ruka, ['235', '#262626'])
