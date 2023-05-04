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

let s:group_color = untitled#ln#group_color
let s:miku        = untitled#ln#miku
let s:ruka        = untitled#ln#ruka
let s:ichika      = untitled#ln#ichika
let s:saki        = untitled#ln#saki
let s:honami      = untitled#ln#honami
let s:shiho       = untitled#ln#shiho

call untitled#set_color#set_color(s:group_color, s:miku, s:ruka, s:ichika, s:saki, s:honami, s:shiho, ['235', '#10003b'])
