" Havoc VIM highlighter | Spencer Tipping
" Licensed under the terms of the MIT source code license

" Language:   Havoc
" Maintainer: Spencer Tipping <spencer@spencertipping.com>

if exists("main_syntax") && exists("b:current_syntax")
  finish
endif

let main_syntax = 'havoc'

syn sync minlines=5
syn case match
setlocal iskeyword=33-39,42-43,45-127

" High-level lexer concerns:
syn match   havoc_line_comment  /\/ *[A-Z\|].*$/

hi link havoc_line_comment      Comment

" Havoc literate programming stuff, mostly taken from SDoc:
syn region  sd_block_comment    start=/\(^$\n^\|\%^\)\s*[A-Z\|]/ end=/^\s*$\|\%$/ contains=sd_coerce_sdoc,sd_heading,sd_name_author keepend
syn match   sd_heading          /\(^$\n^\|\%^\)\s*[A-Z].\{,60\}\.$/ contained
syn match   sd_coerce_sdoc      /^\s*|\(\s\|$\)/ contained
syn match   sd_preprocessor     /^\s*-\s\+\w\+.*$/
syn match   sd_name_author      /\%^.*$/ contained contains=sd_author_delimiter
syn match   sd_author_delimiter /|/ contained

hi link sd_block_comment        Comment
hi link sd_heading              PreProc
hi link sd_coerce_sdoc          PreProc
hi link sd_preprocessor         Special
hi link sd_name_author          Special
hi link sd_author_delimiter     SpecialKey
