" Name:         Untitled.vim
" Description:  Project-sekai inspired vim plugin
" Author:       MeF
" GitHub:       https://github.com/MeF0504/untitled.vim
" Version:      1.2.4

" initialization
let g:untitled_sekai_color_scheme = get(g:, 'untitled_sekai_color_scheme', [
            \ 'pjsekai_virtual_singers',
            \ 'pjsekai_leo_need',
            \ 'pjsekai_more_more_jump',
            \ 'pjsekai_vivid_bad_squad',
            \ 'pjsekai_wonderlands_showtime',
            \ 'pjsekai_nightcord_at_25',
            \ ])
let s:popid = {}

function! s:set_colors()
    " highlight settings
    highlight Triang0  ctermfg=229 ctermbg=None guifg=Yellow guibg=NONE
    highlight Triang1  ctermfg=213 ctermbg=None guifg=Pink   guibg=NONE
    highlight Triang2  ctermfg=213 ctermbg=None guifg=Pink   guibg=NONE
    highlight Triang3  ctermfg=51  ctermbg=None guifg=Cyan   guibg=NONE
    highlight Triang4  ctermfg=51  ctermbg=None guifg=Cyan   guibg=NONE
    highlight Triang5  ctermfg=51  ctermbg=None guifg=Cyan   guibg=NONE
    highlight Triang6  ctermfg=213 ctermbg=None guifg=Pink   guibg=NONE
    highlight Triang7  ctermfg=229 ctermbg=None guifg=Yellow guibg=NONE
    highlight Triang10 ctermfg=51  ctermbg=None guifg=Cyan   guibg=NONE
    highlight Triang11 ctermfg=213 ctermbg=None guifg=Pink   guibg=NONE
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
        endif
        execute "let bufnr = s:bufnr".a:id

        if type(a:tri) == type([])
            let tri = a:tri
        else
            let tri = [a:tri]
        endif

        call nvim_buf_set_lines(bufnr, 0, -1, 0, tri)

        if !has_key(s:popid, a:id)
            let popid = nvim_open_win(bufnr, v:false, config)
            call win_execute(popid, "set winhighlight=Normal:".a:config['highlight'])
        else
            let popid = s:popid[a:id]
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
    let pos0 = [0.50, 0.15, 1.00, 0.50]
    " let pos1 = [0.10, 0.01, 0.45, 0.38]
    let pos1 = [0.10, 0.01, 0.25, 0.78]
    let pos2 = [0.35, 0.36, 0.68, 0.69]
    let pos3 = [0.25, 0.14, 0.60, 0.47]
    " let pos4 = [0.46, 0.10, 0.81, 0.40]
    let pos4 = [0.46, 0.10, 0.81, 0.30]
    let pos5 = [0.56, 0.43, 0.90, 0.75]
    let pos6 = [0.52, 0.25, 0.85, 0.58]
    let pos7 = [0.14, 0.34, 0.50, 0.69]

    for i in range(tri_iter)
        if (tri_mode==0) || (tri_mode==1)
            for j in range(8)
                let tri_sample = untitled#chars#get_tri(j)
                let tri_sample = tri_sample[(i/2)%len(tri_sample)]
                execute "let pos = pos".j
                let line = &lines-float2nr((&lines-len(tri_sample))*(pos[0]+i*(pos[2]-pos[0])/(tri_iter-1)))
                let col  = &columns-float2nr((&columns-len(tri_sample[0]))*(pos[1]+i*(pos[3]-pos[1])/(tri_iter-1)))
                let conf = {
                            \ "highlight": 'Triang'.j,
                            \ "line": line,
                            \ "col":  col,
                            \ "pos": "botright",
                            \ "zindex": 100,
                            \ }
                let s:popid[j] = s:display_tri(j, tri_sample, conf)
            endfor
        endif

        if (tri_mode==1) || (tri_mode==2)
            for j in range(10, 79)
                let tri_sample = untitled#chars#get_tri(j/10."0")[0]
                let hi_rand = s:local_rand()%3
                let pop_dict = {
                            \ "highlight": 'Triang1'.hi_rand,
                            \ "line": float2nr(s:normal(&lines-float2nr(i*line_times)-8, &lines/5)),
                            \ "col":  float2nr(s:normal(&columns-float2nr(i*col_times)-24, &columns/5)),
                            \ "zindex": 150,
                            \ }
                let s:popid[j] = s:display_tri(j, tri_sample, pop_dict)
            endfor
        endif

        redraw!
        sleep 100ms
        for j in range(80)
            if has_key(s:popid, j) && has('popupwin')
                call popup_close(s:popid[j])
            endif
        endfor
    endfor
    for i in range(80)
        if has_key(s:popid, i) && has('nvim')
            call nvim_win_close(s:popid[i], v:false)
            unlet s:popid[i]
        endif
    endfor

    let col_rand = s:local_rand()%len(g:untitled_sekai_color_scheme)
    execute 'silent colorscheme '.g:untitled_sekai_color_scheme[col_rand]

endfunction

function! untitled#get_birthday_color() abort
    if !exists('*strftime')
        return {}
    endif
    let today = strftime('%m/%d')
    let birthdays = {}
    for member in [
                \ g:untitled#groups#vs#miku,
                \ g:untitled#groups#vs#rin,
                \ g:untitled#groups#vs#len,
                \ g:untitled#groups#vs#luka,
                \ g:untitled#groups#vs#meiko,
                \ g:untitled#groups#vs#kaito,
                \ g:untitled#groups#ln#ichika,
                \ g:untitled#groups#ln#saki,
                \ g:untitled#groups#ln#honami,
                \ g:untitled#groups#ln#shiho,
                \ g:untitled#groups#mmj#minori,
                \ g:untitled#groups#mmj#haruka,
                \ g:untitled#groups#mmj#airi,
                \ g:untitled#groups#mmj#shizuku,
                \ g:untitled#groups#vbs#kohane,
                \ g:untitled#groups#vbs#an,
                \ g:untitled#groups#vbs#akito,
                \ g:untitled#groups#vbs#toya,
                \ g:untitled#groups#wxs#tsukasa,
                \ g:untitled#groups#wxs#emu,
                \ g:untitled#groups#wxs#nene,
                \ g:untitled#groups#wxs#rui,
                \ g:untitled#groups#25#kanade,
                \ g:untitled#groups#25#mafuyu,
                \ g:untitled#groups#25#ena,
                \ g:untitled#groups#25#mizuki,
                \ ]
        if has_key(member, 'birthday')
            let birthdays[member.birthday] = member.color
        endif
    endfor
    for bd in keys(birthdays)
        if bd ==# today
            let col = birthdays[today]
            let gcol = untitled#color#get_colorid(col, 1)
            let ccol = untitled#color#get_colorid(col, 0)
            return {'gui': gcol, 'cterm': ccol, 'RGB': col}
        endif
    endfor
    return {}
endfunction

