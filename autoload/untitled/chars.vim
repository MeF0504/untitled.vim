" Name:         Untitled.vim
" Description:  Project-sekai inspired vim plugin
" Author:       MeF

""" DEBUG START
let s:debug = 0
""" DEBUG END
" displayed characters
let s:tri_Lright =<< EOL
|\
|  \
|    \
|    /
|  /
|/
EOL

let s:tri_Lleft =<< EOL
    /|
  /  |
/    |
\    |
  \  |
    \|
EOL

let s:tri_Ltop =<< EOL
    /\
   /  \
  /    \
 /      \
/________\
EOL

let s:tri_Lbot =<< EOL
__________
\        /
 \      /
  \    /
   \  /
    \/
EOL

let s:tri_L2right =<< EOL
|\
|\\\
|\\\\\
|/////
|///
|/
EOL

let s:tri_L2left =<< EOL
    /|
  ///|
/////|
\\\\\|
  \\\|
    \|
EOL

let s:tri_L2top =<< EOL
    /\
   /||\
  /||||\
 /||||||\
/||||||||\
EOL

let s:tri_L2bot =<< EOL
__________
\||||||||/
 \||||||/
  \||||/
   \||/
    \/
EOL

let s:tri_Lbotleft =<< EOL
|\
|  \
|    \
|      \
|________\
EOL

let s:tri_Lbotright =<< EOL
        /|
      /  |
    /    |
  /      |
/________|
EOL

let s:tri_Ltopleft =<< EOL
__________
|        /
|      /
|    /
|  /
|/
EOL

let s:tri_Ltopright =<< EOL
_________
\        |
  \      |
    \    |
      \  |
        \|
EOL

let s:tri_M2right =<< EOL
|\
|\\\
|///
|/
EOL

let s:tri_M2left =<< EOL
  /|
///|
\\\|
  \|
EOL

let s:tri_M2top =<< EOL
   /\
  /||\
 /||||\
EOL

let s:tri_M2bot =<< EOL
______
\||||/
 \||/
  \/
EOL

let s:tri_Mright =<< EOL
|\
|  \
|  /
|/
EOL

let s:tri_Mleft =<< EOL
  /|
/  |
\  |
  \|
EOL

let s:tri_Mtop =<< EOL
   /\
  /  \
 /____\
EOL

let s:tri_Mbot =<< EOL
______
\    /
 \  /
  \/
EOL

let s:tri_Mbotright =<< EOL
    /|
   / |
  /  |
 /   |
/____|
EOL

let s:tri_Mbotleft =<< EOL
|\
| \
|  \
|   \
|____\
EOL

let s:tri_Mtopright =<< EOL
 _____
|    /
|   /
|  /
| /
|/
EOL

let s:tri_Mtopleft =<< EOL
_____
\    |
 \   |
  \  |
   \ |
    \|
EOL

let s:tri_sample0 = [
            \ s:tri_Lright,
            \ s:tri_Ltop,
            \ s:tri_Lleft,
            \ s:tri_Lbot,
            \ ]
let s:tri_sample1 = [
            \ s:tri_Ltopleft,
            \ s:tri_Lbotleft,
            \ s:tri_Lbotright,
            \ s:tri_Ltopright,
            \ ]
let s:tri_sample2 = [
            \ s:tri_M2top,
            \ s:tri_M2left,
            \ s:tri_M2bot,
            \ s:tri_M2right,
            \ ]
let s:tri_sample3 = [
            \ s:tri_Mright,
            \ s:tri_Mtop,
            \ s:tri_Mleft,
            \ s:tri_Mbot,
            \ ]
let s:tri_sample4 = [
            \ s:tri_M2left,
            \ s:tri_M2bot,
            \ s:tri_M2right,
            \ s:tri_M2top,
            \ ]
let s:tri_sample5 = [
            \ s:tri_Mleft,
            \ s:tri_Mbot,
            \ s:tri_Mright,
            \ s:tri_Mtop,
            \ ]
let s:tri_sample6 = [
            \ s:tri_Mbotleft,
            \ s:tri_Mbotright,
            \ s:tri_Mtopright,
            \ s:tri_Mtopleft,
            \ ]
let s:tri_sample7 = [
            \ s:tri_L2bot,
            \ s:tri_L2right,
            \ s:tri_L2top,
            \ s:tri_L2left,
            \ ]
let s:tri_sample10 = ['▶']
let s:tri_sample20 = ['▷']
let s:tri_sample30 = ['◀']
let s:tri_sample40 = ['◁']
let s:tri_sample50 = ['⊿']
let s:tri_sample60 = ['▲']
let s:tri_sample70 = ['△']

function! untitled#chars#get_tri(id)
    if exists('s:tri_sample'.a:id)
        execute "let tri_sample = s:tri_sample".a:id
        """ DEBUG START
        if s:debug == 1
            let L = len(tri_sample)
            for i in range(L)
                if type(tri_sample[i]) == type([])
                    let tri_sample[i][0] = substitute(tri_sample[i][0], ".", a:id, '')
                endif
            endfor
        endif
        """ DEBUG END
    else
        let tri_sample = []
    endif
    return tri_sample
endfunction

