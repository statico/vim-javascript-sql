" Vim plugin
" Language: JavaScript
" Maintainer: Ian Langworth <ian@langworth.com>

if exists('b:current_syntax')
  let s:current_syntax = b:current_syntax
  unlet b:current_syntax
endif

if !exists('g:javascript_sql_tags')
  let g:javascript_sql_tags = ['SQL']
endif

exec 'syntax include @SQLSyntax syntax/' . g:javascript_sql_dialect . '.vim'
if exists('s:current_syntax')
  let b:current_syntax = s:current_syntax
endif

let s:tags_regex = join(g:javascript_sql_tags, '\|')

syntax region sqlTemplateString start=+`+ skip=+\\\(`\|$\)+ end=+`+ contains=@SQLSyntax,jsTemplateExpression,jsSpecial extend
exec 'syntax match sqlTaggedTemplate +\%(' . s:tags_regex . '\)\%(`\)\@=+ nextgroup=sqlTemplateString'

hi def link sqlTemplateString jsTemplateString
hi def link sqlTaggedTemplate jsTaggedTemplate

syn cluster jsExpression add=sqlTaggedTemplate
syn cluster sqlTaggedTemplate add=sqlTemplateString
