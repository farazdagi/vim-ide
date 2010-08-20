" viewports.vim : Tabs manipulation script targeted for CLI versions of Vim
" Version: 0.9
" Maintainer: Victor Farazdagi <victor@4cinc.com>
" Last Modified: Aug 19, 2010
" License: Vim License
"

" SECTION: Init Stuff {{{1
" ------------------------------------------------------------------------------
let s:appVersion = '0.9'
let s:appTitle = "ViewPorts"

let s:tabs = {}

" Check Prerequisites {{{2
if exists("loaded_viewports")
    finish
endif

if v:version < 702
    echoerr s:appTitle . " requires Vim >= 7.2"
    finish
endif

let g:loaded_viewports = 1

" SECTION: Key Mappings {{{1
if !hasmapto('<Plug>ViewPortSetTabTitle')
    map <silent> <Leader>i <Plug>ViewPortTabSet
    noremap <script> <Plug>ViewPortTabSet <SID>setTabTitle
    noremap <SID>setTabTitle :call <SID>setTabTitle()<CR>
endif

" SECTION: Functions {{{1


" FUNCTION: s:setTabTitle {{{2
" Updates the title of current tab, other tabs are re-drawn
fu! s:setTabTitle()
    let tab = tabpagenr()
    let newTabTitle = input(s:appTitle . ": Set Tab Title\n" .
                        \ "========================================\n" .
                        \ "Title: ", "")

    if newTabTitle ==# ''
        call s:echo("No tab name provided. Operation aborted.")
    else
        let s:tabs[tab] = newTabTitle
    endif
endfu

" FUNCTION: s:getTabLine {{{2
" Generates tabline argument
fu! s:getTabLine()
    let tabLine = ''

    for i in range(tabpagenr('$'))
        " currently selected tab should use hl-TabLineSel
        if i + 1 == tabpagenr()
            let tabLine .= '%#TabLineSel#'
        else
            let tabLine .= '%#TabLine#'
        endif

        " add tab number to tab title automatically
        let tabLine .= '%' . (i + 1) . 'T'

        " generate titles
        let tabLine .= '% ' . s:getTabTitle(i + 1) . ' |'
    endfor

    let tabLine .= '%#TabLineFill#%T'

    return tabLine
endfu

" FUNCTION: s:getTabTitle
" Returns either generated or previously set tab title
"
" @param int tab Tab number for which title is expected
fu! s:getTabTitle(tab)
    let bufList = tabpagebuflist(a:tab)
    let winnr = tabpagewinnr(a:tab)

    if has_key(s:tabs, a:tab) " generate the label
        let label = s:tabs[a:tab]
    else
        let label = bufname(bufList[winnr - 1])
        " strip directory info
        let label = substitute(label, '.*/', '', '')
    endif

    if label == ''
        let label = '[Empty]'
    endif
    
    let label = ' ' . a:tab . ' ' . label

    " make sure that if tab has modified buffers, it is marked with "+"
    for i in range(len(bufList))
        if getbufvar(bufList[i], "&modified")
            let label = '*' . label
            break
        endif
    endfor



    return label
endfu

" SECTION: Public methods {{{1
fu! ViewPortsTabLine()
    let tabLine = s:getTabLine()
    return tabLine
endfunc
fu! ViewPortsGuiTabLabel()
    return '%' . s:getTabTitle(tabpagenr()) . ''
endfu

fu! Main()
endfu

" SECTION: Auxilary Functions {{{1
" FUNCTION: s:echo  {{{2
" A wrapper for :echo. Prefixes message with s:script_title 
"
" @param string msg Message to voice
function! s:echo(msg)
    redraw
    echomsg s:appTitle . ": " . a:msg
endfunction

" FUNCTION: s:echoWarning {{{2
" Sets the message type to warningmsg, message type is restored 
" once function exits
"
" @param string msg Message to voice
function! s:echoWarning(msg)
    echohl warningmsg
    call s:echo(a:msg)
    echohl normal
endfunction

" FUNCTION: s:echoError {{{2
" Sets the message type to errormsg, message type is restored
" once function exits
"
" @param string msg Message to voice
function! s:echoError(msg)
    echohl errormsg
    call s:echo(a:msg)
    echohl normal
endfunction

" SECTION: hooking the plugin into Vim loop {{{1
set tabline=%!ViewPortsTabLine()
set guitablabel=%!ViewPortsGuiTabLabel()
