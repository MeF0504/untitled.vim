" Name:         Untitled.vim
" Description:  Project-sekai inspired vim plugin
" Author:       MeF

highlight clear
if exists('syntax_on')
    syntax reset
endif

let g:colors_name = 'pjsekai_vivid_bad_squad'

" set background=light
set background=dark

let s:group_color = [0xe6, 0x00, 0x53]
let s:miku        = [0xa6, 0xd3, 0xb9]
let s:meiko       = [0xd3, 0x2d, 0x34]
let s:kohane      = [0xfc, 0x4b, 0x89]
let s:ann         = [0x17, 0xad, 0xd4]
let s:akito       = [0xfc, 0x61, 0x1a]
let s:toya        = [0x0e, 0x5f, 0xd4]

" source <sfile>:h:h/autoload/untitled/set_color.vim

call untitled#set_color#set_color(s:group_color, s:miku, s:meiko, s:kohane, s:ann, s:akito, s:toya, ['235', '#301f1a'])

