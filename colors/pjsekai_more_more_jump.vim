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

let s:group_color = untitled#mmj#group_color
let s:miku        = untitled#mmj#miku
let s:rin         = untitled#mmj#rin
let s:minori      = untitled#mmj#minori
let s:haruka      = untitled#mmj#haruka
let s:airi        = untitled#mmj#airi
let s:shizuku     = untitled#mmj#shizuku

call untitled#set_color#set_color(s:group_color, s:miku, s:rin, s:minori, s:haruka, s:airi, s:shizuku, ['195', '#d7ffff'])

