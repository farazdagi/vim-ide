" Maintainer: Vic Farazdagi

set background=dark

hi clear
if exists("syntax_on")
  syntax reset
endif

let colors_name = "hedgehog"

" Tabs/ViewPorts
hi TabLineSel guibg=#252525 guifg=#C8C77E gui=none
hi TabLine guibg=#444444 guifg=#868686 gui=none
hi TabLineFill guibg=#444444 guifg=#868686 gui=bold

" Status Line


hi CursorLine guibg=#2d2d2d
hi CursorColumn guibg=#2d2d2d
hi MatchParen guifg=#f6f3e8 guibg=#857b6f gui=bold
hi Pmenu 		guifg=#f6f3e8 guibg=#444444
hi PmenuSel 	guifg=#000000 guibg=#cae682
hi ColorColumn guibg=#2d2d2d
  
" General colors
hi Cursor 		guifg=NONE    guibg=#656565 gui=none
hi Normal 		guifg=#f6f3e8 guibg=#242424 gui=none
hi NonText 		guifg=#808080 guibg=#303030 gui=none
hi LineNr 		guifg=#857b6f guibg=#000000 gui=none
hi StatusLine 	guifg=#f6f3e8 guibg=#444444 gui=italic
hi StatusLineNC guifg=#857b6f guibg=#444444 gui=none
hi VertSplit 	guifg=#444444 guibg=#444444 gui=none
hi Folded 		guifg=#99968b guibg=#242424 gui=italic gui=none
hi Title		guifg=#f6f3e8 guibg=NONE	gui=bold
hi Visual		guifg=#f6f3e8 guibg=#444444 gui=none
hi SpecialKey	guifg=#808080 guibg=#343434 gui=none
hi Search	    guifg=#8ac6f2 guibg=#444444
hi IncSearch       guibg=#444444      guifg=#8ac6f2

" Syntax highlighting
hi Comment 		guifg=#99968b gui=italic
hi Todo 		guifg=#8f8f8f gui=italic
hi Constant 	guifg=#e5786d gui=none
hi String 		guifg=#95e454 gui=italic
hi Identifier 	guifg=#cae682 gui=none
hi Function 	guifg=#cae682 gui=none
hi Type 		guifg=#cae682 gui=none
hi Statement 	guifg=#8ac6f2 gui=none
hi Keyword		guifg=#8ac6f2 gui=none
hi PreProc 		guifg=#e5786d gui=none
hi Number		guifg=#e5786d gui=none
hi Special		guifg=#e7f6da gui=none

" Diff highlighting
hi DiffAdd      ctermfg=0 ctermbg=2 guibg='#95e454' guifg='#343434'
hi DiffDelete   ctermfg=0 ctermbg=1 guibg='#e5786d' guifg='#343434'
hi DiffChange   ctermfg=0 ctermbg=3 guibg='#8ac6f2' guifg='#343434' 
