" Vimball Archiver by Charles E. Campbell, Jr., Ph.D.
UseVimball
finish
ftplugin/html/htmlspecialchars.vim	[[[1
91
"   Copyright (c) 2008  Taku Amano  <taku@bakersterrace.net>
" 
"   Redistribution and use in source and binary forms, with or without
"   modification, are permitted provided that the following conditions
"   are met:
" 
"   1. Redistributions of source code must retain the above copyright
"      notice, this list of conditions and the following disclaimer.
"
"   2. Redistributions in binary form must reproduce the above copyright
"      notice, this list of conditions and the following disclaimer in the
"      documentation and/or other materials provided with the distribution.
"
"   3. Neither the name of the authors nor the names of its contributors
"      may be used to endorse or promote products derived from this
"      software without specific prior written permission.
"
"   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
"   "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
"   LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
"   A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
"   OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
"   SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
"   TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
"   PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
"   LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
"   NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
"   SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
"
"  $Id: htmlspecialchars.vim 56 2008-09-10 00:57:27Z taku $

" Only do this when not done yet for this buffer
if exists("b:htmlspecialchars_ftplugin")
  finish
endif
let b:htmlspecialchars_ftplugin = 1

:let s:save_cpo = &cpo
:set cpo&vim

" initializing conversion table.
:let s:encode_map = { '<': 'lt', '>': 'gt', '&': 'amp', }
if ! exists('g:htmlspecialchars_ent_noquotes') || ! g:htmlspecialchars_ent_noquotes
	:let s:encode_map['"'] = 'quot'
endif
if exists('g:htmlspecialchars_ent_quotes') && g:htmlspecialchars_ent_quotes
	:let s:encode_map["'"] = '#039'
endif


" Encode
:function! HTMLSpecialCharsInner(char)
	if has_key(s:encode_map, a:char)
		:return '&' . s:encode_map[a:char] . ';'
	else
		:return a:char
	end
:endfunction
:function! HTMLSpecialChars() range
	:let l:lines = getline(a:firstline, a:lastline)
	:let l:lines_to = map(l:lines, 'substitute(v:val, ".", "\\=HTMLSpecialCharsInner(submatch(0))", "g")')
	:call setline(a:firstline, l:lines_to)
:endfunction
:command! -range HTMLSpecialChars :<line1>,<line2>call HTMLSpecialChars()


" Decode
:let s:decode_map = {}
:function! HTMLSpecialCharsDecodeInner(all, part)
	if empty(s:decode_map)
		for [key, value] in items(s:encode_map)
			:let s:decode_map[value] = key
		endfor
	endif

	if has_key(s:decode_map, a:part)
		:return s:decode_map[a:part]
	else
		:return a:all
	endif
:endfunction

:function! HTMLSpecialCharsDecode() range
	:let l:lines = getline(a:firstline, a:lastline)
	:let l:lines_to = map(l:lines, 'substitute(v:val, "&\\([a-zA-Z]*\\|#[0-9]*\\);", "\\=HTMLSpecialCharsDecodeInner(submatch(0), submatch(1))", "g")')
	:call setline(a:firstline, l:lines_to)
:endfunction
:command! -range HTMLSpecialCharsDecode :<line1>,<line2>call HTMLSpecialCharsDecode()


:let &cpo = s:save_cpo
doc/htmlspecialchars.txt	[[[1
81
*htmlspecialchars.txt*  Convert special characters to HTML entities.
$Id: htmlspecialchars.txt 56 2008-09-10 00:57:27Z taku $

						*htmlspecialchars*
Convert special characters to HTML entities.

1. Encode				|HTMLSpecialChars|
2. Decode				|HTMLSpecialCharsDecode|
3. Customization Variables		|htmlspecialchars-customization|


==============================================================================
1. Encode					*HTMLSpecialChars*

:[range]HTMLSpecialChars			*:HTMLSpecialChars*

Example ~

-------------------------------before-------------------------------
<pre class="preformat"> 
    <span class="a_class">sample text</span>
    <span class="a_class">sample text</span>
    <span class="a_class">sample text</span>
</pre>
-------------------------------before-------------------------------
>
	:2,4HTMLSpecialChars
<
-------------------------------after -------------------------------
<pre class="preformat"> 
    &lt;span class=&quot;a_class&quot;&gt;sample text&lt;/span&gt;
    &lt;span class=&quot;a_class&quot;&gt;sample text&lt;/span&gt;
    &lt;span class=&quot;a_class&quot;&gt;sample text&lt;/span&gt;
</pre>
-------------------------------after -------------------------------


==============================================================================
2. Decode					*HTMLSpecialCharsDecode*

:[range]HTMLSpecialCharsDecode			*:HTMLSpecialCharsDecode*

Example ~

-------------------------------before -------------------------------
<pre class="preformat"> 
    &lt;span class=&quot;a_class&quot;&gt;sample text&lt;/span&gt;
    &lt;span class=&quot;a_class&quot;&gt;sample text&lt;/span&gt;
    &lt;span class=&quot;a_class&quot;&gt;sample text&lt;/span&gt;
</pre>
-------------------------------before-------------------------------
>
	:2,4HTMLSpecialCharsDecode
<
-------------------------------after -------------------------------
<pre class="preformat"> 
    <span class="a_class">sample text</span>
    <span class="a_class">sample text</span>
    <span class="a_class">sample text</span>
</pre>
-------------------------------after -------------------------------


==============================================================================
3. Customization Variables		*htmlspecialchars-customization*

*g:htmlspecialchars_ent_noquotes*
Set this variable to a nonzero value if you don't prefer to convert character
from '"' to '&quot;'
e.g.: >
    :let g:htmlspecialchars_ent_noquotes = 'yes'
<

*g:htmlspecialchars_ent_quotes*
Set this variable to a nonzero value if you prefer to convert character
from "'" to "#039"
e.g.: >
    :let g:htmlspecialchars_ent_quotes = 'yes'
<

 vim:tw=78:ts=8:ft=help:norl:
