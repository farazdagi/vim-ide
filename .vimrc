"
" MAIN CUSTOMIZATION FILE
"

" Enable loading filetype and indentation plugins
filetype plugin on
filetype indent on

" Turn syntax highlighting on
syntax on

" default color scheme
colorscheme wombat

" enable 256 colors in screen
set t_Co=256

" make sure that mouse is enabled
set mouse=a

"
" GLOBAL SETTINGS
"

" Make sure that unrecognized files are still indented
set autoindent

" Write contents of the file, if it has been modified, on buffer exit
" set autowrite

" Allow buffer to go into background - w/o losing the undo history and
" w/o prior saving
set hidden

" Allow backspacing over everything
set backspace=indent,eol,start

" Highlight current line - allows you to track cursor position more easily
set cursorline

" Insert mode completion options
set completeopt=longest,menuone

" Use UTF-8 as the default buffer encoding
set enc=utf-8

" Remember up to 100 'colon' commmands and search patterns
set history=100

" Enable incremental search
set incsearch

" Highlight results of a search
set hlsearch

" Ignore case when searching
set ignorecase

" Ignore case only if seach string is all lowercase
set smartcase

" Always show status line, even for one window
set laststatus=2

" Jump to matching bracket for 2/10th of a second (works with showmatch)
set matchtime=2


" Enable CTRL-A/CTRL-X to work on octal and hex numbers, as well as characters
set nrformats=octal,hex,alpha

" Use F4 to toggle 'paste' mode
set pastetoggle=<F4>

" Show line, column number, and relative position within a file in the status line
set ruler

" Show line numbers - could be toggled on/off on-fly by pressing F6
set number

" Scroll when cursor gets within 3 characters of top/bottom edge
set scrolloff=10

" Round indent to multiple of 'shiftwidth' for > and < commands
set shiftround

" Use 4 spaces for (auto)indent
set shiftwidth=4

" Show (partial) commands (or size of selection in Visual mode) in the status line
set showcmd

" When a bracket is inserted, briefly jump to a matching one
set showmatch

" Don't request terminal version string (for xterm)
set t_RV=

" Use 4 spaces for <Tab> and :retab
set tabstop=4

" Expand tabs to spaces
set expandtab

" Wrap text after hitting the 120-char length
set textwidth=120

" Write swap file to disk after every 50 characters
set updatecount=50

" Remember things between sessions
"
" '20  - remember marks for 20 previous files
" \"50 - save 50 lines for each register
" :20  - remember 20 items in command-line history 
" %    - remember the buffer list (if vim started without a file arg)
" n    - set name of viminfo file
set viminfo='20,\"50,:20,%,n~/.viminfo

" Use menu to show command-line completion (in 'full' case)
set wildmenu

" Set command-line completion mode:
"   - on first <Tab>, when more than one match, list all matches and complete
"     the longest common  string
"   - on second <Tab>, complete the next full match and show menu
set wildmode=list:longest,full

" Go back to the position the cursor was on the last time this file was edited
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")|execute("normal `\"")|endif

" Fix my <Backspace> key (in Mac OS X Terminal)
set t_kb=
fixdel

" Avoid loading MatchParen plugin
let loaded_matchparen = 1

" netRW: Open files in a split window
let g:netrw_browse_split = 1

" Make sure cursor is not blinking
set gcr=a:blinkwait0,a:block-cursor

" 
" Tags
"
set tags+=$HOME/.vim/tags/python2.ctags

"
" Plugins tuning
"

" Nert Tree
let NERDTreeIgnore=['\.pyc$']

" Project
let g:proj_flags="FisLt"
let g:proj_window_width = 40
" SnippetEmu
" let g:snippetsEmu_key = "<C-j>"
" dbext
let g:dbext_default_profile_mySQL = 'type=MYSQL:integratedlogin=1:dbname=mysql:user=root:passwd=a:host=localhost'
let g:dbext_default_profile = 'mySQL' 

"
" Folding
"
let g:php_folding = 2
set foldlevel=5
"
" Autocommands
"
" MWOP Suggestion
"run file with PHP CLI (CTRL-M)
:autocmd FileType php noremap <C-M> :w!<CR>:!$HOME/bin/php %<CR>
" " PHP parser check (CTRL-L)
autocmd FileType php noremap <C-L> :!$HOME/bin/php -l %<CR>
" start vim with NERDTree enabled
autocmd VimEnter * NERDTree
autocmd FileType python set omnifunc=pythoncomplete#Complete

"
" MAPPINGS
"

" Set the <Leader> for combo commands
let mapleader = ","

" Easy tab navigation
map tl :tabnext<CR>
map th :tabprevious<CR>
map tn :tabnew<CR>
map td :tabclose<CR>

" Do not bother too much with ESC key
map! 33 <ESC>
vmap 33 <ESC>

" Allows you to enter sudo pass and save the file
" when you forgot to open your file with sudo
cmap w!! %!sudo tee > /dev/null %

" Auto-complete - more smart menu see: http://bit.ly/d1ILFI
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"inoremap <expr> <C-n> pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" F2 allow to utilize screen
map <F2> :!screen -x cli<CR>
imap <F2> <ESC>:!screen -x cli<CR>
vmap <F2> <ESC><ESC>:!screen -x cli<CR>

" F3 search lines with FuzzyFinder
map <F3> :FufLine<CR>
imap <F3> <ESC>:FufLine<CR>
vmap <F3> <ESC><ESC>:FufLine<CR>


autocmd FileType php noremap <C-F5> <ESC>:!phpunit %<CR>
autocmd FileType php noremap <F5> <ESC>:!php -f %<CR>
autocmd FileType python noremap <F5> <ESC>:!python %<CR>

" start vim with NERDTree enabled
" F7 see list of open buffers
map <F8> :BufExplorer<CR>
imap <F8> <ESC>:BufExplorer<CR>
vmap <F8> <ESC>:BufExplorer<CR>

" F8 See List of Bookmarks
map <F7> :MarksBrowser<CR>
imap <F7> <ESC>:MarksBrowser<CR>
vmap <F7> <ESC>:MarksBrowser<CR>

" " Open and close the srcexpl.vim separately 
nmap <F9>   :TrinityToggleSourceExplorer<CR> 

" " Open and close the taglist.vim separately 
map <F10> :TrinityToggleTagList<CR>
imap <F10> <ESC>:TrinityToggleTagList<CR>
nmap <F10>  <ESC>:TrinityToggleTagList<CR> 

" " Open and close the NERD_tree.vim separately 
nmap <F11>  :TrinityToggleNERDTree<CR> 

" Open and close all the three plugins on the same time 
nmap <F12>  :TrinityToggleAll<CR> 

" Ability to open tag'ed document as vertical split
" or a new tab
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
"map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>


" Allow to copy/paste between VIM instances
vmap <silent> ,y y:new<CR>:call setline(1,getregtype())<CR>o<Esc>P:wq! ~/reg.txt<CR>
nmap <silent> ,y :new<CR>:call setline(1,getregtype())<CR>o<Esc>P:wq! ~/reg.txt<CR>
map <silent> ,p :sview ~/reg.txt<CR>"zdddG:q!<CR>:call setreg('"', @", @z)<CR>p
map <silent> ,P :sview ~/reg.txt<CR>"zdddG:q!<CR>:call setreg('"', @", @z)<CR>P

" save changes
map ,s :w<CR>
imap ,s <ESC>:w<CR>
vmap ,s <ESC><ESC>:w<CR>
" Locate file in hierarchy quickly
map ,t :NERDTree %<CR>
" change the directory to the current file I'm working on
" plays nicely with NERDTree - when file opened
map ,cd :cd %:p:h
" close buffer using bclose plugin (window is not closed)
map ,w :Bclose<CR>
map ,diff :call Svndiff('next')<CR>
imap ,diff <ESC>:call Svndiff('next')<CR>
map ,diffc :call Svndiff('clear')<CR>
imap ,diffc <ESC>:call Svndiff('clear')<CR>
" switch to upper/lower window quickly
map <C-J> <C-E>
map <C-K> <C-Y>
" resize window
map <silent> <A-j> <C-W>-
map <silent> <A-k> <C-W>+
" use CTRL-F for omni completion
imap <C-F> 
" map CTRL-L to piece-wise copying of the line above the current one
imap <C-L> @@@<ESC>hhkywjl?@@@<CR>P/@@@<CR>3s
" map ,f to display all lines with keyword under cursor and ask which one to
" jump to
nmap ,f [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>
" use <F6> to toggle line numbers
nmap <silent> <F6> :set number!<CR>
" page down with <Space>
" nmap <Space> <PageDown>
" open filename under cursor in a new window (use current file's working
" directory) 
nmap gf :new %:p:h/<cfile><CR>
" map <Alt-p> and <Alt-P> to paste below/above and reformat
nnoremap <Esc>P  P'[v']=
nnoremap <Esc>p  p'[v']=
" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv 
" turn off search highlighting
nmap <silent> <Leader>n :silent :nohlsearch<CR>

" Generic highlight changes
"highlight Comment cterm=none ctermfg=Gray
"highlight IncSearch cterm=none ctermfg=Black ctermbg=DarkYellow
"highlight Search cterm=none ctermfg=Black ctermbg=DarkYellow
"highlight String cterm=none ctermfg=DarkGreen
"highlight treeDir cterm=none ctermfg=Cyan
"highlight treeUp cterm=none ctermfg=DarkYellow
"highlight treeCWD cterm=none ctermfg=DarkYellow
"highlight netrwDir cterm=none ctermfg=Cyan

