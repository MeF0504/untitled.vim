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

let s:group_color = untitled#groups#vbs#group_color.color
let s:miku        = untitled#groups#vbs#miku.color
let s:meiko       = untitled#groups#vbs#meiko.color
let s:kohane      = untitled#groups#vbs#kohane.color
let s:an          = untitled#groups#vbs#an.color
let s:akito       = untitled#groups#vbs#akito.color
let s:toya        = untitled#groups#vbs#toya.color

call untitled#color#set_color(s:group_color, s:miku, s:meiko, s:kohane, s:an, s:akito, s:toya, ['235', '#301f1a'])

