" Name:         Untitled.vim
" Description:  Project-sekai inspired vim plugin
" Author:       MeF

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

function! untitled#chars#get_tri(id)
    if exists('s:tri_sample'.a:id)
        execute "let tri_sample = s:tri_sample".a:id
    else
        let tri_sample = ''
    endif
    return tri_sample
endfunction

