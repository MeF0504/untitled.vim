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

let s:group_color = [0x9a, 0x9a, 0x9a]
let s:miku        = [0x23, 0xc3, 0xac]
let s:rin         = [0xfd, 0xc3, 0x13]
let s:ren         = [0xfe, 0xed, 0x13]
let s:ruka        = [0xfd, 0xd6, 0xec]
let s:meiko       = [0xd3, 0x2d, 0x34]
let s:kaito       = [0x27, 0x4e, 0xc2]

" source <sfile>:h:h/autoload/untitled/set_color.vim

call untitled#set_color#set_color(s:group_color, s:meiko, s:kaito, s:miku, s:rin, s:ren, s:ruka, ['235', '#262626'])
