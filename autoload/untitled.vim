" Name:         Untitled.vim
" Description:  Project-sekai inspired vim plugin
" Author:       MeF
" GitHub:       https://github.com/MeF0504/untitled.vim
" Version:      0.3.0

" initialization
let g:untitled_sekai_color_scheme = get(g:, 'untitled_sekai_color_scheme', [
            \ 'pjsekai_leo_need',
            \ 'pjsekai_more_more_jump',
            \ 'pjsekai_vivid_bad_squad',
            \ 'pjsekai_wonderlands_showtime',
            \ 'pjsekai_25ji_nightcode_de',
            \ ])
""" DEBUG START
let s:debug = 1
""" DEBUG END

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

""" DEBUG START
if s:debug
    for i in range(10)
        if exists('s:tri_sample'.i)
            execute 'let s:tri_sample'.i.'[0] = substitute(s:tri_sample'.i.'[0], "|", "'.i.'", "")'
        endif
    endfor
endif
""" DEBUG END
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

function! s:local_rand()
    if exists('*rand')
        return rand()
    elseif has('reltime')
        " https://vim-jp.org/vim-users-jp/2009/11/05/Hack-98.html
        let match_end = matchend(reltimestr(reltime()), '\d\+\.')+1
        let rand_num = str2nr(reltimestr(reltime())[l:match_end:])
        return rand_num
    else
        " no way...
        return 0
    endif
endfunction

function! s:normal(mean, std)
    " Box-Mueller's method
    let pi = 3.14159265
    let X = s:local_rand()%100/100.0
    let Y = s:local_rand()%100/100.0
    let Z = sqrt(-2*log(X))*cos(2*pi*Y)
    return a:mean+a:std*Z
endfunction

function! s:display_tri(id, tri, config)
    if has('popupwin')
        let popid = popup_create(a:tri, a:config)
    else
        let width = 1
        let height = 1
        if type(a:tri) == type([])
            let height = len(a:tri)
            for tri_str in a:tri
                if len(tri_str) > width
                    let width = len(tri_str)
                endif
            endfor
        endif

        let anc = 'NW'
        if has_key(a:config, 'pos')
            if a:config.pos == 'topleft'
                let anc = 'NW'
            elseif a:config.pos == 'topright'
                let anc = 'NE'
            elseif a:config.pos == 'botleft'
                let anc = 'SW'
            elseif a:config.pos == 'botright'
                let anc = 'SE'
            endif
        endif

        let config = {
                    \ 'relative' : 'editor',
                    \ 'width' : width,
                    \ 'height' : height,
                    \ 'row' : a:config['line'],
                    \ 'col' : a:config['col'],
                    \ 'anchor' : anc,
                    \ 'style': 'minimal',
                    \ 'zindex' : a:config['zindex'],
                    \ 'focusable' : v:false,
                    \ }
        if !exists("s:bufnr".a:id)
            execute "let s:bufnr".a:id." = nvim_create_buf(v:false, v:true)"
            execute "let bufnr = s:bufnr".a:id

            if type(a:tri) == type([])
                let tri = a:tri
            else
                let tri = [a:tri]
            endif

            call nvim_buf_set_lines(bufnr, 0, -1, 0, tri)
        else
            execute "let bufnr = s:bufnr".a:id
        endif

        if !exists("s:popid".a:id)
            let popid = nvim_open_win(bufnr, v:false, config)
            call win_execute(popid, "set winhighlight=Normal:".a:config['highlight'])
        else
            execute "let popid = s:popid".a:id
            call nvim_win_set_config(popid, config)
        endif
    endif
    return popid

endfunction

function! untitled#untitled()
    " let line_times = 1.5
    let tri_iter = 30
    let line_times = (&lines-16.0)/tri_iter
    " let col_times = 6.0
    let col_times = line_times*&columns/&lines
    let tri_mode = 1

    call s:set_colors()

    " posx = [l_st, c_st, l_end, c_end], relative to bottom right
    " values are 0 <= X <= 1
    let pos0 = [0.5, 0.15, 1.0, 0.5]
    let pos1 = [0.1, 0.01, 0.45, 0.38]
    let pos2 = [0.35, 0.36, 0.68, 0.69]
    let pos3 = [0.25, 0.14, 0.60, 0.47]
    let pos4 = [0.46, 0.1, 0.81, 0.40]
    let pos5 = [0.56, 0.43, 0.9, 0.75]
    let pos6 = [0.52, 0.25, 0.85, 0.58]
    let pos7 = [0.14, 0.34, 0.5, 0.69]
    for i in range(tri_iter)
        if (tri_mode==0) || (tri_mode==1)
            " let line0 = &lines-float2nr(i*line_times)-16
            " let col0  = &columns-float2nr(i*col_times)-21
            let line0 = &lines-float2nr((&lines-len(s:tri_sample0))*(pos0[0]+i*(pos0[2]-pos0[0])/(tri_iter-1)))
            let col0  = &columns-float2nr((&columns-len(s:tri_sample0[0]))*(pos0[1]+i*(pos0[3]-pos0[1])/(tri_iter-1)))
            let conf0 = {
                        \ "highlight": 'Triang0',
                        \ "line": line0,
                        \ "col":  col0,
                        \ "pos": "botright",
                        \ "zindex": 100,
                        \ }
            let s:popid0 = s:display_tri(0, s:tri_sample0, conf0)

            " let line1 = &lines-float2nr(i*line_times)-6
            " let col1  = &columns-float2nr(i*col_times)-6
            let line1 = &lines-float2nr((&lines-len(s:tri_sample1))*(pos1[0]+i*(pos1[2]-pos1[0])/(tri_iter-1)))
            let col1  = &columns-float2nr((&columns-len(s:tri_sample1[0]))*(pos1[1]+i*(pos1[3]-pos1[1])/(tri_iter-1)))
            let conf1 = {
                        \ "highlight": 'Triang1',
                        \ "line": line1,
                        \ "col":  col1,
                        \ "pos": "botright",
                        \ "zindex": 100,
                        \ }
            let s:popid1 = s:display_tri(1, s:tri_sample1, conf1)

            " let line2 = &lines-float2nr(i*line_times)-10
            " let col2  = &columns-float2nr(i*col_times)-42
            let line2 = &lines-float2nr((&lines-len(s:tri_sample2))*(pos2[0]+i*(pos2[2]-pos2[0])/(tri_iter-1)))
            let col2  = &columns-float2nr((&columns-len(s:tri_sample2[0]))*(pos2[1]+i*(pos2[3]-pos2[1])/(tri_iter-1)))
            let conf2 = {
                        \ "highlight": 'Triang2',
                        \ "line": line2,
                        \ "col":  col2,
                        \ "pos": "botright",
                        \ "zindex": 100,
                        \ }
            let s:popid2 = s:display_tri(2, s:tri_sample2, conf2)

            " let line3 = &lines-float2nr(i*line_times)-8
            " let col3  = &columns-float2nr(i*col_times)-19
            let line3 = &lines-float2nr((&lines-len(s:tri_sample3))*(pos3[0]+i*(pos3[2]-pos3[0])/(tri_iter-1)))
            let col3  = &columns-float2nr((&columns-len(s:tri_sample3[0]))*(pos3[1]+i*(pos3[3]-pos3[1])/(tri_iter-1)))
            let conf3 = {
                        \ "highlight": 'Triang3',
                        \ "line": line3,
                        \ "col":  col3,
                        \ "pos": "botright",
                        \ "zindex": 100,
                        \ }
            let s:popid3 = s:display_tri(3, s:tri_sample3, conf3)

            " let line4 = &lines-float2nr(i*line_times)-13
            " let col4  = &columns-float2nr(i*col_times)-13
            let line4 = &lines-float2nr((&lines-len(s:tri_sample4))*(pos4[0]+i*(pos4[2]-pos4[0])/(tri_iter-1)))
            let col4  = &columns-float2nr((&columns-len(s:tri_sample4[0]))*(pos4[1]+i*(pos4[3]-pos4[1])/(tri_iter-1)))
            let conf4 = {
                        \ "highlight": 'Triang4',
                        \ "line": line4,
                        \ "col":  col4,
                        \ "pos": "botright",
                        \ "zindex": 100,
                        \ }
            let s:popid4 = s:display_tri(4, s:tri_sample4, conf4)

            " let line5 = &lines-float2nr(i*line_times)-14
            " let col5  = &columns-float2nr(i*col_times)-48
            let line5 = &lines-float2nr((&lines-len(s:tri_sample5))*(pos5[0]+i*(pos5[2]-pos5[0])/(tri_iter-1)))
            let col5  = &columns-float2nr((&columns-len(s:tri_sample5[0]))*(pos5[1]+i*(pos5[3]-pos5[1])/(tri_iter-1)))
            let conf5 = {
                        \ "highlight": 'Triang5',
                        \ "line": line5,
                        \ "col":  col5,
                        \ "pos": "botright",
                        \ "zindex": 100,
                        \ }
            let s:popid5 = s:display_tri(5, s:tri_sample5, conf5)

            " let line6 = &lines-float2nr(i*line_times)-13
            " let col6  = &columns-float2nr(i*col_times)-34
            let line6 = &lines-float2nr((&lines-len(s:tri_sample6))*(pos6[0]+i*(pos6[2]-pos6[0])/(tri_iter-1)))
            let col6  = &columns-float2nr((&columns-len(s:tri_sample6[0]))*(pos6[1]+i*(pos6[3]-pos6[1])/(tri_iter-1)))
            let conf6 = {
                        \ "highlight": 'Triang6',
                        \ "line": line6,
                        \ "col":  col6,
                        \ "pos": "botright",
                        \ "zindex": 100,
                        \ }
            let s:popid6 = s:display_tri(6, s:tri_sample6, conf6)

            " let line7 = &lines-float2nr(i*line_times)-6
            " let col7  = &columns-float2nr(i*col_times)-39
            let line7 = &lines-float2nr((&lines-len(s:tri_sample7))*(pos7[0]+i*(pos7[2]-pos7[0])/(tri_iter-1)))
            let col7  = &columns-float2nr((&columns-len(s:tri_sample7[0]))*(pos7[1]+i*(pos7[3]-pos7[1])/(tri_iter-1)))
            let conf7 = {
                        \ "highlight": 'Triang7',
                        \ "line": line7,
                        \ "col":  col7,
                        \ "pos": "botright",
                        \ "zindex": 100,
                        \ }
            let s:popid7 = s:display_tri(7, s:tri_sample7, conf7)
        endif

        if (tri_mode==1) || (tri_mode==2)
            for j in range(10, 79)
                let hi_rand = s:local_rand()%3
                let pop_dict = {
                            \ "highlight": 'Triang1'.hi_rand,
                            \ "line": float2nr(s:normal(&lines-float2nr(i*line_times)-8, &lines/5)),
                            \ "col":  float2nr(s:normal(&columns-float2nr(i*col_times)-24, &columns/5)),
                            \ "zindex": 150,
                            \ }
                execute "let s:popid".j." = s:display_tri(".j.", s:tri_sample".j/10."0, pop_dict)"
            endfor
        endif

        redraw!
        sleep 60ms
        """ DEBUG START
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
        """ DEBUG END
        for i in range(80)
            if exists('s:popid'.i) && has('popupwin')
                execute 'call popup_close(s:popid'.i.')'
            endif
        endfor
    endfor
    for i in range(80)
        if exists('s:popid'.i) && has('nvim')
            execute 'call nvim_win_close(s:popid'.i.', v:false)'
            execute "unlet s:popid".i
        endif
    endfor

    """ DEBUG START
    if s:debug
        echo "line:".&lines." vs columns:".&columns." div;".&columns/&lines
    endif

    """ DEBUG END
    let col_rand = s:local_rand()%len(g:untitled_sekai_color_scheme)
    execute 'silent colorscheme '.g:untitled_sekai_color_scheme[col_rand]

endfunction
