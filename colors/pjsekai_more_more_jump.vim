" Name:         Untitled.vim
" Description:  Project-sekai inspired vim plugin
" Author:       MeF

highlight clear
if exists('syntax_on')
    syntax reset
endif

let g:colors_name = 'pjsekai_more_more_jump'

set background=light
" set background=dark

let s:group_color = [0x78, 0xda, 0x35]
let s:miku        = [0x63, 0xb2, 0xad]
let s:rin         = [0xfd, 0xc3, 0x13]
let s:minori      = [0xfd, 0xc2, 0x9d]
let s:haruka      = [0x6c, 0x96, 0xc7]
let s:airi        = [0xfd, 0x94, 0xc1]
let s:shizuku     = [0x67, 0xac, 0x9c]

" source <sfile>:h:h/autoload/untitled/set_color.vim

call untitled#set_color#set_color(s:group_color, s:miku, s:rin, s:minori, s:haruka, s:airi, s:shizuku, ['195', '#d7ffff'])

