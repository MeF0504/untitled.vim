" Name:         Untitled.vim
" Description:  Project-sekai inspired vim plugin
" Author:       MeF

highlight clear
if exists('syntax_on')
    syntax reset
endif

let g:colors_name = 'pjsekai_wonderlands_showtime'

set background=light
" set background=dark

let s:group_color = [0xfc, 0x87, 0x06]
let s:miku        = [0x4d, 0xb8, 0xe7]
let s:kaito       = [0x27, 0x4e, 0xc2]
let s:tsukasa     = [0xfd, 0xae, 0x08]
let s:emu         = [0xfc, 0x48, 0xae]
let s:nene        = [0x31, 0xda, 0x88]
let s:rui         = [0xac, 0x6e, 0xe8]

" source <sfile>:h:h/autoload/untitled/set_color.vim

call untitled#set_color#set_color(s:group_color, s:miku, s:kaito, s:tsukasa, s:emu, s:nene, s:rui, ['230', '#ffffd7'])


