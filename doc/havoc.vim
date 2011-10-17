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

" Main Havoc syntax:
syn keyword havoc_qualifier     wh st if ow is im
syn match   havoc_qualifier     / \(⋅\|∋\|←\|↤\|⋴\|→\|↦\|⊣\|⊢\|≡\|≢\)\d*\( \|$\)/
syn match   havoc_equivalence   / \(=\|≠\|!=\|⋴\|⊧\) /
syn match   havoc_grouping      /[{}\[\]()]/
syn match   havoc_operator      /[-+*\/%^&|!~@#$\\:;?<>=]\+\d*/

syn match   havoc_comma         /,/
syn match   havoc_constant      /⊥/
syn match   havoc_infix         /\<[-\/<⋅]\w\+/

syn region  havoc_literal_str   matchgroup=havoc_quotation start=/"/ end=/"/ skip=/\\./
syn match   havoc_literal_num   +-\?\d\+\(\.\d\+\)\?+
syn match   havoc_literal_sym   +'[^\[\](){}, ]\++
syn match   havoc_bind          +:\w\++

syn keyword havoc_placeholder   _

syn match   havoc_identifier    /[a-z_]\S*/

hi link havoc_qualifier         Special
hi link havoc_equivalence       Keyword
hi link havoc_grouping          Special
hi link havoc_operator          Operator

hi link havoc_comma             Special
hi link havoc_constant          Operator
hi link havoc_infix             Type

hi link havoc_quotation         Special
hi link havoc_literal_str       String
hi link havoc_literal_num       Number
hi link havoc_literal_sym       Identifier
hi link havoc_bind              Identifier

hi link havoc_placeholder       Identifier

" Set operations:
syn match   havoc_quantifier    / \(∀\|∃\) /
syn keyword havoc_quantifier    fa ex
syn match   havoc_set_operator  / \(∈\|∉\|⊂\|⊃\|⊆\|⊇\|∪\|∩\|∨\|∧\) /
syn keyword havoc_set_operator  in !in sub sup sub= sup= union intersect and or

syn match   havoc_oxford_comma  /,\s*\(or\|and\)\(\s\|$\)\@=/

hi link havoc_quantifier        Type
hi link havoc_set_operator      Type
hi link havoc_oxford_comma      Special

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
