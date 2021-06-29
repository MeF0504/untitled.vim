" Name:         Untitled.vim
" Description:  Project-sekai inspired vim plugin
" Author:       MeF
" GitHub:       https://github.com/MeF0504/
" Version:      0.1.0

" initialization
let s:debug = 0
let g:untitled_sekai_color_scheme = get(g:, 'untitled_sekai_color_scheme', [
            \ 'pjsekai_leo_need',
            \ 'pjsekai_more_more_jump',
            \ 'pjsekai_vivid_bad_squad',
            \ 'pjsekai_wonderlands_showtime',
            \ 'pjsekai_25ji_nightcode_de',
            \ ])

" displayed characters
let s:tri_sample0 =<< EOL
|\
|  \
|    \
|    /
|  /
|/
EOL

let s:tri_sample1 =<< EOL
    /|
  /  |
/    |
\    |
  \  |
    \|
EOL

let s:tri_sample2 =<< EOL
|\
|||\
|||/
|/
EOL

let s:tri_sample3 =<< EOL
|\
|  \
|  /
|/
EOL

let s:tri_sample4 =<< EOL
  /|
/|||
\|||
  \|
EOL

let s:tri_sample5 =<< EOL
  /|
/  |
\  |
  \|
EOL

let s:tri_sample6 =<< EOL
|\
|  \
|    \
|______\
EOL

let s:tri_sample7 =<< EOL
    /|
   / |
  /  |
 /   |
/____|
EOL

let s:tri_sample10 = '▶'
let s:tri_sample20 = '▷'
let s:tri_sample30 = '◀'
let s:tri_sample40 = '◁'
let s:tri_sample50 = '⊿'
let s:tri_sample60 = '▲'
let s:tri_sample70 = '△'

function! s:set_colors()
    " highlight settings
    highlight Triang0  ctermfg=229 ctermbg=None guifg=Yellow guibg=NONE
    highlight Triang1  ctermfg=213 ctermbg=None guifg=Pink guibg=NONE
    highlight Triang2  ctermfg=213 ctermbg=None guifg=Pink guibg=NONE
    highlight Triang3  ctermfg=51  ctermbg=None guifg=Cyan guibg=NONE
    highlight Triang4  ctermfg=51  ctermbg=None guifg=Cyan guibg=NONE
    highlight Triang5  ctermfg=51  ctermbg=None guifg=Cyan guibg=NONE
    highlight Triang6  ctermfg=213 ctermbg=None guifg=Pink guibg=NONE
    highlight Triang7  ctermfg=229 ctermbg=None guifg=Yellow guibg=NONE
    highlight Triang10 ctermfg=51  ctermbg=None guifg=Cyan guibg=NONE
    highlight Triang11 ctermfg=213 ctermbg=None guifg=Pink guibg=NONE
    highlight Triang12 ctermfg=229 ctermbg=None guifg=Yellow guibg=NONE
endfunction

function! s:normal(mean, std)
    " Box-Mueller's method
    let pi = 3.14159265
    let X = rand()%100/100.0
    let Y = rand()%100/100.0
    let Z = sqrt(-2*log(X))*cos(2*pi*Y)
    return a:mean+a:std*Z
endfunction

function! untitled#untitled()
    " let line_times = 1.5
    let tri_iter = 30
    let line_times = (&lines-16.0)/tri_iter
    " let col_times = 6.0
    let col_times = line_times*&columns/&lines
    let tri_mode = 1

    call s:set_colors()

    for i in range(tri_iter)
        if (tri_mode==0) || (tri_mode==1)
            let line0 = &lines-float2nr(i*line_times)-16
            let col0 =  &columns-float2nr(i*col_times)-21
            let s:popid0 = popup_create(s:tri_sample0, #{
                        \ highlight: 'Triang0',
                        \ line: line0,
                        \ col:  col0,
                        \ zindex: 100,
                        \ })

            let line1 = &lines-float2nr(i*line_times)-6
            let col1  = &columns-float2nr(i*col_times)-6
            let s:popid1 = popup_create(s:tri_sample1, #{
                        \ highlight: 'Triang1',
                        \ line: line1,
                        \ col:  col1,
                        \ zindex: 100,
                        \ })

            let line2 = &lines-float2nr(i*line_times)-10
            let col2  = &columns-float2nr(i*col_times)-42
            let s:popid2 = popup_create(s:tri_sample2, #{
                        \ highlight: 'Triang2',
                        \ line: line2,
                        \ col:  col2,
                        \ zindex: 100,
                        \ })

            let line3 = &lines-float2nr(i*line_times)-8
            let col3  = &columns-float2nr(i*col_times)-19
            let s:popid3 = popup_create(s:tri_sample3, #{
                        \ highlight: 'Triang3',
                        \ line: line3,
                        \ col:  col3,
                        \ zindex: 100,
                        \ })

            let line4 = &lines-float2nr(i*line_times)-13
            let col4  = &columns-float2nr(i*col_times)-13
            let s:popid4 = popup_create(s:tri_sample4, #{
                        \ highlight: 'Triang4',
                        \ line: line4,
                        \ col:  col4,
                        \ zindex: 100,
                        \ })

            let line5 = &lines-float2nr(i*line_times)-14
            let col5  = &columns-float2nr(i*col_times)-48
            let s:popid5 = popup_create(s:tri_sample5, #{
                        \ highlight: 'Triang5',
                        \ line: line5,
                        \ col:  col5,
                        \ zindex: 100,
                        \ })

            let line6 = &lines-float2nr(i*line_times)-13
            let col6  = &columns-float2nr(i*col_times)-34
            let s:popid6 = popup_create(s:tri_sample6, #{
                        \ highlight: 'Triang6',
                        \ line: line6,
                        \ col:  col6,
                        \ zindex: 100,
                        \ })

            let line7 = &lines-float2nr(i*line_times)-6
            let col7  = &columns-float2nr(i*col_times)-39
            let s:popid7 = popup_create(s:tri_sample7, #{
                        \ highlight: 'Triang7',
                        \ line: line7,
                        \ col:  col7,
                        \ zindex: 100,
                        \ })
        endif

        if (tri_mode==1) || (tri_mode==2)
            for j in range(10, 79)
                let hi_rand = rand()%3
                let pop_dict = #{
                            \ highlight: 'Triang1'.hi_rand,
                            \ line: float2nr(s:normal(&lines-float2nr(i*line_times)-8, &lines/5)),
                            \ col:  float2nr(s:normal(&columns-float2nr(i*col_times)-24, &columns/5)),
                            \ zindex: 150,
                            \ }
                execute "let s:popid".j." = popup_create(s:tri_sample".j/10."0, pop_dict)"
            endfor
        endif

        redraw!
        sleep 60ms
        if s:debug
            let pos_info = ""
            for i in range(100)
                if exists('line'.i) && exists('col'.i)
                    execute "let pos_info .= '".i."['.line".i.".'-'.col".i.".'] '"
                endif
            endfor
            echo pos_info
            call input('::')
        endif
        for i in range(80)
            if exists('s:popid'.i)
                execute 'call popup_close(s:popid'.i.')'
            endif
        endfor
    endfor
    if s:debug
        echo "line:".&lines." vs columns:".&columns." div;".&columns/&lines
    endif

    let col_rand = rand()%len(g:untitled_sekai_color_scheme)
    execute 'colorscheme '.g:untitled_sekai_color_scheme[col_rand]

endfunction
