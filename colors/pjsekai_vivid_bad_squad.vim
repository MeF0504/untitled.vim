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

let s:group_color = untitled#vbs#group_color
let s:miku        = untitled#vbs#miku
let s:meiko       = untitled#vbs#meiko
let s:kohane      = untitled#vbs#kohane
let s:an          = untitled#vbs#an
let s:akito       = untitled#vbs#akito
let s:toya        = untitled#vbs#toya

call untitled#set_color#set_color(s:group_color, s:miku, s:meiko, s:kohane, s:an, s:akito, s:toya, ['235', '#301f1a'])

