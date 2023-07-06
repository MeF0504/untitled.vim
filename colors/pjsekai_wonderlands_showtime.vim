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

let s:group_color = untitled#groups#wxs#group_color.color
let s:miku        = untitled#groups#wxs#miku.color
let s:kaito       = untitled#groups#wxs#kaito.color
let s:tsukasa     = untitled#groups#wxs#tsukasa.color
let s:emu         = untitled#groups#wxs#emu.color
let s:nene        = untitled#groups#wxs#nene.color
let s:rui         = untitled#groups#wxs#rui.color

call untitled#color#set_color(s:group_color, s:miku, s:kaito, s:tsukasa, s:emu, s:nene, s:rui, ['230', '#ffffd7'])


