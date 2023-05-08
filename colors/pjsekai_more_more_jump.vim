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

let s:group_color = untitled#groups#mmj#group_color.color
let s:miku        = untitled#groups#mmj#miku.color
let s:rin         = untitled#groups#mmj#rin.color
let s:minori      = untitled#groups#mmj#minori.color
let s:haruka      = untitled#groups#mmj#haruka.color
let s:airi        = untitled#groups#mmj#airi.color
let s:shizuku     = untitled#groups#mmj#shizuku.color

call untitled#color#set_color(s:group_color, s:miku, s:rin, s:minori, s:haruka, s:airi, s:shizuku, ['195', '#d7ffff'])

