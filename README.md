# Template Literal SQL Highlighting for Vim

This is a [Vim](http://www.vim.org/) plugin that provides highlighting inside SQL [template literals](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Template_literals) when using a module like [sql-template-strings](https://github.com/felixfbecker/node-sql-template-strings). It kind of works.

![screenshot](https://raw.githubusercontent.com/statico/vim-javascript-sql/master/screenshot.png)

This module is experimental and strongly inspired by [vim-graphql](https://github.com/jparise/vim-graphql).

## Installation

### Using [Plug](https://github.com/junegunn/vim-plug)

1. Add `Plug 'statico/vim-javascript-sql'` to `~/.vimrc`
1. `vim +PluginInstall +qall`

### Using [Vundle](https://github.com/VundleVim/Vundle.vim)

1. Add `Plugin 'statico/vim-javascript-sql'` to `~/.vimrc`
1. `vim +PluginInstall +qall`

### Using [Pathogen](https://github.com/tpope/vim-pathogen)

1. `cd ~/.vim/bundle`
1. `git clone https://github.com/statico/vim-javascript-sql.git`

## Configuration

This plugin uses the generic SQL syntax by default. If you want to use a different dialect, like PostgreSQL, put something like this in your .vimrc:

```vim
let g:javascript_sql_dialect = 'pgsql'
```

List of tags can be overridden using:

```vim
let g:javascript_sql_tags = ['sql', 'customSql']
" default is ['SQL']
```
