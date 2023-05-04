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

let s:group_color = untitled#groups#vbs#group_color
let s:miku        = untitled#groups#vbs#miku
let s:meiko       = untitled#groups#vbs#meiko
let s:kohane      = untitled#groups#vbs#kohane
let s:an          = untitled#groups#vbs#an
let s:akito       = untitled#groups#vbs#akito
let s:toya        = untitled#groups#vbs#toya

call untitled#set_color#set_color(s:group_color, s:miku, s:meiko, s:kohane, s:an, s:akito, s:toya, ['235', '#301f1a'])

