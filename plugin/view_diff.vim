" view_diff.vim -- make viewing diff file easier!
" Author: Vincent Wang (linsong dot qizi at gmail dot com)
" Last Change: 
" Created:     
" Requires: 
" Version:  1.0
" Acknowledgements:
" TODO: 
"       1. add folding all diff chunks function 
"       2. add some help docs
"       3. make this script work under windows 
"       4. make it more configurable
"       

if v:version < 700
    "TODO: maybe I should make this script works under vim7.0
    echo "This script required vim7.0 or above version." 
    finish 
endif

if exists("g:load_view_diff")
    finish
endif

let g:load_view_diff = "1.0"

function! s:InitTabVariable()
    if ! exists('t:diff_buffers')
        let t:diff_buffers = {}
    endif
    if ! exists('t:cur_diff_info')
        let t:cur_diff_info = {'buf_id':-1, 'cur_pos':[]}
    endif
endfunction

function! MyPatch()
   :call system("patch -R -o " . v:fname_out . " " . v:fname_in . " < " . v:fname_diff )
endfunction

function! s:GetFlagChar(...)
    if a:0 > 1
        let index = a:1
    else
        let index = line('.')
    endif
    let flag_char = getline(index)[0]
    if flag_char != '-' && flag_char != '+'
        " use '+' as the default flag
        let flag_char = '+'
    endif
    return flag_char
endfunction

function! s:GetBaseDir()
    :call s:UpdateDiffInfoVariable()
    if t:cur_diff_info['buf_id'] != -1
        let cur_dir = fnamemodify(bufname(t:cur_diff_info['buf_id']), ':p:h')
"            call Decho("current directory is: " . cur_dir)
        return cur_dir
    else
        echo "Have you opend a diff file? "
        return ''
    endif
endfunction

function! s:AppendSlashIfNeeded(path_name)
    "remove possible blanks at the end
    let result = substitute(a:path_name, "\\s*$", "", "")
    if result !~ '/$'
        return result . '/'
    else
        return result
    endif
endfunction

function! s:GetSvnPrefixURL()
    if exists('g:vd_svn_repo_prefix') && !empty(g:vd_svn_repo_prefix)
        return s:AppendSlashIfNeeded(g:vd_svn_repo_prefix)
    else
        let svn_info_output = system("svn info")
        let lines = split(svn_info_output, '\n')
        if len(lines) <= 1
            echo "Got some error during execution of command 'svn info': "
            echo lines
            return '' 
        else
            let svn_repo_prefix_url = s:AppendSlashIfNeeded(strpart(lines[1], 5)) 
            return svn_repo_prefix_url
        endif
    endif
endfunction


function! s:GetFileInfoContainLine(flag_char, ...)
    if a:0 > 1
        let orig_index = a:1
    else
        let orig_index = line('.')
    endif
    let head_flag = a:flag_char . a:flag_char . a:flag_char

    let index = orig_index
    while index > 0
        let line_content = getline(index)
        if strpart(line_content, 0, 3) == head_flag
            let file_info = substitute(line_content, '^' . head_flag . '\s\+\(\S\+\)\s\+\(.*\)$', '\1@\2', '')
            let file_info_list = split(file_info, '@')
"            call Decho("File info list is: " . string(file_info_list))
            return file_info_list
        endif
        let index = index - 1
    endwhile
"    call Decho("Don't find any file that contains given line number #" . orig_index)
    return []
endfunction

function! s:GetLineNumInFile(flag_char, ...)
   if a:0 > 1
       let index = a:1
   else
       let index = line('.')
   endif
   let line_num = 0
   while index > 0
       let line_content = getline(index) 
       let head_char = line_content[0] 

       "if meet the chunk header, extract the start line number of the chunk
       if head_char == '@'
            return line_num - 1 + substitute(line_content, '^@@\s.*' . a:flag_char . '\(\d\+\)\(,\d\+\)\?' . '.*\s@@$', '\1', '')
       endif
       if (head_char != '+' && head_char != '-') || head_char == a:flag_char
           let line_num = line_num + 1
       endif
       let index = index -1 
   endwhile
   return line_num-1
endfunction

function! s:OpenFileInWindow(fname, init_line_index)
    exec 'lcd ' . s:GetBaseDir()
    let buf_num = bufnr(a:fname)
    if buf_num == -1 
        if exists('+shellslash')
          exec "sfind \\\\". a:fname
        else
          exec "sfind \\". a:fname
        endif
        " Do setup always, just in case.
        setlocal buftype=nofile
        setlocal bufhidden=hide
        "setlocal nobuflisted
        setlocal noswapfile
    else
        let buf_win = bufwinnr(buf_num)
        if buf_win == -1
            exec 'sbuffer ' . buf_num
        else
            exec buf_win . 'wincmd w'
        endif
    endif

    exec string(a:init_line_index)

    return bufnr('%')
endfunction

function! s:GeneratePatchAroundLine(...)
    if a:0 > 1
        let cur_line_index = a:1
    else
        let cur_line_index = line('.')
    endif

    let top_line_index = 0
    let loop_line_index = cur_line_index
    while loop_line_index > 0
        if strpart(getline(loop_line_index), 0, 3) == '---' 
            let top_line_index = loop_line_index
            break
        endif
        let loop_line_index = loop_line_index - 1
    endwhile

    let loop_line_index = cur_line_index
    let bot_line_index = line('$')
    while loop_line_index < line('$')
        if strpart(getline(loop_line_index), 0, 3) == '---'
            let bot_line_index = loop_line_index
            break
        endif
        let loop_line_index = loop_line_index + 1
    endwhile

    let tmp_patch_file = tempname()
    exec ':' . top_line_index . ',' . bot_line_index . 'w ' . tmp_patch_file
    return tmp_patch_file
endfunction

function! s:FetchFile(fname, appendix)
    " check if this is a file under subverion's control
    let rev_num = substitute(a:appendix, '(revision\s\(\d\+\))$', '\1', '')  
    if rev_num != a:appendix  
        let svn_prefix_url = s:GetSvnPrefixURL()
        if empty(svn_prefix_url) 
            return ''
        endif
        let fetched_file = '/tmp/' . split(a:fname, '/')[-1]
        let svn_cat_cmd = 'svn cat -r' . rev_num . ' ' . svn_prefix_url . a:fname . ' > ' . fetched_file
        echo svn_cat_cmd
        :call system(svn_cat_cmd)
    else
        let fetched_file = a:fname
        "TODO: check if the file exists or not and remind the user if needed
    endif
    return fetched_file
endfunction


function! s:GotoFileLineUnderCursor()
    let flag_char = s:GetFlagChar()
    let finfo = s:GetFileInfoContainLine(flag_char)
    if ! empty(finfo)
        let fname = s:FetchFile(finfo[0], finfo[1])
        let cur_line_num = s:GetLineNumInFile(flag_char)
        :call s:OpenFileInWindow(fname, cur_line_num)
    endif
endfunction

function! s:InitDiffBufDict()
    if empty(t:diff_buffers)
        let t:diff_buffers = {'1':{}, '2':{}}
        let t:diff_buffers['1'] = {'buf_id':-1, 'win_height':-1, 'win_width':-1}
        let t:diff_buffers['2'] = {'buf_id':-1, 'win_height':-1, 'win_width':-1}
    endif
endfunction

function! s:SaveOldDiffWinSetting()
    if ! empty(t:diff_buffers)
        for key in keys(t:diff_buffers)
            let buf_id = t:diff_buffers[key]['buf_id']
            if buf_id == -1 
                continue
            endif
            let t:diff_buffers[key]['win_height'] = winheight(bufwinnr(buf_id))
            let t:diff_buffers[key]['win_width'] = winwidth(bufwinnr(buf_id))
        endfor
    endif
endfunction

function! s:DeleteOldDiffBufs()
    " close all old diff buffers 
    if ! empty(t:diff_buffers)
        for key in keys(t:diff_buffers)
            let buf_id = t:diff_buffers[key]['buf_id']
            if buf_id != -1
                exec ':bdelete ' . buf_id
            endif
        endfor
    endif
endfunction

function! s:ShowBufInWin(buf_id)
    let buf_win = bufwinnr(a:buf_id)
    if buf_win == -1
        exec 'sbuffer ' . a:buf_id
    else
        exec buf_win . 'wincmd w'
    endif
endfunction

function! s:RestoreDiffBufWin()
    if ! empty(t:diff_buffers)
        for key in keys(t:diff_buffers)
            :call s:ShowBufInWin(t:diff_buffers[key].buf_id)
            if t:diff_buffers[key]['win_height'] != -1
                exec 'vertical resize ' . t:diff_buffers[key]['win_height'] 
            endif
            if t:diff_buffers[key].win_width != -1
                exec "resize " . t:diff_buffers[key]['win_width']
            endif
        endfor
    endif
endfunction

function! s:ViewDiffInVimDiffMode()
    "let flag_char = s:GetFlagChar()
    let flag_char = '+'
    let finfo = s:GetFileInfoContainLine(flag_char)
    if ! empty(finfo)
        let fname = s:FetchFile(finfo[0], finfo[1])
        let patch_file = s:GeneratePatchAroundLine()
        let cur_line_num = s:GetLineNumInFile(flag_char)

        :call s:InitDiffBufDict()
        :call s:SaveOldDiffWinSetting()
        :call s:DeleteOldDiffBufs()

        :call s:OpenFileInWindow(fname, cur_line_num)
        
        let t:diff_buffers['1']['buf_id'] = bufnr('%')
        
        let l:orig_patchexpr = &patchexpr
        set patchexpr=MyPatch() 
        silent exec ":vert diffpatch " . patch_file
        let &patchexpr = l:orig_patchexpr
        let t:diff_buffers['2']['buf_id'] = bufnr('%')
        exec 'set filetype=' . getbufvar(t:diff_buffers['1']['buf_id'], '&filetype')

        "set the focus to the last window
        :wincmd w
        
        "FIXME: restoring the height and width of the vimdiff buffers window
        "       does not work 
        ":call s:RestoreDiffBufWin()
    endif
endfunction

function! s:GetAnotherDiff(next)
    if ! empty(t:cur_diff_info['cur_pos'])
        :call setpos('.', t:cur_diff_info['cur_pos'])
    endif
    if a:next == 1
        :call search('^+++', 'w')
    else
        :call search('^+++', 'bw')
    endif
    let t:cur_diff_info['cur_pos'] = getpos('.')
    :call s:ViewDiffInVimDiffMode()
endfunction

function! s:UpdateDiffInfoVariable()
    :call s:InitTabVariable()
    if &filetype != 'diff' 
        if ! empty(t:cur_diff_info) && t:cur_diff_info['buf_id'] != -1
            :call s:ShowBufInWin(t:cur_diff_info['buf_id'])
        else
            return 
        endif
    else
        let t:cur_diff_info['buf_id'] = bufnr('%')
    endif
endfunction

function! s:FunctionWrapper(func_ref, ...)
    :call s:UpdateDiffInfoVariable()
    exec "call " . a:func_ref . '(' . join(a:000, ',') . ')'
endfunction

function! s:FoldDiffFile(line_num)
    return getline(a:line_num) =~ '^\(+\([^+]\|$\)\|-\([^-]\|$\)\|@\|\s\)'
endfunction

function! s:SetSvnPrefixURL(prefix_URL)
    let g:vd_svn_repo_prefix = a:prefix_URL
endfunction

function! s:ShowInfo()
    echo "===========Information of view_diff ==============="
    echo "svn repository prefix URL: " . s:GetSvnPrefixURL()
    echo "svn current working directory: " . s:GetBaseDir() 
endfunction

map <leader>df :call <SID>FunctionWrapper('s:GotoFileLineUnderCursor')<CR>
map <leader>dv :call <SID>FunctionWrapper('s:ViewDiffInVimDiffMode')<CR>
map <leader>dn :call <SID>FunctionWrapper('s:GetAnotherDiff', 1)<CR>
map <leader>dp :call <SID>FunctionWrapper('s:GetAnotherDiff', 0)<CR>
map <leader>dz :if &ft=='diff' \| :set foldmethod=expr \| :set foldexpr=<SID>FoldDiffFile(v:lnum) \| :endif<CR>

command! -range -complete=file -nargs=1 VDSetSvnPrefixURL :call <SID>SetSvnPrefixURL(<q-args>)
command! -range -nargs=0 VDShowInfo :call <SID>ShowInfo()
