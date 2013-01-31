set background=dark "or light
highlight clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name = "vivify"
set t_Co=256

highlight Boolean             guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight CTagsClass          guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight CTagsGlobalConstant guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight CTagsGlobalVariable guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight CTagsImport         guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight CTagsMember         guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Character           guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Comment             guifg=#ff5050 ctermfg=203                           gui=none cterm=none
highlight Conditional         guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Constant            guifg=#00884c ctermfg=35                            gui=none cterm=none
highlight Cursor              guifg=#ffffff ctermfg=15  guibg=#0080f0 ctermbg=33  gui=none cterm=none
highlight CursorColumn        guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight CursorLine          guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Debug               guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Define              guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight DefinedName         guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Delimiter           guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight DiffAdd             guifg=#ff2020 ctermfg=196 guibg=#eaf2b0 ctermbg=229 gui=none cterm=none
highlight DiffChange          guifg=#208040 ctermfg=78  guibg=#c0f0d0 ctermbg=121 gui=none cterm=none
highlight DiffDelete          guifg=#ff2020 ctermfg=196 guibg=#eaf2b0 ctermbg=229 gui=none cterm=none
highlight DiffText            guifg=#2850a0 ctermfg=68  guibg=#c0d0f0 ctermbg=111 gui=none cterm=none
highlight Directory           guifg=#7050ff ctermfg=99                            gui=none cterm=none
highlight EnumerationName     guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight EnumerationValue    guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Error               guifg=#f8f8f8 ctermfg=15  guibg=#4040ff ctermbg=63  gui=none cterm=none
highlight ErrorMsg            guifg=#f8f8f8 ctermfg=15  guibg=#4040ff ctermbg=63  gui=none cterm=none
highlight Exception           guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Float               guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight FoldColumn          guifg=#a05040 ctermfg=209 guibg=#f8d8c4 ctermbg=223 gui=none cterm=none
highlight Folded              guifg=#804030 ctermfg=209 guibg=#ffc0a0 ctermbg=216 gui=none cterm=none
highlight Function            guifg=#404040 ctermfg=238                           gui=none cterm=none
highlight Identifier          guifg=#b07800 ctermfg=94                            gui=none cterm=none
highlight Ignore              guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight IncSearch           guifg=#404040 ctermfg=238 guibg=#e0e040 ctermbg=185 gui=none cterm=none
highlight Include             guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Keyword             guifg=#404040 ctermfg=238                           gui=none cterm=none
highlight Label               guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight LineNr              guifg=#e0b090 ctermfg=180                           gui=none cterm=none
highlight LocalVariable       guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Macro               guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight MatchParen          guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight ModeMsg             guifg=#d06000 ctermfg=166                           gui=none cterm=none
highlight MoreMsg             guifg=#0090a0 ctermfg=37                            gui=none cterm=none
highlight NonText             guifg=#a05040 ctermfg=209 guibg=#ffe4d4 ctermbg=216 gui=none cterm=none
highlight Normal              guifg=#404040 ctermfg=238 guibg=#fff4e8 ctermbg=223 gui=none cterm=none
highlight Number              guifg=#404040 ctermfg=238                           gui=none cterm=none
highlight Operator            guifg=#404040 ctermfg=238                           gui=none cterm=none
highlight PMenu               guifg=#c0b0a0 ctermfg=180 guibg=#904838 ctermbg=209 gui=none cterm=none
highlight PMenuSbar           guifg=#c0b0a0 ctermfg=180 guibg=#949698 ctermbg=67  gui=none cterm=none
highlight PMenuSel            guifg=#f8f8f8 ctermfg=15  guibg=#904838 ctermbg=209 gui=none cterm=none
highlight PMenuThumb          guifg=#c0b0a0 ctermfg=180 guibg=#e0b090 ctermbg=180 gui=none cterm=none
highlight PreCondit           guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight PreProc             guifg=#0090a0 ctermfg=37                            gui=none cterm=none
highlight Question            guifg=#8000ff ctermfg=93                            gui=none cterm=none
highlight Repeat              guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Search              guifg=#544060 ctermfg=97  guibg=#f0c0ff ctermbg=171 gui=none cterm=none
highlight SignColumn          guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Special             guifg=#8040f0 ctermfg=98                            gui=none cterm=none
highlight SpecialChar         guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight SpecialComment      guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight SpecialKey          guifg=#0080ff ctermfg=33                            gui=none cterm=none
highlight SpellBad            guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight SpellCap            guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight SpellLocal          guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight SpellRare           guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Statement           guifg=#80a030 ctermfg=64                            gui=none cterm=none
highlight StatusLine          guifg=#f8f8f8 ctermfg=15  guibg=#904838 ctermbg=209 gui=none cterm=none
highlight StatusLineNC        guifg=#c0b0a0 ctermfg=180 guibg=#904838 ctermbg=209 gui=none cterm=none
highlight StorageClass        guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight String              guifg=#404040 ctermfg=238                           gui=none cterm=none
highlight Structure           guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight TabLine             guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight TabLineFill         guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight TabLineSel          guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Tag                 guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Title               guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Todo                guifg=#0080f0 ctermfg=33                            gui=none cterm=none
highlight Type                guifg=#b06c58 ctermfg=173                           gui=none cterm=none
highlight Typedef             guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Underlined          guifg=#0000ff ctermfg=21                            gui=none cterm=none
highlight Union               guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight VertSplit           guifg=#f8f8f8 ctermfg=15  guibg=#904838 ctermbg=209 gui=none cterm=none
highlight Visual              guifg=#804020 ctermfg=173 guibg=#ffc0a0 ctermbg=216 gui=none cterm=none
highlight VisualNOS           guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight WarningMsg          guifg=#f8f8f8 ctermfg=15  guibg=#4040ff ctermbg=63  gui=none cterm=none
highlight WildMenu            guifg=#f8f8f8 ctermfg=15  guibg=#ff3030 ctermbg=203 gui=none cterm=none
highlight pythonBuiltin       guifg=#404040 ctermfg=238                           gui=none cterm=none
