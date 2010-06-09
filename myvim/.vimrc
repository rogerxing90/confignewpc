"===============================================================
"== To be pasted in ~/.vimrc
"===============================================================
"so ~/confignewpc/myvim/.vimrc
"nmap ,rr	:e ~/confignewpc/myvim/.vimrc<CR>
"-- win --
"so D:\kn\1confignewpc\myvim\.vimrc
"nmap ,rr :e D:\kn\1confignewpc\myvim\.vimrc<CR>
"set rtp+=D:\kn\1confignewpc\myvim

"===============================================================
"== Miscellaneous Set (:h options)
"===============================================================
"set filetype=c
set cot+=menuone
"set clipboard+=unnamed       "set yank, paste, delete content into clipboards
:set wildmode=list:longest    "This is really something you want! Tab-completion the right way!
"set nowrap             "no line break
set ignorecase
set smartcase          "overrides ignorecase if uppercase used, ignorecase need to be on
set guioptions+=b      "show bottom scrollbar
"set guioptions+=l      "show long straight scrollbar on the left
set confirm        "Raise a confirm dialog for changed buffer
set shiftwidth=4
set tabstop=4       "after set to a new value, use retab to replace old to new tabstop value
"set expandtab
"set linebreak        "enable breakat
set visualbell        "set vb t_vb=on "visual bell
"set noerrorbells
set nu            "display line
set autoindent
set smartindent
set hlsearch        "highlight search
set incsearch        "highlight when typing
set nocompatible    "no backward compatible with vi
set bs=2        "backspace=2
set smarttab        "make <tab> and <backspace> smarter
set backspace=eol,start,indent "allow backspacing over indent, eol, & start
set wildmenu        "Show menu with possible completions
set hidden                     "can change buffer without saving
set nostartofline " leave my cursor where it was
"set more                       "the 'more' prompt
"set backup                     "produce *~ backup files
"set backupext=~                "add ~ to the end of backup files
"set scrolloff=5                "keep at least 5 lines above/below cursor
"set sidescrolloff=5            "keep at least 5 columns left/right of cursor
set showcmd            "display incomplete command
set showmode
set ruler              "display cursor position
"set iskeyword +=-        "make hyper-active considered as a word
"set mousehide                  "hide the mouse when typing text
"autowrap(t),allow gq(q), wrap@blankSpace b4(b), autowrap comment(c)
"set formatoptions=tqbcwan
"set formatoptions +=2           "paragraph format(start with xx....)g`
"set guitablabel
"set completeopt=menu, preview
" normally don't automatically format `text' as it is typed, i.e. only do this
" with comments, at 79 characters:
"set formatoptions+=tcroqn      "auto formatting, t=linebreak at textwidth
"set formatoptions=tcrqnwa      "auto formatting, t=linebreak at textwidth
"set fo+=a is convenient, but can be a pain too
set formatoptions=lqnw      "auto formatting, t=linebreak at textwidth
"default: set formatoptions=tcrqol
"set textwidth=79 wrap linebreak
"set textwidth=79
set nowrap
"set textwidth=79 linebreak
"set wrapwidth=60
"set comments-=s1:/*,mb:*,ex:*/
"set comments+=s:/*,mb:**,ex:*/
"Only first line has comment string, don't repeat on next line
"set comments+=fb:*
"set comments=sl:/*,mb:==,elx:*/
"Original:set wildchar=<Tab>
set wildchar=<Tab> wildmenu wildmode=full
"to avoid mksession error E228 makemap
set sessionoptions-=options
set sessionoptions=blank,buffers,curdir,tabpages,winsize,folds
set ff=unix
set matchpairs=(:),{:},[:],<:>
set scrolloff=5
set sidescrolloff=5
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set statusline=2
"set winaltkeys=yes "let window handle Alt key
" Don't let Windows handle alt-cmds (menu access, etc.); let vim do it
" Make Alt-F pop down the 'File' menu ['Edit','Tools','Syntax','Buffers','Window','Misc','Help']
"set winaltkeys=no
"map <M-f> :simalt f<CR>
"map <M-e> :simalt e<CR>
"map <M-t> :simalt t<CR>
"map <M-s> :simalt s<CR>
"map <M-b> :simalt b<CR>
"map <M-w> :simalt w<CR>
"map <M-m> :simalt m<CR>
"map <M-h> :simalt h<CR>
" System menu (leader): follow with any normal Windows Menu letter
"noremap <M-Space> :simalt ~<CR>
"inoremap <M-Space> <C-O>:simalt ~<CR>
"cnoremap <M-Space> <C-C>:simalt ~<CR>

""Set mapleader
"let mapleader = ","
"let g:mapleader = ","

"===============================================================
"== Autocmd / Filetype
"===============================================================
autocmd BufRead *.out %!xxd
autocmd filetype c set omnifunc+=ccomplete#Complete
"autocmd filetype c,cpp set cindent
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd BufRead *.diff colorscheme patch
filetype plugin indent on
"comment follow to enable linebreak
"setlocal fo-=t fo+=croql @ /usr/share/vim/vim72/ftplugin/c.vim


"===============================================================
"== OS specific (copy file name)
"===============================================================
" Convert slashes to backslashes for Windows.
if has('win32')
    "nmap ,cs :let @*=substitute(expand("%"), "/", "\\", g)<CR>
    noremap ,as :let @*=expand("%:t")<Bar>echo @*<CR>
    "nmap ,cl :let @*=substitute(expand("%:p"), "/", "\\", g)<Bar>echo @*<CR>
    noremap ,al :let @*=expand("%:p")<Bar>echo @*<CR>
    " This will copy the path in 8.3 short format, for DOS and Windows 9x
    noremap ,a8 :let @*=substitute(expand("%:p:8"), "/", "\\", g)<Bar>echo @*<CR>
else
    "nmap ,cs :let @+=expand("%")<CR>
    noremap ,as :let @+=expand("%:t")<Bar>echo @*<CR>
    "or use * reg (+ and * is the same with slight difference)
    noremap ,al :let @+=expand("%:p")<Bar>echo @*<CR>
    "nmap ,cs :let @*=expand("%")<CR>
    "nmap ,cl :let @*=expand("%:p")<CR>
endif


"===============================================================
"== autoread
"===============================================================
"reload when documents changed outside gvim (based on timestamp)
set autoread      "watch for file changes by other programsF"
"check the timestamp immediately, and reload if content has changed (:checktime)
nmap <F5> :checkt<cr>
imap <F5> <esc>:checkt<cr>


"===============================================================
"== Hightlight
"===============================================================
syn on "syntax on
"highlight RedundantSpaces term=standout ctermbg=red guibg=red
"use :set list! to toggle visible whitespace on/off
"use :nolist to toggle list off
set listchars=tab:>-,trail:.,extends:>,eol:-,precedes:<,nbsp:%

"highlight word over 80 columns
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.*/


"+++++++++++++++++++++++++ MAPPING +++++++++++++++++++++++++++++
"===============================================================
"== Mapping: simulate shift-arrows key (like in windows)
"===============================================================
inoremap <ESC>[A <C-O>vk
vnoremap <ESC>[A k
inoremap <ESC>[B <C-O>vj
vnoremap <ESC>[B j
inoremap <ESC>[C <C-O>vl
vnoremap <ESC>[C l
inoremap <ESC>[D <C-O>vh
vnoremap <ESC>[D h

"===============================================================
"== Mapping: Multiple Documents
"===============================================================
"switch to next/previous buffer (opened doc)
map <C-Left> :bn <CR>
map <C-Right> :bp <CR>
"switch to previous/alternate documents (to open modified file :bm)
"if has ("win32")
"   map <M-p> :e#<CR>
"else
"   map <C-M-p> :e#<CR>
"endif
map <C-Tab> :tabn <CR>
"imap<C-Tab> <esc>:tabn <CR>
map <S-Tab> :tabp <CR>
imap<S-Tab> <esc>:tabp <CR>
"nnoremap ,b :ls<CR>:buffer<Space>
"close current buffer (opened doc)
"map <c-w> :bd <CR> "<c-w> used in multi-doc
map <c-F4> :bd <CR>
"open new doc in tab
noremap <C-N> :tabnew <CR>
"nnoremap <f5> :buffers<cr>:buffer<space>

"===============================================================
"== Mapping: Omnicomp
"===============================================================
setlocal omnifunc+=syntaxcomplete#Complete "load all the plugins depending upon the file types
set omnifunc=ft-c-omni  "set c function keyword auto-completion
" tab completion
" if at the begining of the line, tab, otherwise completion c-p (nice !)
"inoremap <tab> <c-r>=InsertTabWrapper()<cr>
"inoremap <tab> <c-r>=InsertTabWrapper ("forward")<cr>
"inoremap <s-tab> <c-r>=InsertTabWrapper ("backward")<cr>
"normal tab
"inoremap <c-tab> <tab>
"omnifunc completion key-map
"c-e cancel, c-y confirm
"inoremap <silent><Esc> <C-r>=pumvisible()?"\<lt>C-e>":"\<lt>Esc>"<CR>
"inoremap <silent><CR> <C-r>=pumvisible()?"\<lt>C-y>":"\<lt>CR>"<CR>
"inoremap <silent><Down> <C-r>=pumvisible()?"\<lt>C-n>":"\<lt>Down>"<CR>
"inoremap <silent><Up> <C-r>=pumvisible()?"\<lt>C-p>":"\<lt>Up>"<CR>
inoremap <silent><PageDown> <C-r>=pumvisible()?"\<lt>PageDown>\<lt>C-p>\<lt>C-n>":"\<lt>PageDown>"<CR>
inoremap <silent><PageUp> <C-r>=pumvisible()?"\<lt>PageUp>\<lt>C-p>\<lt>C-n>":"\<lt>PageUp>"<CR>
inoremap <A-j> <C-X><C-O>

"===============================================================
"== Ungrouped Mapping
"===============================================================
"//---------------------------------- normal mapping start //
nmap <A-0> :only<cr>
"save file
nmap <C-s> :w<cr>
"cd into current file directory
nmap ,cd :cd %:p:h<CR>
"nmap <c-m> O<esc>
nmap <down> g<down>
nmap <up> g<up>
nmap <A-F3> :set filetype=c <cr>
"-- movement --
" `. (last modification)
"change list
nmap <M-;> g;
nmap <M-,> g,
"move to the end of line
map ,e $
map ,b ^
nmap ,r $a;<ESC>
"nmap ,r :s/$/;/<CR>
"toggle &hls &wrap
"set option! (invert value)
"set option!|set option? (invert and show value)
"if has('win32')
   nmap <C-H> :set hls!<Bar>set hls?<CR>
   nmap <A-F2> :set wrap!<Bar>set wrap?<CR>
   "create one empty line and back to normal
   nmap <C-J> o<ESC><ESC>
"else
"   nmap <C-M-H> :set hls!<Bar>set hls?<CR>
"   nmap <C-M-W> :set wrap!<Bar>set wrap?<CR>
"   "create one empty line and back to normal
"   nmap <C-M-J> o<ESC><ESC>
"endif
"reference --
"nnoremap ,s :exe 'grep ' . expand('<cword>') . ' *'<CR>
"nnoremap ,s :grep <C-R><C-W> *<CR>
"recursive map, replace emacs with vi in all the files (\s recursive)
"nmap \s  :%s/emacs/vi/g \| update \| n<CR>\s
"//---------------------------------- insert mapping start //
imap <C-S> <esc>:w<CR>a
"imap <down> <esc>g<down>i
imap <down> <esc>g<down>
"imap <up> <esc>g<up>i
imap <up> <esc>g<up>
"//-- movement --
imap <C-H> <ESC>ha
imap <C-J> <ESC>ja
imap <C-K> <ESC>ka
imap <C-L> <ESC>la
imap <A-;> <ESC>$a;
imap <C-E> <ESC>$a
imap <C-B> <ESC>^i
"NOTE: if only use <ESC>, they will be delay
imap <C-space> <ESC>`^
"imap <C-H> <c-o>h
"imap <C-J> <c-o>j
"imap <C-K> <c-o>k
"imap <C-L> <c-o>l
"reference --
"<C-C> go back to normal mode
"<C-o> change to ex mode, exe one command then go back
"inoremap <F5> <C-O>:call MyVimFunc()<CR>
"above will move the cursor, below will not
"inoremap <F5> <C-\><C-O>:call MyVimFunc()<CR>
"inoremap <F2> <C-R>=expand('%:p:h')<CR>   "insert expression using <C-R>=
"inoremap <F2> <C-R>=MyVimFunc()<CR>
"vim replace \<...> with control sequence, command below will fail.
"inoremap <Down> <C-R>=pumvisible() ? '\<C-N>' : '\<Down>'<CR>
"escpae "\<" with "\<lt>" - less than
"inoremap <Down> <C-R>=pumvisible() ? '\<lt>C-N>' : '\<lt>Down>'<CR>
"replace vi (followed by space or enter) with "Vi Improved"
"iabbr vi Vi Improved
"now, if press enter after vi, it would not expand. (can expand by space or Ctrl]
"inoremap <Enter> <Enter><C-G>u
"<C-G>u to start a new change, can undo the bs key effect
":inoremap <C-H> <C-G>u<C-H>
"//---------------------------------- visual mapping start //
"search for the yanked text (select then g/)
vnoremap g/ y/<C-R>"<CR>
"insert single quote around selected block of text. < beginning of visual, > end of visual
vnoremap qq <Esc>`>a'<Esc>`<i'<Esc>
"wrap <b></b> around visually selected text (use reg z, delete insert, paste
vmap sb "zdi<b><C-R>z</b><Esc>
"reference --
"<C-Q> I or A or c then <esc><esc>
"//---------------------------------- pending mapping start //
"select the inner block
onoremap <F6> iB
"//---------------------------------- temporary mapping start //
nmap \bf /8[[:digit:]]\{6}[0-9a-zA-Z]<cr>
"nmap \bd :%s#//\(\#define ENABLE_DEBUG\)#\1<CR>
"nmap \bn :%s#^\\(\#define ENABLE_DEBUG\)#//\1<CR>
nmap ,d :e main.c<bar>%s#//\(while(i);\)# \1<CR>
"nmap ,n :b main<bar>%s#[^/]\(while(i);\)#//\1<CR>
nmap ,p ?PROTOTYPES<CR>
nmap ,v ?STATIC\\|GLOBAL<CR>
nmap ,t :e global.h<bar>/TEST<CR>
"nmap ,c :%s/\r//g<CR>
"nmap \bh i/*<ESC>73A=<ESC>o<C-W>==  @  @<CR>==<CR>==  DESC:<CR>==  USAGE:<CR>==  INPUTS:<CR>==  OUTPUTS:<CR>==  RETURN:<CR>==  IMP NOTE:<CR><ESC>73A=<ESC>a*/<ESC>=8k
"nmap \bi i/*<ESC>73A=<ESC>o<C-W>==  <CR><ESC>73A=<ESC>a*/<ESC>=1k
nmap \bh i/*=<ESC>74A=<ESC>o<C-W>==  @  @<CR>==<CR>==  DESC:<CR>==  USAGE:<CR>==  INPUTS:<CR>==  OUTPUTS:<CR>==  RETURN:<CR>==  IMP NOTE:<CR><ESC>75A=<ESC>a*/<ESC>=8k
nmap \bi i/*=<ESC>74A=<ESC>o<C-W>==  <CR><ESC>75A=<ESC>a*/<ESC>=1k
nmap \bj i/*+++++++++++++++++++++++++++++++++<  >++++++++++++++++++++++++++++++++*/<ESC>F<l
nmap \bk i// -------------------------------------------  //<ESC>==F-3l

"map <C-A-z> :source ~/kn/myscript/savePaper.vim
"//---------------------------------- title comment start //
"nmap ;/ i// --  -- //<esc>2F-hi
"single line
map // ^i//<esc>
map ,// :s/\/\///<CR>
"--,*--wrapping comment--"
"map ;; :s/^\(.*\)$/\/\* \1 \*\//<CR>
"map ,;; :s/^\([/(]\*\\|<!--\) \(.*\) \(\*[/)]\\|-->\)$/\2/<CR>
"--commentLine--"
abbr kns //--<kn start>--
abbr kne //--<kn end>--
cabbr knm mks! kn.vim
cabbr mc make clean
cabbr mm make
"abbr knp printk("%s:\r\n", __FILE__);<esc>F:
"abbr knp printk("(%X) \n",);<esc>2F"
abbr knp printf("(%d) \n");<esc>2F"
"change (p_xxx : sdfdksf) to (p_xxx => s_mgt0_xxx,
"cabbr vvv s/\(p_\)\([[:graph:]]*\).*/\1\2 => s_mgt0_\2,/g

"change (p_xxx : in std_xxx;) to (s_xxx : std_xxx)
cabbr vvw s/\(p_\)\([[:graph:]]*.*:\).*\(in\|out\)\(.*\)/signal s_\2\4/g
"change (signal s_xxx : saefsdf) to (p_xxx <= s_xxx)
cabbr vvsps s/.*\(s_\)\([[:graph:]]*\)\_s*:.*/p_\2 <= \1\2;/g
"change (p_xxx <= s_xxx) to (signal s_xxx : saefsdf)
cabbr vvsps s/.*\(s_\)\([[:graph:]]*\)\_s*:.*/s_\2 <= p_\2;/g
"change (sdfsd s_xxx) to (s_xxx <= (others => '0');
cabbr vvso0 s/.*\(s_[[:graph:]]*\).*/\1 <= (others => '0');
cabbr vvs0 s/.*\(s_[[:graph:]]*\).*/\1 <= '0';
"change from vhdl constant to c #define addr
"g /.*C_\([[:graph:]]*\).*:= X"\(.*\)".*/ s//#define \1 0x\2/g


"//---------------------------------- command abbreviation //
cabbr aa arg *c *h

"+++++++++++++++++++++++++ PROGRAMMING +++++++++++++++++++++++++++++
"===============================================================
"== Programming : make, error window, diff
"===============================================================
"use set makeprg=make xxx.Makefile to make custom Makefile
map <F7> <esc>:make -s debug<CR>
"map <F7> <esc>:make<CR>
map <c-F7> <esc> :call QFixToggle(0)<CR>
map <c-F5> <esc>:make run <CR>
map <F4> <esc>:cn <CR>
map <s-F4> <esc>:cl <CR>
map <F3> <esc>:copen<CR>/error<CR>
"see next diff
map <C-A-q> ]c<CR>
map <C-F11> :execute "vimgrep /" . expand("<cword>") . "/j *.c *.h *.cpp **/*.vhd" <Bar> cw<CR>
map <C-F12> :execute "lgrep " . expand("<cword>") . " *" <Bar> lopen<CR>
"forces (re)indentation of a block of code
"nmap <C-J> vip=
"//---------------------------------- mouse mapping start //
"double click
"nnoremap <2-LeftMouse> :exe "tag ". expand("<cword>")<CR>
"nnoremap <2-LeftMouse> :exe "/". expand("<cword>")<Bar>exe "normal mO"<CR>
"nnoremap <2-LeftMouse> :exe "/". expand("<cword>")<CR>
"nnoremap <RightMouse> <C-O>
"nnoremap <X2Mouse> <C-I>

"reference -- defintion of var
"[ x       #start from beginning of files
"] x       #start from current cursor position
"[ D       #display first macro definition
"list matches, and then select one to jump to (like global with a choice!)
map <C-F3> [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

"+++++++++++++++++++++++++ FUNCTION +++++++++++++++++++++++++++
"===============================================================
"== Function: Multiple Windows
"===============================================================
"window are count from left-right, top-down
"now we have 3 windows (two on top (1, 2), one bottom (3)
"nmap <C-L> :4wincmd w<CR>
"nmap <C-K> :3wincmd w<CR>
"nmap <C-J> :2wincmd w<CR>
"nmap <C-H> :1wincmd w<CR> "conflicts with toggle highlight
"if has('win32')
nmap <M-z> :call SwitchWin()<CR>
imap <M-z> <ESC>:call SwitchWin()<CR>
"else
"nmap <C-M-z> :call SwitchWin()<CR>
"imap <C-M-z> <ESC>:call SwitchWin()<CR>
"endif
nmap <C-z> :wincmd w<CR>
imap <C-z> <ESC>:wincmd w<CR>
"map + <C-w>+
"map - <C-w>-

"autocmd BufNewFile * call s:SetupBuffer()
"autocmd BufWinEnter *
"    \ if exists("b:doopenfold") |
"    \   unlet b:doopenfold |
"    \   exe "normal zv" |
"    \ endif

"let g:main_win = 1
"function! SwitchWin()
"   if g:main_win == "1"
"      :wincmd w
"   else
"      let g:main_win = 0
"   endif
"endfunction

function! SwitchWin()
    let l:winnr_index = winnr()
    "echo l:winnr_index
    if l:winnr_index > 1
    let l:winnr_index -= 1
    "echo l:winnr_index
    else
    "set winnr_index to max window open
    let l:winnr_index = winnr('$')
    endif
    exe l:winnr_index . "wincmd w"
endfunction

"===============================================================
"== Function: Quick Fix
"===============================================================
"command -bang -nargs=? QFix call QFixToggle(<bang>0)
function! QFixToggle(forced)
    if exists("g:qfix_win") && a:forced == 0
    cclose
    unlet g:qfix_win
    else
    copen 10
    let g:qfix_win = bufnr("$")
    endif
endfunction
"to force the window open, use ':QFix!' and the window will open or stay open


"===============================================================
"== Function: Home / End
"===============================================================
"<home> toggles between start of line and start of text
imap <khome> <home>
nmap <khome> <home>
"inoremap <silent> <home> <C-O>:call Home()<CR>
"nnoremap <silent> <home> :call Home()<CR>
imap <kend> <end>
nmap <kend> <end>
inoremap <silent> <end> <C-O>:call End()<CR>
nnoremap <silent> <end> :call End()<CR>

function! Home()
    let curcol = wincol()
    normal ^
    let newcol = wincol()
    if newcol == curcol
    normal 0
    endif
endfunction

"<end> goes to end of screen before end of line
function! End()
    let curcol = wincol()
    normal g$
    let newcol = wincol()
    if newcol == curcol
    normal $
    endif
    "The following is to work around issue for insert mode only.
    "normal g$ doesn't go to pos after last char when appropriate.
    "More details and patch here:
    "http://www.pixelbeat.org/patches/vim-7.0023-eol.diff
    if virtcol(".") == virtcol("$") - 1
    normal $
    endif
endfunction

"===============================================================
"== Function: Copy and Paste
"===============================================================
"cut/copy/paste
vnoremap <C-X> "+d
vnoremap <C-C> "+y
"nnoremap <C-V> "+gPl
nnoremap <C-V> "+gp
vnoremap <C-V> :<C-U>call Paste("v")<CR>
inoremap <C-V> <C-O>:call Paste("i")<CR>
"select all
map <c-a> <esc>ggVG

function! Paste(mode)
    if a:mode == "v"
    normal gv
    normal "+P
    normal l
    elseif a:mode == "i"
    set virtualedit=all
    normal `^"+gP
    let &virtualedit = ""
    endif
endfunction

"===============================================================
"== Function: MatchSpace & match after column 80
"===============================================================
"if has('win32')
"   nmap <silent> <M-S> <Esc>:call MatchSpace() <CR>
"else
   "nmap <silent> <C-M-S> <Esc>:call MatchSpace() <CR>
   nmap <silent> <M-F8> <Esc>:call MatchSpace() <CR>
"endif
"\ze sets end of match so only spaces highlighted
let g:ErrorMsg_on = 2
cabbr ssp /\s\+$\\| \+\ze\t<CR>
match ErrorMsg /\s\+$\| \+\ze\t /
"match ErrorMsg /\s\+$\| \+\ze\t \|\%>80v/
function! MatchSpace()
if g:ErrorMsg_on == "1"
	let g:ErrorMsg_on = 2
	echo "MatchSpace off"
	"match ErrorMsg /\%>80v.\+\ze/			"match > 80 column
	match Normal /\s\+$\| \+\ze\t \|\%>80v/
elseif g:ErrorMsg_on == "2"
	echo "MatchSpace on"
	let g:ErrorMsg_on = 1
	"match ErrorMsg /\s\+$\| \+\ze\t/		"match spaces
	match ErrorMsg /\s\+$\| \+\ze\t \|\%>80v/
else
	echo "MatchSpace off, Match 80 off"
	let g:ErrorMsg_on = 1
	match Normal /\s\+$\| \+\ze\t/
endif
endfunction

"===============================================================
"== Function: InsertTabWrapper
"===============================================================
function! InsertTabWrapper(direction)
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
    elseif "backward" == a:direction
    return "\<c-p>"
    else
    return "\<c-n>"
    endif
endfunction

"===============================================================
"== Function: No Mapping Required
"===============================================================
"find local variable(gd), global(gD), or function (:tag)
"function! GoDefinition()
"    let pos = getpos(".")
"    normal! gd
"    if getpos(".") == pos
"    exe "tag " . expand("<cword>")
"    endif
"endfunction
"nnoremap <C-]> :call GoDefinition()<CR>

if &diff
    "I'm only interested in diff colours
    syntax off
endif

if has("autocmd")
    " When editing a file, always jump to the last cursor position
    autocmd BufReadPost *
        \ if line("'\"") > 0 && line ("'\"") <= line("$") |
        \   exe "normal g'\"" |
        \ endif
endif

" ==================================================================
" Function: Diff on/off - Scroll Binding
" ==================================================================
let g:diff_on = 0
let g:scroll_bind = 0
nmap <F12> :call MyToggleDiff()<CR>
nmap <S-F12> :call MyToglleScrollBind()<CR>

function! MySetDiffEnviron()
    set diff
    set scrollbind
    set scrollopt=ver,jump,hor
    set nowrap
    set fdm=diff
endfunction
:command! MySetDiffEnviron call MySetDiffEnviron()

" Switch off diff-mode of all currently open windows.
command! MyDiffOff call MyDiffOff()
function! MyDiffOff()
    windo set nodiff
    windo set noscrollbind
    " Reset, then restore the 'foldmethod' and 'foldcolumn' settings by
    " re-setting the filetype. This triggers the filetype-based folding to be
    " reactivated, and ( contrary to a simple :e!) works even on modified
    " buffers.
    windo set foldmethod=manual
    windo set foldcolumn=0
    windo unlet! b:did_ftplugin | let &filetype = &filetype
endfunction

function! MyToggleDiff()
    if g:diff_on == "1"
    call MyDiffOff()
    call SwitchWin()
    call MyDiffOff()
    call SwitchWin()
    let g:diff_on=0
    else
    call MySetDiffEnviron()
    call SwitchWin()
    call MySetDiffEnviron()
    call SwitchWin()
    let g:diff_on=1
    endif
endfunction
"-----
function! MySetScrollBind()
    set scrollbind
    set scrollopt=ver,jump,hor
    set nowrap
endfunction

function! MySetScrollNoBind()
    set noscrollbind
endfunction

function! MyToglleScrollBind()
    if g:scroll_bind == "1"
    call MySetScrollNoBind()
    call SwitchWin()
    call MySetScrollNoBind()
    call SwitchWin()
    let g:scroll_bind = 0
    else
    call MySetScrollBind()
    call SwitchWin()
    call MySetScrollBind()
    call SwitchWin()
    let g:scroll_bind = 1
    endif
endfunction

"===============================================================
"== Function: toggle line break
"===============================================================
nmap <C-M-T> :call MyToglleScrollBind()<CR>
let g:line_break_on = "1"
function! MyToglleScrollBind()
    if g:line_break_on == "1"
		let g:line_break_on = "0"
		set fo-=t
		set fo-=a
		set fo+=l
		echo "linebreak off"
	else
		set fo+=a
		set fo+=t
		set fo-=l
		let g:line_break_on = "1"
		echo "linebreak on"
	endif
endfunction
"===============================================================
"== Function: GUI FONT
"===============================================================
"nmap <C-M-f> :set guifont=Fixedsys:h9:cGB2312<CR>
"guifont
if has("gui_running")
    if has("gui_gtk2")
    ":set guifont=Luxi\ Mono\ 12
    set guifont=Monospace\ 10
    elseif has("x11")
    " Also for GTK 1
    ":set guifont=*-lucidatypewriter-medium-r-normal-*-*-180-*-*-m-*-*
    elseif has("gui_win32")
    "set guifont=Courier_New:h10:cANSI
    ":set guifont=Fixedsys:h9:cGB2312
    endif
endif

"===============================================================
"== Function: windo / bufdo
"===============================================================
"Usage::Windo set nu
" Just like windo, but restore the current window when done.
function! WinDo(command)
  let currwin=winnr()
  execute 'windo ' . a:command
  execute currwin . 'wincmd w'
endfunction
" Just like Windo, but disable all autocommands for super fast processing.
com! -nargs=+ -complete=command Windofast noautocmd call WinDo(<q-args>)

" Just like bufdo, but restore the current buffer when done.
function! BufDo(command)
  let currBuff=bufnr("%")
  execute 'bufdo ' . a:command
  execute 'buffer ' . currBuff
endfunction
com! -nargs=+ -complete=command Bufdo call BufDo(<q-args>)

"===============================================================
"== Function: Show current function name
"===============================================================
fun! ShowFuncName()
  let lnum = line(".")
  let col = col(".")
  echohl ModeMsg
  echo getline(search("^[^ \t#/]\\{2}.*[^:]\s*$", 'bW'))
  echohl None
  call search("\\%" . lnum . "l" . "\\%" . col . "c")
endfun
map ,g :call ShowFuncName() <CR>

fun! FunctionName()
    "set a mark at our current position
    normal mz
    "while foundcontrol == 1, keep looking up the line to find something that
    "isn't a control statement
    "find the previous '{' and get the line above it
    "if the line matches a control statement, set found control to 1 so
    "we can look farther back in the file for the beginning of the
    "actual function we are in
    let foundstr = ""
    let strArrow = ""
    let strList = ["while", "for", "if", "else", "try", "catch", "case", "switch"]
    let foundcontrol = 1
    while (foundcontrol)
		"find the { in this {...}
		normal [{
        let tempstring = getline(".")
        if(match(tempstring,")") < 0)
           "{ is on a new line itself, e.g. not function(){
           normal k0
           let tempstring = getline(".")
        endif
        let foundcontrol = 0
        for item in strList
            let foundstridx=match(tempstring,item)
            if(foundstridx >= 0)
                let foundstr = strpart(tempstring, foundstridx, 30) . strArrow . foundstr
                let tempstring = ""
                let strArrow = " @@@ "
                let foundcontrol = 1
                break
            endif
        endfor
        if (foundcontrol == 0)
            let foundstridx = match(tempstring, "(")
            if(foundstridx >= 0)
            "we may found a function
            "go back to where our original cursor located
                normal `z
                let tempstring = tempstring . strArrow . foundstr
                return tempstring
            else
            "may not be a function, just a inner block here
                let foundcontrol=1
            endif
        endif
    endwhile
    return tempstring
endfun

"this mapping assigns a variable to be the name of the function found by
"FunctionName() then echoes it back so it isn't erased if Vim shifts your
"location on screen returning to the line you started from in FunctionName()
"nmap \func :let name = FunctionName()<CR> :echo name<CR>
"if has ("win32")
nmap <C-M-n> :let name = FunctionName()<CR> :echo name<CR>
"else
"nmap <C-A-N> :let name = FunctionName()<CR> :echo name<CR>
"endif

"===============================================================
"== Function: Folding the whole function
"===============================================================
function! FoldBrace()
  if getline(v:lnum+1)[0] == '{'
    return '>1'
  endif
  if getline(v:lnum)[0] == '}'
    return '<1'
  endif
  return foldlevel(v:lnum-1)
endfunction
"original foldexpr=0
">1: a fold with this level ends at this line
"<1: a fold with this level starts at this line
"set foldexpr=FoldBrace()
"set foldexpr=0;
"original foldmethod=manual
"set foldmethod=expr
"set foldmethod=manual
"set foldmethod=syntax

nmap \fff :call KnFold()<CR>
function! KnFold()
   set foldexpr=FoldBrace()
   set foldmethod=syntax
   execute "normal zM"
endfunction
"
"===============================================================
"== Function: Folding inside the function [knng]
"== Desc: fold {..} inside a function, but not the function itself
"== Usage: execute "normal vi}" at the most outer {..},
"==        then :'<,'> call FoldInside()
"== NOTE: a:firstline, set "W" flag so search not wrapping
"== NOTE: za/zA to toggle fold, zn to open all, zM close all
"===============================================================
function! FoldInside() range
   let y=search("{","W")
   while y <= a:lastline
      execute "normal zfa}"
      let y=search("{","W")
      if y == 0
         "no more { found, for last function in the file
         return
      endif
   endwhile
endfunction

vmap <C-A-F> :call FoldInside()<CR>
"===============================================================
"== Function: Search visually
"===============================================================
"[+Shift+i
"to go to Nth search result, n+[+Tab
nmap <silent>[I :<C-u>cal OSearch("nl")<CR>
nmap <silent>[<Tab> :<C-u>cal OSearch("nj")<CR>
vmap <silent>[I :<C-u>cal OSearch("vl")<CR>
vmap <silent>[<Tab> :<C-u>cal OSearch("vj")<CR>

function! OSearch(action)
  let c = v:count1
  if a:action[0] == "n"
    let s = "/\\<".expand("<cword>")."\\>/"
  elseif a:action[0] == "v"
    execute "normal! gvy"
    let s = "/\\V".substitute(escape(@@, "/\\"), "\n", "\\\\n", "g")."/"
    let diff = (line2byte("'>") + col("'>")) - (line2byte("'<") + col("'<"))
  endif
  if a:action[1] == "l"
    try
      execute "ilist! ".s
    catch
      if a:action[0] == "v"
        normal! gv
      endif
      return ""
    endtry
    let c = input("Go to: ")
    if c !~ "^[1-9]\\d*$"
      if a:action[0] == "v"
        normal! gv
      endif
      return ""
    endif
  endif
  let v:errmsg = ""
  silent! execute "ijump! ".c." ".s
  if v:errmsg == ""
    if a:action[0] == "v"
      " Initial version
      " execute "normal! ".visualmode().diff."\<Space>"
      " Bug fixfor single character visual [<Tab>:
      if diff
        execute "normal! ".visualmode().diff."\<Space>"
      else
        execute "normal! ".visualmode()
      endif
    endif
  elseif a:action[0] == "v"
    normal! gv
  endif
endfunction

"===============================================================
"== Function: Search visually (* or #)
"===============================================================
" From an idea by Michael Naumann
function! VisualSearch(direction) range
  let l:saved_reg = @"
  execute "normal! vgvy"
  let l:pattern = escape(@", '\\/.*$^~[]')
  let l:pattern = substitute(l:pattern, "\n$", "", "")
  if a:direction == 'b'
    execute "normal ?" . l:pattern . "^M"
  else
    execute "normal /" . l:pattern . "^M"
  endif
  let @/ = l:pattern
  let @" = l:saved_reg
endfunction

"Basically you press * or # to search for the current selection !! Really useful
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>

"===============================================================
"== Function: repeat repetitive task in a smart way
"===============================================================
"generate 2 lines in same pattern
function! RepeatSmart2()
	let l:mylinenum = 0
	let l:startnum = 0
	let l:bit_start = 0
	let l:bit_end = bit_start+7
	let l:loopend= 66
	"totalsetline = total of setline() called
	let l:totalsetline = 1
	while l:startnum < l:loopend
		let l:mytext = "when C_RUNTIME_MSSID" . startnum . " =>"
		"let l:mytext2 = "p_mBssId(".bit_end. " downto " .bit_start. ") <= s_mib_reg(_RUNTIME_MBSSID".mylinenum.");"
		"let l:mytext2 = "when C_REMOTE_A_CWMIN" . startnum . " => p_mcu_dout <= s_a_cwmin(". bit_end." downto " . bit_start.");"
		"let l:mytext2 = "when C_REMOTE_A_CWMAX" . startnum . " => s_a_cwmax(". bit_end." downto " . bit_start.") <= s_a_cwmin;"
		let l:mytext3 = mylinenum + 0
		"call setline(mylinenum, l:mytext)
		"call setline(mylinenum+1, l:mytext2)
		let l:mytext2 = printf("%x", l:mytext3)
		call setline(mylinenum+1, l:mytext2)
		let l:mylinenum = mylinenum + totalsetline
		let l:bit_start = bit_end+1
		let l:bit_end = bit_end+8
		let l:startnum = startnum + 1
	endwhile
endfunction

"===============================================================
"== Function: VHDL related functions
"===============================================================
function! ChangeVHDLConstantToDefine()
	"constant C_DOxx  := X"00"; (change to =>) #define XA_ADDRESS0 0x00
	%s/constant//g
	%s/:.*:\=X"/0x/g
	%s/";//g
	%s/^.* C_/#define XA_/g
	%s#--#//--#g
endfunction

"===============================================================
"== Function: search partially (ignore the prefix and search for the word)
"===============================================================
"e.g. p_xxx , s_xxx ==> search xxx instead
function! PartialSearch()
	let l:wordUnderCursor = expand("<cword>")
	let l:wordToSearch = strpart(l:wordUnderCursor, stridx(wordUnderCursor, "_")+1)
	let @/=l:wordToSearch
	exe "normal n"
	"cursor(search(l:wordToSearch))
	"echo "PartialSearch wordToSearch=" .l:wordToSearch
endfunction

nmap ,nn :call PartialSearch()<CR>

"===============================================================
"== Function: Formatting
"===============================================================
":[range]ce[nter] [width]     center lines     :.,+3 center 80
":[range]ri[ght] [width]     right alignment     :% right
":[range]le[ft] [indent]     left alignment.(Unit of identation is space)     :left 4

"put cursor after "(" of above line, for use in long function
function! GotoBrace()
   let start = line(".") - 1
   let afBraceCol = match(getline(start), '(') + 1
   "echo afBraceCol . " start=" . start
   execute "left" . afBraceCol
endfunction

"imap <c-tab> <Esc>:call GotoBrace()<CR>a
"===============================================================
"== Function: Replace string
"===============================================================
function! Replacestr()
    "e - don't issue error when search not found
    execute "%s/String/char */ge"
    execute "%s/Uint32/unsigned int/ge"
    execute "%s/Uint16/unsigned short/ge"
    execute "%s/Int/int/ge"
    execute "%s/Void/void/ge"
    execute "%s/Ptr/void */ge"
    execute "%s/Uns/unsigned int/ge"
endfunction


"===============================================================
"== Function: Vimgrep with user key-in word
"===============================================================
function! Vgrep()
    let m = inputdialog("search term")
    if m != ""
        exec "vimgrep /" . m . "/j %"
        exec "cw"
    endif
endfunction

cabbrev vg call Vgrep()

function! Vgrep_with_userInput()
    let m = inputdialog("search term")
    if m != ""
        exec "vimgrep /" . m . "/j *.c *.h *.cpp **/*.vhd"
        exec "cw"
    endif
endfunction
nmap <A-F11> <Esc>:call Vgrep_with_userInput()<CR>

"===============================================================
"== Function: user input new string to replace the word under cursor
"===============================================================
function! Replace_GUI()
	let newStr=inputdialog("new string to replace word under cursor")
	if newStr != ""
		exec "%s/".expand("<cword>")."/".newStr."/gc"
	endif
endfunction
nmap <A-F12> <Esc>:call Replace_GUI()<CR>

"===============================================================
"== Function: replace a list of item with similar prefix
"===============================================================
function! Replace_prefix() range
	let lineNr = a:firstline
	while (lineNr != a:lastline)
		let words = split(getline(lineNr), '\W\+')
		"echo "[". lineNr. "]word is " . words[1]
		exe "%s/" . words[1]. "\\>/XA_" . words[1]. "/gc"
		let lineNr = lineNr + 1
	endwhile
endfunction

"===============================================================
"== Function: convert symbian .dm file to .sis file
"===============================================================
function! DmToSis()
	:1, 4 d
	:$ d
	:w
	:bw
endfunction

"===============================================================
"== Function: save global search to register g
"===============================================================
function! SaveSearch(...)
	"let list_len = len(a:000)
	" note: a:0=len(a:000)
	let list_len = a:0
	let str=""
	if list_len !=0
		" if argument lis is not empty
		let str=a:1
	else
		let str=expand("<cword>")
	endif
	" clear register g
	let @g=""
	" redirect global search output to register g
	exe "redir @g>>"
	exe "g /". str
	exe "redir END"
	" open a new buffer
	exe "new"
	" set this buffer attribute
	setlocal buftype=nofile
	setlocal bufhidden=wipe
	setlocal noswapfile
	setlocal nobuflisted
	" paste the content of register g
	exe "put g"
endfunction


"===============================================================
"== autocompletion for c programming
"===============================================================
"autocmd InsertEnter * call MyC_complete()
"autocmd CursorMovedI * call MyC_complete()
"let @b=""
"let g:curtext="init"
"let g:curword="init"
"function! MyC_complete()
"	let curtext = strpart(getline('.'), 0, col('.') - 1)
"	let curword = matchstr(curtext, '\k*$')
"	let @b=@b."a..".curword.curtext."=="
"endfunction
"+++++++++++++++++++++++++ PLUGIN MAPPING ++++++++++++++++++++++++++
"===============================================================
"== Plugin: Trinity
"===============================================================
nmap <F8>   :TrinityToggleAll<CR>
nmap <F9>   :TrinityToggleSourceExplorer<CR>
"nmap <F10>  :TrinityToggleTagList<CR>
nmap <F11>  :TrinityToggleNERDTree<CR>
" // Set the window height of Source Explorer
let g:SrcExpl_winHeight = 8
" // Set 100 ms for refreshing the Source Explorer
let g:SrcExpl_refreshTime = 100
" // Let the Source Explorer update the tags file when opening
let g:SrcExpl_updateTags = 0
" // Set "Enter" key to jump into the exact definition context
let g:SrcExpl_jumpKey = "<ENTER>"
" // Set "Space" key for back from the definition context
let g:SrcExpl_gobackKey = "<SPACE>"
" // In order to Avoid conflicts, the Source Explorer should know what plugins
" // are using buffers. And you need add their bufname into the list below
" // according to the command ":buffers!"
let g:SrcExpl_pluginList = [
        \ "__Tag_List__",
        \ "_NERD_tree_",
        \ "Source_Explorer"
        \ ]
" // Enable or disable local definition searching, and note that this is not
" // guaranteed to work, the Source Explorer does not check the syntax for now,
" // it only searches for a match with the keyword according to command 'gd'.
let g:SrcExpl_searchLocalDef = 1
" // Do not let the Source Explorer update the tags file when opening          "
let g:SrcExpl_isUpdateTags = 1
" // Use program 'ctags' with argument '--sort=foldcase -R' to create or       "
" // update a tags file                                                        "
 let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ."
" // Set "<F12>" key for updating the tags file artificially                   "
" let g:SrcExpl_updateTagsKey = "<S-F11>"
map <S-F11> :call g:SrcExpl_UpdateTags()<CR>
"===============================================================
"== Plugin: Cscope
"== generate cscope.out: cscope -b -q -k -R
"===============================================================
if has("cscope")
    set csprg=/usr/bin/cscope
	if has("win32")
		set csprg=C:\WINDOWS\cscope
	endif
    set csto=0
    set cst
    set nocsverb
    " add any database in current directory
    if filereadable("cscope.out")
    cs add cscope.out
    " else add database pointed to by environment
    elseif $CSCOPE_DB != ""
    cs add $CSCOPE_DB
    endif
    set csverb
endif

"set cscopequickfix=s-,c-,d-,i-,t-,e-
nmap ,csa :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap ,csg :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap ,csc :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap ,cst :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap ,cse :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap ,csf :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap ,csi :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap ,csd :cs find d <C-R>=expand("<cword>")<CR><CR>
"0 or s: Find this C symbol
"1 or g: Find this definition
"2 or d: Find functions called by this function
"3 or c: Find functions calling this function
"4 or t: Find this text string
"6 or e: Find this egrep pattern
"7 or f: Find this file
"8 or i: Find files #including this file
nmap <C-Space>s :scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>g :scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>c :scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>t :scs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>e :scs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-Space>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-Space>d :scs find d <C-R>=expand("<cword>")<CR><CR>

"===============================================================
"== Plugin: Minibuffer
"===============================================================
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

"===============================================================
"== Plugin: 2html
"===============================================================
let html_use_css = 1

"===============================================================
"== Plugin: TTrCodeAssistor.vim
"===============================================================
let g:curBuf = bufnr("$")
let g:prevBuf = bufnr("$")
function! BufExplorerMy()
   if (g:curBuf != bufnr("%"))
      let g:prevBuf = g:curBuf
      "let g:curBuf=bufnr("%")
   endif
   "echo "curBuf=" g:curBuf "; prevBuf=" g:prevBuf
   :BufExplorer
endfunction

function! SwitchPrevBuf()
   if (g:curBuf != bufnr("%"))
      let g:prevBuf = g:curBuf
      let g:curBuf=bufnr("%")
   endif
   exec "buffer" g:prevBuf
   "echo "curBuf=" g:curBuf "; prevBuf=" g:prevBuf
endfunction

"if has ("win32")
   nmap <A-o> :call BufExplorerMy()<CR>
   "nmap <A-p> :exec "buffer" g:prevBuf<CR>
   nnoremap <A-n> :call SwitchPrevBuf()<CR>
"else
"   nmap <c-A-o> :call BufExplorerMy()<CR>
"   nmap <c-A-p> :call SwitchPrevBuf()<CR>
"endif

"===============================================================
"== Plugin: bufexplr
"===============================================================
let g:TTrCodeAssistor_AutoStart=1

"===============================================================
"== Plugin: YankRing
"===============================================================
"Alt-< and Alt->
let g:yankring_replace_n_pkey = '<Char-172>'
let g:yankring_replace_n_nkey = '<Char-174>'
nmap <A-y> :YRShow<CR>

"===============================================================
"== Plugin: omnicppcomplete
"===============================================================
"cabbr gctags :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q *.c *.cpp *.h<CR>
cabbr gtag :!ctags -R *.c *.cpp *.h<CR>
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 0 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
"au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest

"===============================================================
"== Plugin: Bgrep
"===============================================================
map <A-F9> :execute "Bgrep /" . expand("<cword>") . "/" <CR>

"===============================================================
"== Plugin: YRShow
"===============================================================
"a to toggle autoclose of YRShow window;
nnoremap <silent> <F10> :YRShow<CR>

"===============================================================
"== Miscellaneous substitution
"===============================================================
nmap ,rs :%s/\_s*$//g

"+++++++++++++++++++++++++ colorscheme ++++++++++++++++++++++++++
"map <leader>3 :set syntax=python<cr>
"map <leader>4 :set ft=javascript<cr>
"map <leader>$ :syntax sync fromstart<cr>
nmap \1 :set ft=vhdl<CR>
"===============================================================
"== OS specific
"===============================================================
"if has("gui_running")
if has ("win32")
    "set backupdir = c:/Program\ Files/vim/backup
    "set backupdir=/home/insidepower/Documents
    nmap ,s :source $VIM\_vimrc<cr>
    if v:version >= 702
	let g:mydir=expand("%:p:h")
    "colorscheme inkpot
    "colorscheme torte
    "colorscheme koehler
    set tags+=..\tags,..\..\tags,..\..\..\tags,..\..\..\..\tags,..\..\..\..\..\tags
    endif
else
    "autoload plugin directory
    "runtime! ~/here_software/vim/*.vim
    set runtimepath+=/root/.vim/,~/confignewpc/myvim
	"no need to set doc or colors director, only main dir need to set
	"set rtp+=~/confignewpc/myvim/doc,~/confignewpc/myvim/colors
	set rtp+=~/confignewpc/myvim/colors
    set path=$PWD/**   "where gf will look for"
    "--set tag to search current dir (and upto 4 level depth) then the /usr/include
    let $kernel_version=system('uname -r | tr -d "\n"')
    "set tags=./tags,tags,../tags,../../tags,../../../tags,../../../../tags,/lib/modules/$kernel_version/build/tags,/usr/include/tags,/media/f20GB/dsplink_1_60/dsplink/dsp/tags
    set tags=./tags,../tags,../../tags,../../../tags,../../../../tags,
	set tags+=../../../../../tags
	set tags+=~/tags,/lib/modules/$kernel_version/build/tags,/usr/include/tags
    "set tags+=$DSPLINK/**/tags
    "//---------------------------------- set colorscheme start //
    if &term =~ "xterm"
    if has("terminfo")
        set t_Co=256
    else
        set t_Co=8
        set t_Sf=<Esc>[3%dm
        set t_Sb=<Esc>[4%dm
    endif
    "colorscheme slate
    "colorscheme murphy
    "colorscheme koehler
     "colorscheme evening
    "hi CursorLine guibg=black
    else
    "colorscheme inkpot
    "colorscheme murphy
    "colorscheme koehler
    "colorscheme evening
    set cursorline
    "hi CursorLine term=standout ctermfg=7 ctermbg=8 guifg=grey40 guibg=black
    "hi CursorLine guibg=black
    endif
    "//---------------------------------- set colorscheme end //
    "if $myos == "ubuntu"
    "note: export myos=ubuntu
    "nmap ,e :e ~/.vimrc<cr>
    "nmap ,s :source ~/.vimrc<cr>
    "else
    "nmap ,s :source /root/.vimrc<cr>
    nmap ,s :source ~/.vimrc <cr>
    "endif
endif

"colorscheme mycolor
colorscheme ir_black
"+++++++++++++++++++++++++ Reference ++++++++++++++++++++++++++
"===============================================================
"== Reference MY
"===============================================================
"mapping --
":verbose map <key>    "determined key map in plugin or script
":verbose map ,         "list all the key map start with ,
"
"use <Ctrl-V> to escape following control char, e.g. <ctrl-v><ctrl-K>
"some common control key mapping
"Ctrl-I (Tab) ; Ctrl-[  (Esc) ; Ctrl-M (Enter) ; Ctrl-H (Backspace)
"in Unix, C-s and C-Q are used for terminal flow control. vim may not receive.
"
"to move 5 char to the right
"nnoremap <F7> 5l   "2<F7> will move 25 char to right, as 2 prepend "25"l
"=<expr for reg content>, @ to exec the reg, a count before n@
"nnoremap <F7> @='5l'<CR> "2<F7> will move only 10 chars to right
"C-v to esc ctr sequence (insert # at start of line and move 1 line down)
"nnoremap <F4> @='I#<C-V><Esc>j'<CR>
"after j will not have count, as it is outside =''
"nnoremap <F4> @='I#<C-V><Esc>'<CR>j
"
"multiple Ex commands separated by "\|" <bar> in the Ex command
"global use | as part of the command, so echo will exec. for every replacement
":g/foo/s/abc/xyz/g | echo 'Completed substitution'
"now echo will be only executed once
":exe 'g/foo/s/abc/xyz/ge' | echo 'Completed substitution'

"buffer local mapping
"map <buffer>
"nnoremap <buffer> <F3> :make <CR>

"to invoke script local function (s:MyLocalFunc), use <SID>.
"<expr> to get the return value from the InsertFunc
"inoremap <expr> <F5> <SID>InsertFunc()

"let mapleader="_"   "replace <leader> with _, default is \
"<unique> to check if a particular mapping has been defined
":nnoremap <unique> \s :set invokehlsearch<CR>
"<plug> to ask user to define a map for the function
"noremap <unique> <Plug>ScriptFunc :call <SID>VimScriptFn()<CR>
"user should map within
":nmap <F5> <Plug>ScriptFunc

"create a chain map (maparg return {rhs} or <Tab>)
":exe 'nnoremap <Tab> ==' . maparg('<Tab>', 'n')

"zL                    "scroll to Right(motion key H:left, L:right)
"vi" va" vi{ va{        "select "..." and within {...}
"A ==# 'v'            "case sensitive, == is not case sensitive
"b~             "make first char of current word uppercase

":%s/\s*$//            "remove blank space at eol
"gvim 'grep -1 'myFunc' *.c' "-l: list the file that contains myFunc
":args 'grep -l 'myFunc' *.c' "use this inside gvim
":grep searchTerm *.c        "find searchTerm in all C, use :cnext to go
"$man ls | ul -i |gvim -    "ul -i remove hard to read command

"----plugin note---
