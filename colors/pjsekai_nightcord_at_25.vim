" Name:         Untitled.vim
" Description:  Project-sekai inspired vim plugin
" Author:       MeF

highlight clear
if exists('syntax_on')
    syntax reset
endif

let g:colors_name = 'pjsekai_nightcord_at_25'

" set background=light
set background=dark

let s:group_color = untitled#groups#25#group_color
let s:miku        = untitled#groups#25#miku
let s:kanade      = untitled#groups#25#kanade
let s:mafuyu      = untitled#groups#25#mafuyu
let s:ena         = untitled#groups#25#ena
let s:mizuki      = untitled#groups#25#mizuki

call untitled#set_color#set_color(s:group_color, s:miku, s:miku, s:kanade, s:mafuyu, s:ena, s:mizuki, ['235', '#262626'])

