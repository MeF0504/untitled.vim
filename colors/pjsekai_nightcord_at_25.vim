" Name:         Untitled.vim
" Description:  Project-sekai inspired vim plugin
" Author:       MeF

highlight clear
if exists('syntax_on')
    syntax reset
endif

let g:colors_name = 'pjsekai_nightcord_at_25'

" set background=light
set background=dark

let s:group_color = [0x74, 0x2e, 0x87]
let s:miku        = [0xdc, 0xd4, 0xd6]
let s:kanade      = [0xac, 0x4e, 0x75]
let s:mafuyu      = [0x74, 0x73, 0xc0]
let s:ena         = [0xc1, 0x99, 0x74]
let s:mizuki      = [0xcb, 0x91, 0xb9]

" source <sfile>:h:h/autoload/untitled/set_color.vim

call untitled#set_color#set_color(s:group_color, s:miku, s:miku, s:kanade, s:mafuyu, s:ena, s:mizuki, ['235', '#262626'])

