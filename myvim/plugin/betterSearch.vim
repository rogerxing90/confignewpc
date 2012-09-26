" ============================================================================
" File:        betterSearch.vim
" Description: provide better search functionality in vim
" Maintainer:  Ng Khian Nam
" Last Change: 24 September 2012
" License:     We grant permission to use, copy modify, distribute, and sell this
"              software for any purpose without fee, provided that the above copyright
"              notice and this text are not removed. We make no guarantee about the
"              suitability of this software for any purpose and we are not liable
"              for any damages resulting from its use. Further, we are under no
"              obligation to maintain or extend this software. It is provided on an
"              "as is" basis without any expressed or implied warranty.
" ============================================================================
let s:betterSearch_version = '0.0.1'

" initialization {{{

if exists('loaded_BetterSearch')
    finish
endif
let loaded_BetterSearch = 1
let s:next_buf_number = 1
let s:content_window_nr = 0
let s:isHighlightOn = 1
let s:pattern_name = ['String', 'Number', 'Function', 'Keyword', 'Directory', 'Type', 'rubyRegexpDelimiter', 'PmenuSel', 'MatchParen', 'rubyStringDelimiter', 'javaDocSeeTag']
" content window and search window mapping, for the use of switching between 
" window
let s:win_mapping = {}

" === command === "
command! -n=0 -bar BetterSearchPromptOn :call s:BetterSearchPrompt()
command! -n=0 -bar BetterSearchVisualSelect :exe "normal! gvy" <CR> :call s:BetterSearch("<C-R>"")
command! -n=0 -bar BetterSearchSwitchWin :call s:SwitchBetweenWin()
command! -n=1 -bar BetterSearchHighlightLimit :let g:BetterSearchTotalLine=<args>

function s:SetDefaultVariable(name, default)
    if !exists(a:name)
        let {a:name} = a:default
    endif
endfunction

call s:SetDefaultVariable("g:BetterSearchMapHelp", "?")
call s:SetDefaultVariable("g:BetterSearchMapHighlightSearch", "h")
call s:SetDefaultVariable("g:BetterSearchTotalLine", 5000)

" }}}

" function {{{
function s:SwitchBetweenWin()
    let s:current_buf_nr = bufnr("")
    if has_key(s:win_mapping, s:current_buf_nr)
        let l:jump_win = bufwinnr(s:win_mapping[s:current_buf_nr])
        exe l:jump_win."wincmd w"
    else
        echo "buffer ".s:current_buf_nr." not found"
    endif
endfunction

function s:SwitchPrevWin()
    let l:winnr_index = winnr()
    if l:winnr_index > 1
        let l:winnr_index -= 1
    else
        let l:winnr_index = winnr('$')
    endif
    exe l:winnr_index . "wincmd w"
endfunction


function s:GoToLine()
    let lineNum = matchstr(getline("."), '^ *[[:digit:]]\+')
    if lineNum != ""
        call s:SwitchPrevWin()
        exe ":".lineNum
    endif
endfunction

function s:BetterSearchBindMapping()
    nnoremap <silent> <buffer> <2-leftmouse> :call s:GoToLine()<cr>
    exec "nnoremap <silent> <buffer> <cr> :call <SID>GoToLine()<cr>"
    exec "nnoremap <silent> <buffer> ". g:BetterSearchMapHelp ." :call s:displayHelp()<cr>"
    exec "nnoremap <silent> <buffer> ". g:BetterSearchMapHighlightSearch ." :call s:HighlightSearchWord()<cr>"
endfunction

function s:BetterSearchHelp()

endfunction


function s:HighlightSearchWord()
    "syn match search1
    let s:isHighlightOn = !s:isHighlightOn
endfunction


function s:BetterSearchSyntaxHighlight(search_token)
    let l:index = 0
    if s:isHighlightOn && (line('$') < g:BetterSearchTotalLine)
        while index < len(a:search_token)
            if (index < len(s:pattern_name))
                execute "syn match search_word".index. " #". a:search_token[index] ."#"
                execute "hi def link search_word".index. " ".s:pattern_name[index]
                let l:index = l:index + 1
            endif
        endwhile
    endif
endfunction

function s:BetterSearch(...)
	"let list_len = len(a:000)
	" note: a:0=len(a:000)
	let list_len = a:0
	let str=""
	let cur_line = line(".")
	if list_len !=0
		" if argument list is not empty
        if ( match(a:1, "|"))
            let str = ""
            let ori_str = a:1
            let l:search_token = []
            for myword in split(a:1, '|')
                call add(l:search_token, myword)
                if (str!="")
                    let str = str.'\|'.myword
                else
                    let str = myword
                endif
                "echom "str is ". str
            endfor
        else
		    let str=a:1
        endif
        let @+=a:1
        "echo "search term ".str
	else
		let str=expand("<cword>")
	endif
	" clear register g
	let @g="search term: \n". ori_str."\n\n"
	" redirect global search output to register g
	silent exe "redir @g>>"
	silent exe "g /". str
	silent exe "redir END"
    if ( list_len == 2)
        call cursor(a:2, 1)
    else
        let s:content_window_nr = bufnr("")
        let s:next_buf_number += 1
        " open a new buffer
        exe "new BetterSearch". s:next_buf_number
        " set this buffer attribute
        setlocal buftype=nofile
        setlocal bufhidden=wipe
        setlocal noswapfile
        setlocal nobuflisted
        call s:BetterSearchBindMapping()
        let s:win_mapping[s:content_window_nr]=bufnr("")
        let s:win_mapping[bufnr("")]=s:content_window_nr

    endif
    " paste the content of register g
    exe "1put g"
    " ---- syntax highlight ----
    call s:BetterSearchSyntaxHighlight(l:search_token)
    setlocal nomodifiable
endfunction


function s:BetterSearchPrompt()
	let mm = inputdialog("search term", "", "cancel pressed")
    if mm != "" && mm != "cancel pressed"
        :exe s:BetterSearch(mm)
        :let @"=mm
    else
        if mm != "cancel pressed"
            echo "m is ". mm
            :exe s:BetterSearch(expand("<cword>"))
        endif
    endif
endfunction
" }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                                              "
" vim:foldmethod=marker:tabstop=4
"                                                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

