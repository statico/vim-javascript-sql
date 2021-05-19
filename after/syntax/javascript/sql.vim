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

let s:tags = '\%(' . join(g:javascript_sql_tags, '\|') . '\)'

" will work only with pangloss/vim-javascript
" inspired by https://github.com/jparise/vim-graphql/blob/master/after/syntax/javascript/graphql.vim
exec 'syntax region sqlTemplateString matchgroup=jsTemplateString start=+' . s:tags . '\@20<=`+ skip=+\\\\\|\\`+ end=+`+ contains=@SQLSyntax,jsTemplateExpression,jsSpecial extend'
exec 'syntax match sqlTaggedTemplate +' . s:tags . '\ze`+ nextgroup=sqlTemplateString'
syntax region sqlTemplateExpression start=+${+ end=+}+ contained contains=jsTemplateExpression keepend

hi def link sqlTemplateString jsTemplateString
hi def link sqlTaggedTemplate jsTaggedTemplate
hi def link sqlTemplateExpression jsTemplateExpression

syn cluster jsExpression add=sqlTemplateString,sqlTaggedTemplate
syn cluster sqlTaggedTemplate add=sqlTemplateString
