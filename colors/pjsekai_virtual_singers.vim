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

let s:group_color = untitled#groups#vs#group_color.color
let s:miku        = untitled#groups#vs#miku.color
let s:rin         = untitled#groups#vs#rin.color
let s:len         = untitled#groups#vs#len.color
let s:luka        = untitled#groups#vs#luka.color
let s:meiko       = untitled#groups#vs#meiko.color
let s:kaito       = untitled#groups#vs#kaito.color

call untitled#color#set_color(s:group_color, s:meiko, s:kaito, s:miku, s:rin, s:len, s:luka, ['235', '#262626'])
