" Havoc VIM highlighter (right-aligned) | Spencer Tipping
" Licensed under the terms of the MIT source code license

" Language:   Havoc
" Maintainer: Spencer Tipping <spencer@spencertipping.com>

" NOTE: Don't use this. It's useless. I was experimenting with having Havoc be a right-aligned language, but it's really counterintuitive and of questionable utility.

if exists("main_syntax") && exists("b:current_syntax")
  finish
endif

let main_syntax = 'havoc'

syn sync minlines=5
syn case match
setlocal iskeyword=33-39,42-43,45-127

" High-level lexer concerns:
syn match   havoc_line_comment  /^.*?[A-Z|] *\//

hi link havoc_line_comment      Comment

" Havoc literate programming stuff, mostly taken from SDoc but adapted for right-to-left:
syn region  sd_block_comment    start=/\(^$\n^\|\%^\).*[A-Z\|]\( -\)\?\s*$/ end=/^\s*$\|\%$/ contains=sd_coerce_sdoc,sd_heading,sd_name_author keepend
syn match   sd_heading          /\(^$\n^\|\%^\)\s*.\{,60\}[A-Z] -$/ contained
syn match   sd_coerce_sdoc      /^\s*|\($\|\s\)/ contained
syn match   sd_name_author      /\%^.*$/ contained contains=sd_author_delimiter
syn match   sd_author_delimiter /|/ contained

hi link sd_block_comment        Comment
hi link sd_heading              PreProc
hi link sd_coerce_sdoc          PreProc
hi link sd_preprocessor         Special
hi link sd_name_author          Special
hi link sd_author_delimiter     SpecialKey

set rightleft revins

inoremap <Backspace> <Delete>
inoremap <Delete> <Backspace>
noremap <Home> <End>
noremap <End> <Home>
inoremap <Home> <End>
inoremap <End> <Home>
noremap A ^i
noremap i A
