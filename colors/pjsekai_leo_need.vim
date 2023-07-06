" Name:         Untitled.vim
" Description:  Project-sekai inspired vim plugin
" Author:       MeF

highlight clear
if exists('syntax_on')
    syntax reset
endif

let g:colors_name = 'pjsekai_leo_need'

" set background=light
set background=dark

let s:group_color = untitled#groups#ln#group_color.color
let s:miku        = untitled#groups#ln#miku.color
let s:luka        = untitled#groups#ln#luka.color
let s:ichika      = untitled#groups#ln#ichika.color
let s:saki        = untitled#groups#ln#saki.color
let s:honami      = untitled#groups#ln#honami.color
let s:shiho       = untitled#groups#ln#shiho.color

call untitled#color#set_color(s:group_color, s:miku, s:luka, s:ichika, s:saki, s:honami, s:shiho, ['235', '#10003b'])
