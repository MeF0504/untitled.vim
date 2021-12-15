" Name:         Untitled.vim
" Description:  Project-sekai inspired vim plugin
" Author:       MeF

function! s:get_colorid(col, gui)
    let r = a:col[0]
    let g = a:col[1]
    let b = a:col[2]
    " r, g, b: 0 ~ 255
    if a:gui
        return printf('#%02x%02x%02x', r, g, b)
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

        return (36*r)+(6*g)+b+16
    endif
endfunction

function! untitled#set_color#set_color(group_color, col0, col1, col2, col3, col4, col5, Normal_bg)
    let [Normal_cbg, Normal_gbg] = a:Normal_bg
    if &background == 'dark'
        let Normal_cfg     = '254'
        let Normal_gfg     = '#e4e4e4'
        let Normal_cfg2    = '254'
        let Normal_gfg2    = '#e4e4e4'
        " let Normal_cbg     = '235'
        " let Normal_gbg     = '#262626'
        let Error_cbg      = '160'
        let Error_gbg      = '#d70000'
        let Special_cfg    = '141'
        let Special_gfg    = '#af87ff'
        let Ignore_cfg     = '247'
        let Ignore_gfg     = '#9e9e9e'
        let ErrorMsg_cfg   = '160'
        let ErrorMsg_gfg   = '#d70000'
        let WarningMsg_cfg = '185'
        let WarningMsg_gfg = '#d7d75f'
        let DiffAdd_cbg    = '99'
        let DiffAdd_gbg    = '#875fff'
        let DiffChange_cbg = '142'
        let DiffChange_gbg = '#afaf00'
        let DiffDelete_cbg = '124'
        let DiffDelete_gbg = '#af0000'
        let DiffText_cbg   = '29'
        let DiffText_gbg   = '#00875f'
        let Pmenu_cbg      = '254'
        let Pmenu_gbg      = '#e4e4e4'
        let SpecialKey_cbg = '246'
        let SpecialKey_gbg = '#949494'
        let SpellBad_cbg   = '124'
        let SpellBad_gbg   = '#af0000'
        let SpellCap_cbg   = '136'
        let SpellCap_gbg   = '#af8700'
        let SpellLocal_cbg = '34'
        let SpellLocal_gbg = '#00af00'
        let SpellRare_cbg  = '91'
        let SpellRare_gbg  = '#8700af'
        let FoldColumn_cbg = '16'
        let FoldColumn_gbg = '#000000'
        let Search_cfg     = '235'
        let Search_gfg     = '#262626'
    else
        let Normal_cfg     = '241'
        let Normal_gfg     = '#626262'
        let Normal_cfg2    = '234'
        let Normal_gfg2    = '#1c1c1c'
        " let Normal_cbg     = '255'
        " let Normal_gbg     = '#eeeeee'
        let Error_cbg      = '196'
        let Error_gbg      = '#ff0000'
        let Special_cfg    = '141'
        let Special_gfg    = '#af87ff'
        let Ignore_cfg     = '247'
        let Ignore_gfg     = '#9e9e9e'
        let ErrorMsg_cfg   = '160'
        let ErrorMsg_gfg   = '#d70000'
        let WarningMsg_cfg = '136'
        let WarningMsg_gfg = '#af8700'
        let DiffAdd_cbg    = '183'
        let DiffAdd_gbg    = '#d7afff'
        let DiffChange_cbg = '191'
        let DiffChange_gbg = '#d7ff5f'
        let DiffDelete_cbg = '161'
        let DiffDelete_gbg = '#d7005f'
        let DiffText_cbg   = '156'
        let DiffText_gbg   = '#afff87'
        let Pmenu_cbg      = '244'
        let Pmenu_gbg      = '#808080'
        let SpecialKey_cbg = '246'
        let SpecialKey_gbg = '#949494'
        let SpellBad_cbg   = '124'
        let SpellBad_gbg   = '#af0000'
        let SpellCap_cbg   = '185'
        let SpellCap_gbg   = '#d7d75f'
        let SpellLocal_cbg = '149'
        let SpellLocal_gbg = '#afd75f'
        let SpellRare_cbg  = '171'
        let SpellRare_gbg  = '#d75fff'
        let FoldColumn_cbg = '16'
        let FoldColumn_gbg = '#000000'
        let Search_cfg     = '255'
        let Search_gfg     = '#eeeeee'
    endif

    " :h group-name
    execute printf("highlight Comment ctermfg=%s ctermbg=%s cterm=%s guifg=%s guibg=%s gui=%s",
                \ s:get_colorid(a:col1, 0), 'NONE', 'NONE',
                \ s:get_colorid(a:col1, 1), 'NONE', 'NONE',
                \)
    execute printf("highlight Constant ctermfg=%s ctermbg=%s cterm=%s guifg=%s guibg=%s gui=%s",
                \ s:get_colorid(a:col3, 0), 'NONE', 'NONE',
                \ s:get_colorid(a:col3, 1), 'NONE', 'NONE',
                \ )
    execute printf("highlight String ctermfg=%s ctermbg=%s cterm=%s guifg=%s guibg=%s gui=%s",
                \ s:get_colorid(a:col5, 0), 'NONE', 'NONE',
                \ s:get_colorid(a:col5, 1), 'NONE', 'NONE',
                \ )
    execute printf("highlight Character ctermfg=%s ctermbg=%s cterm=%s guifg=%s guibg=%s gui=%s",
                \ s:get_colorid(a:col5, 0), 'NONE', 'NONE',
                \ s:get_colorid(a:col5, 1), 'NONE', 'NONE',
                \ )
    execute printf("highlight Identifier ctermfg=%s ctermbg=%s cterm=%s guifg=%s guibg=%s gui=%s",
                \ s:get_colorid(a:col2, 0), 'NONE', 'NONE',
                \ s:get_colorid(a:col2, 1), 'NONE', 'NONE',
                \ )
    execute printf("highlight Statement ctermfg=%s ctermbg=%s cterm=%s guifg=%s guibg=%s gui=%s",
                \ s:get_colorid(a:col3, 0), 'NONE', 'NONE',
                \ s:get_colorid(a:col3, 1), 'NONE', 'NONE',
                \ )
    execute printf("highlight PreProc ctermfg=%s ctermbg=%s cterm=%s guifg=%s guibg=%s gui=%s",
                \ s:get_colorid(a:col0, 0), 'NONE', 'BOLD',
                \ s:get_colorid(a:col0, 1), 'NONE', 'BOLD',
                \ )
    execute printf("highlight Type ctermfg=%s ctermbg=%s cterm=%s guifg=%s guibg=%s gui=%s",
                \ s:get_colorid(a:col4, 0), 'NONE', 'NONE',
                \ s:get_colorid(a:col4, 1), 'NONE', 'NONE',
                \ )
    execute printf("highlight Special ctermfg=%s ctermbg=%s cterm=%s guifg=%s guibg=%s gui=%s",
                \ s:get_colorid(a:col4, 0), 'NONE', 'NONE',
                \ s:get_colorid(a:col4, 1), 'NONE', 'NONE',
                \ )
    execute printf("highlight Underlined ctermfg=%s ctermbg=%s cterm=%s guifg=%s guibg=%s gui=%s",
                \ s:get_colorid(a:col0, 0), 'NONE', 'UNDERLINE',
                \ s:get_colorid(a:col0, 1), 'NONE', 'UNDERLINE',
                \ )
    execute printf("highlight Ignore ctermfg=%s ctermbg=%s cterm=%s guifg=%s guibg=%s gui=%s",
                \ Ignore_cfg, 'NONE', 'NONE',
                \ Ignore_gfg, 'NONE', 'NONE',
                \ )
    execute printf("highlight Error ctermfg=%s ctermbg=%s cterm=%s guifg=%s guibg=%s gui=%s",
                \ Normal_cfg2, Error_cbg, 'BOLD',
                \ Normal_gfg2, Error_gbg, 'BOLD',
                \ )
    execute printf("highlight Todo ctermfg=%s ctermbg=%s cterm=%s guifg=%s guibg=%s gui=%s",
                \ s:get_colorid(a:col1, 0), 'NONE', 'BOLD,UNDERLINE',
                \ s:get_colorid(a:col1, 1), 'NONE', 'BOLD,UNDERLINE',
                \ )

    " :h highlight-groups
    execute printf("highlight ColorColumn ctermfg=%s ctermbg=%s cterm=%s guifg=%s guibg=%s gui=%s",
                \ 'NONE', s:get_colorid(a:col1, 0), 'NONE',
                \ 'NONE', s:get_colorid(a:col1, 1), 'NONE',
                \ )
    execute printf("highlight Conceal ctermfg=%s ctermbg=%s cterm=%s guifg=%s guibg=%s gui=%s",
                \ s:get_colorid(a:col1, 0), 'NONE', 'NONE',
                \ s:get_colorid(a:col1, 1), 'NONE', 'NONE',
                \ )
    execute printf("highlight Cursor ctermfg=%s ctermbg=%s cterm=%s guifg=%s guibg=%s gui=%s",
                \ Normal_cfg, s:get_colorid(a:group_color, 0), 'NONE',
                \ Normal_gfg, s:get_colorid(a:group_color, 1), 'NONE',
                \ )
    execute printf("highlight CursorColumn ctermfg=%s ctermbg=%s cterm=%s guifg=%s guibg=%s gui=%s",
                \ Normal_cfg2, s:get_colorid(a:group_color, 0), 'NONE',
                \ Normal_gfg2, s:get_colorid(a:group_color, 1), 'NONE',
                \ )
    execute printf("highlight Directory ctermfg=%s ctermbg=%s cterm=%s guifg=%s guibg=%s gui=%s",
                \ s:get_colorid(a:col4, 0), 'NONE', 'NONE',
                \ s:get_colorid(a:col4, 1), 'NONE', 'NONE',
                \ )
    execute printf("highlight DiffAdd ctermfg=%s ctermbg=%s cterm=%s guifg=%s guibg=%s gui=%s",
                \ Normal_cfg2, DiffAdd_cbg, 'NONE',
                \ Normal_gfg2, DiffAdd_gbg, 'NONE',
                \ )
    execute printf("highlight DiffChange ctermfg=%s ctermbg=%s cterm=%s guifg=%s guibg=%s gui=%s",
                \ Normal_cfg2, DiffChange_cbg, 'NONE',
                \ Normal_gfg2, DiffChange_gbg, 'NONE',
                \ )
    execute printf("highlight DiffDelete ctermfg=%s ctermbg=%s cterm=%s guifg=%s guibg=%s gui=%s",
                \ Normal_cfg2, DiffDelete_cbg, 'NONE',
                \ Normal_gfg2, DiffDelete_gbg, 'NONE',
                \ )
    execute printf("highlight DiffText ctermfg=%s ctermbg=%s cterm=%s guifg=%s guibg=%s gui=%s",
                \ Normal_cfg2, DiffText_cbg, 'NONE',
                \ Normal_gfg2, DiffText_gbg, 'NONE',
                \ )
    execute printf("highlight EndOfBuffer ctermfg=%s ctermbg=%s cterm=%s guifg=%s guibg=%s gui=%s",
                \ s:get_colorid(a:group_color, 0), 'NONE', 'NONE',
                \ s:get_colorid(a:group_color, 1), 'NONE', 'NONE',
                \ )
    execute printf("highlight ErrorMsg ctermfg=%s ctermbg=%s cterm=%s guifg=%s guibg=%s gui=%s",
                \ ErrorMsg_cfg, Normal_cbg, 'NONE',
                \ ErrorMsg_gfg, Normal_gbg, 'NONE',
                \ )
    execute printf("highlight VertSplit ctermfg=%s ctermbg=%s cterm=%s guifg=%s guibg=%s gui=%s",
                \ s:get_colorid(a:group_color, 0), 'NONE', 'NONE',
                \ s:get_colorid(a:group_color, 1), 'NONE', 'NONE',
                \ )
    execute printf("highlight Folded ctermfg=%s ctermbg=%s cterm=%s guifg=%s guibg=%s gui=%s",
                \ Normal_cfg, s:get_colorid(a:group_color, 0), 'NONE',
                \ Normal_gfg, s:get_colorid(a:group_color, 1), 'NONE',
                \ )
    execute printf("highlight FoldColumn ctermfg=%s ctermbg=%s cterm=%s guifg=%s guibg=%s gui=%s",
                \ s:get_colorid(a:col0, 0), FoldColumn_cbg, 'NONE',
                \ s:get_colorid(a:col0, 1), FoldColumn_gbg, 'NONE',
                \ )
    execute printf("highlight SignColumn ctermfg=%s ctermbg=%s cterm=%s guifg=%s guibg=%s gui=%s",
                \ s:get_colorid(a:col1, 0), 'NONE', 'NONE',
                \ s:get_colorid(a:col1, 1), 'NONE', 'NONE',
                \ )
    execute printf("highlight IncSearch ctermfg=%s ctermbg=%s cterm=%s guifg=%s guibg=%s gui=%s",
                \ Search_cfg, s:get_colorid(a:col5, 0), 'NONE',
                \ Search_gfg, s:get_colorid(a:col5, 1), 'NONE',
                \ )
    execute printf("highlight LineNr ctermfg=%s ctermbg=%s cterm=%s guifg=%s guibg=%s gui=%s",
                \ Normal_cfg, s:get_colorid(a:group_color, 0), 'NONE',
                \ Normal_gfg, s:get_colorid(a:group_color, 1), 'NONE',
                \ )
    execute printf("highlight CursorLineNr ctermfg=%s ctermbg=%s cterm=%s guifg=%s guibg=%s gui=%s",
                \ s:get_colorid(a:col2, 0), s:get_colorid(a:group_color, 0), 'NONE',
                \ s:get_colorid(a:col2, 1), s:get_colorid(a:group_color, 1), 'NONE',
                \ )
    execute printf("highlight MatchParen ctermfg=%s ctermbg=%s cterm=%s guifg=%s guibg=%s gui=%s",
                \ s:get_colorid(a:col2, 0), s:get_colorid(a:col1, 0), 'NONE',
                \ s:get_colorid(a:col2, 1), s:get_colorid(a:col1, 1), 'NONE',
                \ )
    execute printf("highlight ModeMsg ctermfg=%s ctermbg=%s cterm=%s guifg=%s guibg=%s gui=%s",
                \ s:get_colorid(a:col0, 0), 'NONE', 'BOLD',
                \ s:get_colorid(a:col0, 1), 'NONE', 'BOLD',
                \ )
    execute printf("highlight MoreMsg ctermfg=%s ctermbg=%s cterm=%s guifg=%s guibg=%s gui=%s",
                \ s:get_colorid(a:col0, 0), 'NONE', 'BOLD',
                \ s:get_colorid(a:col0, 1), 'NONE', 'BOLD',
                \ )
    execute printf("highlight NonText ctermfg=%s ctermbg=%s cterm=%s guifg=%s guibg=%s gui=%s",
                \ s:get_colorid(a:col1, 0), 'NONE', 'NONE',
                \ s:get_colorid(a:col1, 1), 'NONE', 'NONE',
                \ )
    execute printf("highlight Normal ctermfg=%s ctermbg=%s cterm=%s guifg=%s guibg=%s gui=%s",
                \ Normal_cfg, Normal_cbg, 'NONE',
                \ Normal_gfg, Normal_gbg, 'NONE',
                \ )
    execute printf("highlight Pmenu ctermfg=%s ctermbg=%s cterm=%s guifg=%s guibg=%s gui=%s",
                \ s:get_colorid(a:group_color, 0), Pmenu_cbg, 'NONE',
                \ s:get_colorid(a:group_color, 1), Pmenu_gbg, 'NONE',
                \ )
    execute printf("highlight PmenuSel ctermfg=%s ctermbg=%s cterm=%s guifg=%s guibg=%s gui=%s",
                \ Normal_cfg, s:get_colorid(a:group_color, 0), 'NONE',
                \ Normal_gfg, s:get_colorid(a:group_color, 1), 'NONE',
                \ )
    execute printf("highlight PmenuSbar ctermfg=%s ctermbg=%s cterm=%s guifg=%s guibg=%s gui=%s",
                \ Normal_cfg, s:get_colorid(a:col0, 0), 'NONE',
                \ Normal_gfg, s:get_colorid(a:col0, 1), 'NONE',
                \ )
    execute printf("highlight PmenuThumb ctermfg=%s ctermbg=%s cterm=%s guifg=%s guibg=%s gui=%s",
                \ Normal_cfg, s:get_colorid(a:col2, 0), 'NONE',
                \ Normal_gfg, s:get_colorid(a:col2, 1), 'NONE',
                \ )
    execute printf("highlight Question ctermfg=%s ctermbg=%s cterm=%s guifg=%s guibg=%s gui=%s",
                \ s:get_colorid(a:col5, 0), 'NONE', 'NONE',
                \ s:get_colorid(a:col5, 1), 'NONE', 'NONE',
                \ )
    execute printf("highlight Search ctermfg=%s ctermbg=%s cterm=%s guifg=%s guibg=%s gui=%s",
                \ Search_cfg, s:get_colorid(a:col4, 0), 'NONE',
                \ Search_gfg, s:get_colorid(a:col4, 1), 'NONE',
                \ )
    execute printf("highlight SpecialKey ctermfg=%s ctermbg=%s cterm=%s guifg=%s guibg=%s gui=%s",
                \ s:get_colorid(a:col2, 0), SpecialKey_cbg, 'BOLD',
                \ s:get_colorid(a:col2, 1), SpecialKey_gbg, 'BOLD',
                \ )
    execute printf("highlight SpellBad ctermfg=%s ctermbg=%s cterm=%s guifg=%s guibg=%s gui=%s",
                \ Normal_cfg2, SpellBad_cbg, 'NONE',
                \ Normal_gfg2, SpellBad_gbg, 'NONE',
                \ )
    execute printf("highlight SpellCap ctermfg=%s ctermbg=%s cterm=%s guifg=%s guibg=%s gui=%s",
                \ Normal_cfg2, SpellCap_cbg, 'NONE',
                \ Normal_gfg2, SpellCap_gbg, 'NONE',
                \ )
    execute printf("highlight SpellLocal ctermfg=%s ctermbg=%s cterm=%s guifg=%s guibg=%s gui=%s",
                \ Normal_cfg2, SpellLocal_cbg, 'NONE',
                \ Normal_gfg2, SpellLocal_gbg, 'NONE',
                \ )
    execute printf("highlight SpellRare ctermfg=%s ctermbg=%s cterm=%s guifg=%s guibg=%s gui=%s",
                \ Normal_cfg2, SpellRare_cbg, 'NONE',
                \ Normal_gfg2, SpellRare_gbg, 'NONE',
                \ )
    execute printf("highlight Title ctermfg=%s ctermbg=%s cterm=%s guifg=%s guibg=%s gui=%s",
                \ Normal_cfg, s:get_colorid(a:group_color, 0), 'BOLD',
                \ Normal_gfg, s:get_colorid(a:group_color, 1), 'BOLD',
                \ )
    execute printf("highlight Visual ctermfg=%s ctermbg=%s cterm=%s guifg=%s guibg=%s gui=%s",
                \ Normal_cfg, s:get_colorid(a:col2, 0), 'NONE',
                \ Normal_gfg, s:get_colorid(a:col2, 1), 'NONE',
                \ )
    execute printf("highlight WarningMsg ctermfg=%s ctermbg=%s cterm=%s guifg=%s guibg=%s gui=%s",
                \ WarningMsg_cfg, 'NONE', 'NONE',
                \ WarningMsg_gfg, 'NONE', 'NONE',
                \ )

endfunction

