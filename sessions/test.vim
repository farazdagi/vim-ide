let SessionLoad = 1
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
inoremap <silent> <Plug>NERDCommenterInInsert  <BS>:call NERDComment(0, "insert")
imap <F10> :TrinityToggleTagList
imap <F7> :MarksBrowser
imap <F8> :BufExplorer
smap 	 i<BS>	
map <NL> j
map  k
nnoremap p p'[v']=
nnoremap P P'[v']=
nmap   <PageDown>
nmap ,ca <Plug>NERDCommenterAltDelims
vmap ,cA <Plug>NERDCommenterAppend
nmap ,cA <Plug>NERDCommenterAppend
vmap ,c$ <Plug>NERDCommenterToEOL
nmap ,c$ <Plug>NERDCommenterToEOL
vmap ,cu <Plug>NERDCommenterUncomment
nmap ,cu <Plug>NERDCommenterUncomment
vmap ,cn <Plug>NERDCommenterNest
nmap ,cn <Plug>NERDCommenterNest
vmap ,cb <Plug>NERDCommenterAlignBoth
nmap ,cb <Plug>NERDCommenterAlignBoth
vmap ,cl <Plug>NERDCommenterAlignLeft
nmap ,cl <Plug>NERDCommenterAlignLeft
vmap ,cy <Plug>NERDCommenterYank
nmap ,cy <Plug>NERDCommenterYank
vmap ,ci <Plug>NERDCommenterInvert
nmap ,ci <Plug>NERDCommenterInvert
vmap ,cs <Plug>NERDCommenterSexy
nmap ,cs <Plug>NERDCommenterSexy
vmap ,cm <Plug>NERDCommenterMinimal
nmap ,cm <Plug>NERDCommenterMinimal
vmap ,c  <Plug>NERDCommenterToggle
nmap ,c  <Plug>NERDCommenterToggle
vmap ,cc <Plug>NERDCommenterComment
nmap ,cc <Plug>NERDCommenterComment
nmap ,f [I:let nr = input("Which one: ")|exe "normal " . nr ."[\t"
map ,w :x
map ,q :q!
map ,s :w
nnoremap <silent> -j :OScan lastdown
nnoremap <silent> -k :OScan lastup
nnoremap <silent> -l :OScan last
nnoremap <silent> -n :OScan definition_declaration
nnoremap <silent> -u :OScan taglist_under_cursor
nnoremap <silent> -M :OScan marks global user
nnoremap <silent> -m :OScan marks
nnoremap <silent> -h :OScan changes
nnoremap <silent> -p :OScan paste
nnoremap <silent> -v :OScan vims
nnoremap <silent> -w :OScan windows
nnoremap <silent> -F :OScan files =fnamemodify(@%, ":t:r")<BS>
nnoremap <silent> -f :OScan files
nnoremap <silent> -b :OScan buffers
nnoremap <silent> -as :OScan search_in_scope
nnoremap <silent> -S :OScan multiline_search
nnoremap <silent> -s :OScan search
nnoremap <silent> -g :OScan file 
nnoremap <silent> -o :OScan file object
nnoremap <silent> -d :OScan file destructor
nnoremap <silent> -c :OScan file constructor
nnoremap <silent> -t :OScan file
vnoremap < <gv
vnoremap > >gv 
vmap [% [%m'gv``
vmap ]% ]%m'gv``
vmap a% [%v]%
nmap gx <Plug>NetrwBrowseX
nmap gf :new %:p:h/<cfile>
vmap <F10> :TrinityToggleTagList
nmap <F7> :MarksBrowser
nmap <F8> :BufExplorer
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#NetrwBrowseX(expand("<cWORD>"),0)
nmap <silent> <Plug>NERDCommenterAppend :call NERDComment(0, "append")
nnoremap <silent> <Plug>NERDCommenterToEOL :call NERDComment(0, "toEOL")
vnoremap <silent> <Plug>NERDCommenterUncomment :call NERDComment(1, "uncomment")
nnoremap <silent> <Plug>NERDCommenterUncomment :call NERDComment(0, "uncomment")
vnoremap <silent> <Plug>NERDCommenterNest :call NERDComment(1, "nested")
nnoremap <silent> <Plug>NERDCommenterNest :call NERDComment(0, "nested")
vnoremap <silent> <Plug>NERDCommenterAlignBoth :call NERDComment(1, "alignBoth")
nnoremap <silent> <Plug>NERDCommenterAlignBoth :call NERDComment(0, "alignBoth")
vnoremap <silent> <Plug>NERDCommenterAlignLeft :call NERDComment(1, "alignLeft")
nnoremap <silent> <Plug>NERDCommenterAlignLeft :call NERDComment(0, "alignLeft")
vmap <silent> <Plug>NERDCommenterYank :call NERDComment(1, "yank")
nmap <silent> <Plug>NERDCommenterYank :call NERDComment(0, "yank")
vnoremap <silent> <Plug>NERDCommenterInvert :call NERDComment(1, "invert")
nnoremap <silent> <Plug>NERDCommenterInvert :call NERDComment(0, "invert")
vnoremap <silent> <Plug>NERDCommenterSexy :call NERDComment(1, "sexy")
nnoremap <silent> <Plug>NERDCommenterSexy :call NERDComment(0, "sexy")
vnoremap <silent> <Plug>NERDCommenterMinimal :call NERDComment(1, "minimal")
nnoremap <silent> <Plug>NERDCommenterMinimal :call NERDComment(0, "minimal")
vnoremap <silent> <Plug>NERDCommenterToggle :call NERDComment(1, "toggle")
nnoremap <silent> <Plug>NERDCommenterToggle :call NERDComment(0, "toggle")
vnoremap <silent> <Plug>NERDCommenterComment :call NERDComment(1, "norm")
nnoremap <silent> <Plug>NERDCommenterComment :call NERDComment(0, "norm")
nmap <silent> <F6> :set number!
nmap <F12> :TrinityToggleAll 
nmap <F11> :TrinityToggleNERDTree 
nmap <F10> :TrinityToggleTagList 
omap <F10> :TrinityToggleTagList
nmap <F9> :TrinityToggleSourceExplorer 
vmap <F7> :MarksBrowser
omap <F7> :MarksBrowser
vmap <F8> :BufExplorer
omap <F8> :BufExplorer
imap  
imap 	 <Plug>Jumper
imap  @@@hhkywjl?@@@P/@@@3s
map <silent> ë +
map <silent> ê -
let &cpo=s:cpo_save
unlet s:cpo_save
set autochdir
set autowrite
set backspace=indent,eol,start
set completeopt=menu,longest,preview
set expandtab
set fileencodings=ucs-bom,utf-8,default,latin1
set foldlevelstart=99
set guicursor=a:blinkwait0,a:block-cursor
set helplang=en
set history=100
set hlsearch
set incsearch
set laststatus=2
set matchtime=2
set nomodeline
set nrformats=octal,hex,alpha
set pastetoggle=<F10>
set previewheight=8
set printoptions=paper:letter
set ruler
set runtimepath=~/.vim,/var/lib/vim/addons,/usr/share/vim/vimfiles,/usr/share/vim/vim72,/usr/share/vim/vimfiles/after,/var/lib/vim/addons/after,~/.vim/after
set scrolloff=3
set shiftround
set shiftwidth=4
set showcmd
set showmatch
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
set tabstop=4
set tags=tags;
set updatecount=50
set updatetime=1
set viminfo='20,\"50,:20,%,n~/.viminfo
set wildmenu
set wildmode=list:longest,full
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd /var/www/projects/apply/slingshop.com/trunk/app/controllers
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
silent! argdel *
set splitbelow splitright
wincmd _ | wincmd |
split
1wincmd k
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
exe '1resize ' . ((&lines * 24 + 25) / 50)
exe '2resize ' . ((&lines * 23 + 25) / 50)
argglobal
enew
file /var/www/projects/apply/slingshop.com/trunk/app/controllers/__SessionList__
let s:cpo_save=&cpo
set cpo&vim
nmap <buffer> gf <Plug>RailsTabFind
nmap <buffer> f <Plug>RailsSplitFind
nnoremap <buffer> <silent>  :bwipeout!
nmap <buffer> [f <Plug>RailsAlternate
nmap <buffer> ]f <Plug>RailsRelated
nmap <buffer> gf <Plug>RailsFind
nnoremap <buffer> <silent> q :bwipeout!
nnoremap <buffer> <silent> <Plug>RailsTabFind :RTfind
nnoremap <buffer> <silent> <Plug>RailsVSplitFind :RVfind
nnoremap <buffer> <silent> <Plug>RailsSplitFind :RSfind
nnoremap <buffer> <silent> <Plug>RailsFind :REfind
nnoremap <buffer> <silent> <Plug>RailsRelated :R
nnoremap <buffer> <silent> <Plug>RailsAlternate :A
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal noautoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=wipe
setlocal nobuflisted
setlocal buftype=nofile
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal completefunc=
setlocal nocopyindent
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != ''
setlocal filetype=
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=99
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=
setlocal includeexpr=RailsIncludeexpr()
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal nomodeline
setlocal nomodifiable
setlocal nrformats=octal,hex,alpha
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=.,/var/www/projects/apply/slingshop.com/trunk,/var/www/projects/apply/slingshop.com/trunk/app,/var/www/projects/apply/slingshop.com/trunk/app/models,/var/www/projects/apply/slingshop.com/trunk/app/controllers,/var/www/projects/apply/slingshop.com/trunk/app/helpers,/var/www/projects/apply/slingshop.com/trunk/config,/var/www/projects/apply/slingshop.com/trunk/lib,/var/www/projects/apply/slingshop.com/trunk/app/views,/var/www/projects/apply/slingshop.com/trunk/test,/var/www/projects/apply/slingshop.com/trunk/test/unit,/var/www/projects/apply/slingshop.com/trunk/test/functional,/var/www/projects/apply/slingshop.com/trunk/test/integration,/var/www/projects/apply/slingshop.com/trunk/app/*,/var/www/projects/apply/slingshop.com/trunk/vendor,/var/www/projects/apply/slingshop.com/trunk/vendor/plugins/*/lib,/var/www/projects/apply/slingshop.com/trunk/vendor/plugins/*/test,/var/www/projects/apply/slingshop.com/trunk/vendor/rails/*/lib,/var/www/projects/apply/slingshop.com/trunk/vendor/rails/*/test,/usr/include,
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=4
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=.rb,.rhtml,.erb,.rxml,.builder,.rjs,.mab,.liquid,.haml,.dryml,.mn,.css,.js,.yml,.csv,.rake,.sql,.html,.xml
setlocal noswapfile
setlocal synmaxcol=3000
if &syntax != ''
setlocal syntax=
endif
setlocal tabstop=4
setlocal tags=/var/www/projects/apply/slingshop.com/trunk/tmp/tags,tags;,/var/www/projects/apply/slingshop.com/trunk/tags
setlocal textwidth=0
setlocal thesaurus=
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal nowrap
setlocal wrapmargin=0
wincmd w
argglobal
enew
file /var/www/projects/apply/slingshop.com/trunk/app/controllers/NERD_tree_3
let s:cpo_save=&cpo
set cpo&vim
nmap <buffer> gf <Plug>RailsTabFind
nmap <buffer> f <Plug>RailsSplitFind
nmap <buffer> [f <Plug>RailsAlternate
nmap <buffer> ]f <Plug>RailsRelated
nmap <buffer> gf <Plug>RailsFind
nnoremap <buffer> <silent> <Plug>RailsTabFind :RTfind
nnoremap <buffer> <silent> <Plug>RailsVSplitFind :RVfind
nnoremap <buffer> <silent> <Plug>RailsSplitFind :RSfind
nnoremap <buffer> <silent> <Plug>RailsFind :REfind
nnoremap <buffer> <silent> <Plug>RailsRelated :R
nnoremap <buffer> <silent> <Plug>RailsAlternate :A
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal noautoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal nobuflisted
setlocal buftype=nofile
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal completefunc=
setlocal nocopyindent
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'nerdtree'
setlocal filetype=nerdtree
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=99
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=
setlocal includeexpr=RailsIncludeexpr()
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal nomodeline
setlocal nomodifiable
setlocal nrformats=octal,hex,alpha
set number
setlocal nonumber
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=.,/var/www/projects/apply/slingshop.com/trunk,/var/www/projects/apply/slingshop.com/trunk/app,/var/www/projects/apply/slingshop.com/trunk/app/models,/var/www/projects/apply/slingshop.com/trunk/app/controllers,/var/www/projects/apply/slingshop.com/trunk/app/helpers,/var/www/projects/apply/slingshop.com/trunk/config,/var/www/projects/apply/slingshop.com/trunk/lib,/var/www/projects/apply/slingshop.com/trunk/app/views,/var/www/projects/apply/slingshop.com/trunk/test,/var/www/projects/apply/slingshop.com/trunk/test/unit,/var/www/projects/apply/slingshop.com/trunk/test/functional,/var/www/projects/apply/slingshop.com/trunk/test/integration,/var/www/projects/apply/slingshop.com/trunk/app/*,/var/www/projects/apply/slingshop.com/trunk/vendor,/var/www/projects/apply/slingshop.com/trunk/vendor/plugins/*/lib,/var/www/projects/apply/slingshop.com/trunk/vendor/plugins/*/test,/var/www/projects/apply/slingshop.com/trunk/vendor/rails/*/lib,/var/www/projects/apply/slingshop.com/trunk/vendor/rails/*/test,/usr/include
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=4
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=%{b:NERDTreeRoot.path.strForOS(0)}
setlocal suffixesadd=.rb,.rhtml,.erb,.rxml,.builder,.rjs,.mab,.liquid,.haml,.dryml,.mn,.css,.js,.yml,.csv,.rake,.sql,.html,.xml
setlocal noswapfile
setlocal synmaxcol=3000
if &syntax != 'nerdtree'
setlocal syntax=nerdtree
endif
setlocal tabstop=4
setlocal tags=/var/www/projects/apply/slingshop.com/trunk/tmp/tags,tags;,/var/www/projects/apply/slingshop.com/trunk/tags
setlocal textwidth=0
setlocal thesaurus=
setlocal nowinfixheight
setlocal winfixwidth
setlocal nowrap
setlocal wrapmargin=0
wincmd w
exe '1resize ' . ((&lines * 24 + 25) / 50)
exe '2resize ' . ((&lines * 23 + 25) / 50)
tabnext 1
if exists('s:wipebuf')
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToO
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
