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

let s:group_color = untitled#wxs#group_color
let s:miku        = untitled#wxs#miku
let s:kaito       = untitled#wxs#kaito
let s:tsukasa     = untitled#wxs#tsukasa
let s:emu         = untitled#wxs#emu
let s:nene        = untitled#wxs#nene
let s:rui         = untitled#wxs#rui

call untitled#color#set_color(s:group_color, s:miku, s:kaito, s:tsukasa, s:emu, s:nene, s:rui, ['230', '#ffffd7'])


