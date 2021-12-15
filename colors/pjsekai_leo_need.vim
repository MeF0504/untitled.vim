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

let s:group_color = [0x33, 0x3b, 0xd5]
let s:miku        = [0x4e, 0x87, 0x79]
let s:ruka        = [0xfd, 0xd6, 0xec]
let s:ichika      = [0x2b, 0x98, 0xe9]
let s:saki        = [0xfd, 0xd7, 0x37]
let s:honami      = [0xe8, 0x4d, 0x53]
let s:shiho       = [0xaa, 0xd6, 0x1b]

" source <sfile>:h:h/autoload/untitled/set_color.vim

call untitled#set_color#set_color(s:group_color, s:miku, s:ruka, s:ichika, s:saki, s:honami, s:shiho, ['235', '#10003b'])
