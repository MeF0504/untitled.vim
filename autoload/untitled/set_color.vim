" Name:         Untitled.vim
" Description:  Project-sekai inspired vim plugin
" Author:       MeF

function! s:get_colorid(col)
    let r = a:col[0]
    let g = a:col[1]
    let b = a:col[2]
    " r, g, b: 0 ~ 255
    if has('gui_running')
        return '#' . printf('%02x', r) . printf('%02x', g) . printf('%02x', b)
    else
        let r = (r-55.0)/40
        let r = float2nr(r+0.5)
        if r<0 | let r = 0 | endif

        let g = (g-55.0)/40
        let g = float2nr(g+0.5)
        if g<0 | let g = 0 | endif

        let b = (b-55.0)/40
        let b = float2nr(b+0.5)
        if b<0 | let b = 0 | endif

        return (36*r)+(6*g)+b + 16
    endif
endfunction

function! untitled#set_color#set_color(group_color, col0, col1, col2, col3, col4, col5)
    if has('gui_running')
        let term = 'gui'
    else
        let term = 'cterm'
    endif

    if g:colors_name == 'pjsekai_leo_need'
        let Normal_bg     = has('gui_running') ? '#000087' : '235'
    elseif g:colors_name == 'pjsekai_more_more_jump'
        let Normal_bg     = has('gui_running') ? '#d7ffff' : '195'
    elseif g:colors_name == 'pjsekai_vivid_bad_squad'
        let Normal_bg     = has('gui_running') ? '#870000' : '235'
    elseif g:colors_name == 'pjsekai_wonderlands_showtime'
        let Normal_bg     = has('gui_running') ? '#ffffd7' : '230'
    elseif g:colors_name == 'pjsekai_nightcord_at_25'
        let Normal_bg     = has('gui_running') ? '#262626' : '235'
    endif

    if &background == 'dark'
        let Normal_fg     = has('gui_running') ? '#e4e4e4' : '254'
        let Normal_fg2    = has('gui_running') ? '#e4e4e4' : '254'
        " let Normal_bg     = has('gui_running') ? '#262626' : '235'
        let Error_bg      = has('gui_running') ? '#d70000' : '160'
        let Special_fg    = has('gui_running') ? '#af87ff' : '141'
        let Ignore_fg     = has('gui_running') ? '#9e9e9e' : '247'
        let ErrorMsg_fg   = has('gui_running') ? '#d70000' : '160'
        let WarningMsg_fg = has('gui_running') ? '#d7d75f' : '185'
        let DiffAdd_bg    = has('gui_running') ? '#875fff' : '99'
        let DiffChange_bg = has('gui_running') ? '#afaf00' : '142'
        let DiffDelete_bg = has('gui_running') ? '#af0000' : '124'
        let DiffText_bg   = has('gui_running') ? '#00875f' : '29'
        let Pmenu_bg      = has('gui_running') ? '#e4e4e4' : '254'
        let SpecialKey_bg = has('gui_running') ? '#949494' : '246'
        let SpellBad_bg   = has('gui_running') ? '#af0000' : '124'
        let SpellCap_bg   = has('gui_running') ? '#af8700' : '136'
        let SpellLocal_bg = has('gui_running') ? '#00af00' : '34'
        let SpellRare_bg  = has('gui_running') ? '#8700af' : '91'
        let FoldColumn_bg = has('gui_running') ? '#000000' : '16'
        let Search_fg     = has('gui_running') ? '#262626' : '235'
    else
        let Normal_fg     = has('gui_running') ? '#626262' : '241'
        let Normal_fg2    = has('gui_running') ? '#1c1c1c' : '234'
        " let Normal_bg     = has('gui_running') ? '#eeeeee' : '255'
        let Error_bg      = has('gui_running') ? '#ff0000' : '196'
        let Special_fg    = has('gui_running') ? '#af87ff' : '141'
        let Ignore_fg     = has('gui_running') ? '#9e9e9e' : '247'
        let ErrorMsg_fg   = has('gui_running') ? '#d70000' : '160'
        let WarningMsg_fg = has('gui_running') ? '#af8700' : '136'
        let DiffAdd_bg    = has('gui_running') ? '#d7afff' : '183'
        let DiffChange_bg = has('gui_running') ? '#d7ff5f' : '191'
        let DiffDelete_bg = has('gui_running') ? '#d7005f' : '161'
        let DiffText_bg   = has('gui_running') ? '#afff87' : '156'
        let Pmenu_bg      = has('gui_running') ? '#808080' : '244'
        let SpecialKey_bg = has('gui_running') ? '#949494' : '246'
        let SpellBad_bg   = has('gui_running') ? '#af0000' : '124'
        let SpellCap_bg   = has('gui_running') ? '#d7d75f' : '185'
        let SpellLocal_bg = has('gui_running') ? '#afd75f' : '149'
        let SpellRare_bg  = has('gui_running') ? '#d75fff' : '171'
        let FoldColumn_bg = has('gui_running') ? '#000000' : '16'
        let Search_fg     = has('gui_running') ? '#eeeeee' : '255'
    endif

    " :h group-name
    execute "highlight Comment"
                \ ." ".term."fg=".s:get_colorid(a:col1)
                \ ." ".term."bg=NONE"
                \ ." ".term."=NONE"
    execute "highlight Constant"
                \ ." ".term."fg=".s:get_colorid(a:col3)
                \ ." ".term."bg=NONE"
                \ ." ".term."=NONE"
    execute "highlight String"
                \ ." ".term."fg=".s:get_colorid(a:col5)
                \ ." ".term."bg=NONE"
                \ ." ".term."=NONE"
    execute "highlight Character"
                \ ." ".term."fg=".s:get_colorid(a:col5)
                \ ." ".term."bg=NONE"
                \ ." ".term."=NONE"
    execute "highlight Identifier"
                \ ." ".term."fg=".s:get_colorid(a:col2)
                \ ." ".term."bg=NONE"
                \ ." ".term."=NONE"
    execute "highlight Statement"
                \ ." ".term."fg=".s:get_colorid(a:col3)
                \ ." ".term."bg=NONE"
                \ ." ".term."=NONE"
    execute "highlight PreProc"
                \ ." ".term."fg=".s:get_colorid(a:col0)
                \ ." ".term."bg=NONE"
                \ ." ".term."=BOLD"
    execute "highlight Type"
                \ ." ".term."fg=".s:get_colorid(a:col4)
                \ ." ".term."bg=NONE"
                \ ." ".term."=NONE"
    execute "highlight Special"
                \ ." ".term."fg=".s:get_colorid(a:col4)
                " \ ." ".term."fg=".s:get_colorid(Special_fg)
                \ ." ".term."bg=NONE"
                \ ." ".term."=NONE"
    execute "highlight Underlined"
                \ ." ".term."fg=".s:get_colorid(a:col0)
                \ ." ".term."bg=NONE"
                \ ." ".term."=UNDERLINE"
    execute "highlight Ignore"
                \ ." ".term."fg=".Ignore_fg
                \ ." ".term."bg=NONE"
                \ ." ".term."=NONE"
    execute "highlight Error"
                \ ." ".term."fg=".Normal_fg2
                \ ." ".term."bg=".Error_bg
                \ ." ".term."=BOLD"
    execute "highlight Todo"
                \ ." ".term."fg=".s:get_colorid(a:col1)
                \ ." ".term."bg=NONE"
                \ ." ".term."=BOLD,UNDERLINE"

    " :h highlight-groups
    execute "highlight ColorColumn"
                \ ." ".term."fg=NONE"
                \ ." ".term."bg=".s:get_colorid(a:col1)
                \ ." ".term."=NONE"
    execute "highlight Conceal"
                \ ." ".term."fg=".s:get_colorid(a:col1)
                \ ." ".term."bg=NONE"
                \ ." ".term."=NONE"
    execute "highlight Cursor"
                \ ." ".term."fg=".Normal_fg
                \ ." ".term."bg=".s:get_colorid(a:group_color)
                \ ." ".term."=NONE"
    execute "highlight CursorColumn"
                \ ." ".term."fg=".Normal_fg2
                \ ." ".term."bg=".s:get_colorid(a:group_color)
                \ ." ".term."=NONE"
    " execute "highlight CursorLine"
    "             \ ." ".term."bg=".s:get_colorid(a:group_color)
    execute "highlight Directory"
                \ ." ".term."fg=".s:get_colorid(a:col4)
                \ ." ".term."bg=NONE"
                \ ." ".term."=NONE"
    execute "highlight DiffAdd"
                \ ." ".term."fg=".Normal_fg2
                \ ." ".term."bg=".DiffAdd_bg
                \ ." ".term."=NONE"
    execute "highlight DiffChange"
                \ ." ".term."fg=".Normal_fg2
                \ ." ".term."bg=".DiffChange_bg
                \ ." ".term."=NONE"
    execute "highlight DiffDelete"
                \ ." ".term."fg=".Normal_fg2
                \ ." ".term."bg=".DiffDelete_bg
                \ ." ".term."=NONE"
    execute "highlight DiffText"
                \ ." ".term."fg=".Normal_fg2
                \ ." ".term."bg=".DiffText_bg
                \ ." ".term."=NONE"
    execute "highlight EndOfBuffer"
                \ ." ".term."fg=".s:get_colorid(a:group_color)
                \ ." ".term."bg=NONE"
                \ ." ".term."=NONE"
    execute "highlight ErrorMsg"
                \ ." ".term."fg=".ErrorMsg_fg
                \ ." ".term."bg=".Normal_bg
                \ ." ".term."=NONE"
    execute "highlight VertSplit"
                \ ." ".term."fg=".s:get_colorid(a:group_color)
                \ ." ".term."bg=NONE"
                \ ." ".term."=NONE"
    execute "highlight Folded"
                \ ." ".term."fg=".Normal_fg
                \ ." ".term."bg=".s:get_colorid(a:group_color)
                \ ." ".term."=NONE"
    execute "highlight FoldColumn"
                \ ." ".term."fg=".s:get_colorid(a:col0)
                \ ." ".term."bg=".FoldColumn_bg
                \ ." ".term."=NONE"
    execute "highlight SignColumn"
                \ ." ".term."fg=".s:get_colorid(a:col1)
                \ ." ".term."bg=NONE"
                \ ." ".term."=NONE"
    execute "highlight IncSearch"
                \ ." ".term."fg=".Normal_fg2
                \ ." ".term."bg=".s:get_colorid(a:col4)
                \ ." ".term."=NONE"
    execute "highlight LineNr"
                \ ." ".term."fg=".Normal_fg
                \ ." ".term."bg=".s:get_colorid(a:group_color)
                \ ." ".term."=NONE"
    execute "highlight CursorLineNr"
                \ ." ".term."fg=".s:get_colorid(a:col2)
                \ ." ".term."bg=".s:get_colorid(a:group_color)
                \ ." ".term."=NONE"
    execute "highlight MatchParen"
                \ ." ".term."fg=".s:get_colorid(a:col2)
                \ ." ".term."bg=".s:get_colorid(a:col1)
                \ ." ".term."=NONE"
    execute "highlight ModeMsg"
                \ ." ".term."fg=".s:get_colorid(a:col0)
                \ ." ".term."bg=NONE"
                \ ." ".term."=BOLD"
    execute "highlight MoreMsg"
                \ ." ".term."fg=".s:get_colorid(a:col0)
                \ ." ".term."bg=NONE"
                \ ." ".term."=BOLD"
    execute "highlight NonText"
                \ ." ".term."fg=".s:get_colorid(a:col1)
                \ ." ".term."bg=NONE"
                \ ." ".term."=NONE"
    execute "highlight Normal"
                \ ." ".term."fg=".Normal_fg
                \ ." ".term."bg=".Normal_bg
                \ ." ".term."=NONE"
    execute "highlight Pmenu"
                \ ." ".term."fg=".s:get_colorid(a:group_color)
                \ ." ".term."bg=".Pmenu_bg
                \ ." ".term."=NONE"
    execute "highlight PmenuSel"
                \ ." ".term."fg=".Normal_fg
                \ ." ".term."bg=".s:get_colorid(a:group_color)
                \ ." ".term."=NONE"
    execute "highlight PmenuSbar"
                \ ." ".term."fg=".Normal_fg
                \ ." ".term."bg=".s:get_colorid(a:col0)
                \ ." ".term."=NONE"
    execute "highlight PmenuThumb"
                \ ." ".term."fg=".Normal_fg
                \ ." ".term."bg=".s:get_colorid(a:col2)
                \ ." ".term."=NONE"
    execute "highlight Question"
                \ ." ".term."fg=".s:get_colorid(a:col5)
                \ ." ".term."bg=NONE"
                \ ." ".term."=NONE"
    execute "highlight Search"
                \ ." ".term."fg=".Search_fg
                \ ." ".term."bg=".s:get_colorid(a:col5)
                \ ." ".term."=NONE"
    execute "highlight SpecialKey"
                \ ." ".term."fg=".s:get_colorid(a:col2)
                \ ." ".term."bg=".SpecialKey_bg
                \ ." ".term."=BOLD"
    execute "highlight SpellBad"
                \ ." ".term."fg=".Normal_fg2
                \ ." ".term."bg=".SpellBad_bg
                \ ." ".term."=NONE"
    execute "highlight SpellCap"
                \ ." ".term."fg=".Normal_fg2
                \ ." ".term."bg=".SpellCap_bg
                \ ." ".term."=NONE"
    execute "highlight SpellLocal"
                \ ." ".term."fg=".Normal_fg2
                \ ." ".term."bg=".SpellLocal_bg
                \ ." ".term."=NONE"
    execute "highlight SpellRare"
                \ ." ".term."fg=".Normal_fg2
                \ ." ".term."bg=".SpellRare_bg
                \ ." ".term."=NONE"
    execute "highlight Title"
                \ ." ".term."fg=".Normal_fg
                \ ." ".term."bg=".s:get_colorid(a:group_color)
                \ ." ".term."=BOLD"
    execute "highlight Visual"
                \ ." ".term."fg=".Normal_fg
                \ ." ".term."bg=".s:get_colorid(a:col2)
                \ ." ".term."=NONE"
    execute "highlight WarningMsg"
                \ ." ".term."fg=".WarningMsg_fg
                \ ." ".term."bg=NONE"
                \ ." ".term."=NONE"

endfunction

