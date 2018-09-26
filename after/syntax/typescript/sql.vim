" Vim plugin
" Language: TypeScript
" Maintainer: Ian Langworth <ian@langworth.com>
" Credits: Ian Langworth, Zac Collier <zacacollier@gmail.com>

if exists('b:current_syntax')
  let s:current_syntax = b:current_syntax
  unlet b:current_syntax
endif

exec 'syntax include @SQLSyntax syntax/' . g:typescript_sql_dialect . '.vim'
if exists('s:current_syntax')
  let b:current_syntax = s:current_syntax
endif

syntax region sqlTemplateString start=+`+ skip=+\\\(`\|$\)+ end=+`+ contains=@SQLSyntax,jsTemplateExpression,jsSpecial extend
exec 'syntax match sqlTaggedTemplate +\%(sql|SQL\)\%(`\)\@=+ nextgroup=sqlTemplateString'

hi def link sqlTemplateString jsTemplateString
hi def link sqlTaggedTemplate jsTaggedTemplate

syn cluster jsExpression add=sqlTaggedTemplate
syn cluster sqlTaggedTemplate add=sqlTemplateString
