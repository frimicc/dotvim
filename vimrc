"###########################################################################
"#   Adapted from:                                                         #
"#   Vim config (Recommended) from Appendix C of "Perl Best Practices"     #
"#   Copyright (c) O'Reilly & Associates, 2005. All Rights Reserved.       #
"# See: http://www.oreilly.com/pub/a/oreilly/ask_tim/2001/codepolicy.html  #
"###########################################################################

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

"Start up pathogen
runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()

"Options
set autoindent                    "Preserve current indent on new lines
set textwidth=78                  "Wrap at this column
set backspace=indent,eol,start    "Make backspaces delete sensibly
set tabstop=4                     "Indentation levels every four columns
set expandtab                     "Convert all tabs typed to spaces
set shiftwidth=4                  "Indent/outdent by four columns
set shiftround                    "Indent/outdent to nearest tabstop
"set number                        "Show absolute line numbers
set rnu                           "Show relative line numbers
set matchpairs+=<:>               "Allow % to bounce between angles too
set tags=./tags,tags,~/projects/*/.tmtags,~/svnprojects/*/.tmtags "Use shared tags file
 
" Searching options
set hlsearch            "Enable search hit highlighting

" Colors, yes we want them
colorscheme delek

"Folding disabled for now, it always folds wrong when opening a new file
"set foldmethod=indent       "Lines with the same indent level form a fold 
"au BufWinLeave * silent! mkview     "Save fold status on exit
"au BufWinEnter * silent! loadview    "Restore fold status on load
"let g:perl_fold = 1            "Set syntax folding for perl
"let g:xml_syntax_folding = 1   "Set syntax folding for XML
"let g:javaScript_fold = 1      "Set syntax folding for javascript

"Syntax
if has("syntax")
    syntax on               "Enable syntax highlighting.
endif

"Filetypes
filetype plugin indent on
au BufNewFile,BufRead *.atom set filetype=xml
au BufNewFile,BufRead *.fast set filetype=xml
au BufNewFile,BufRead *.cgi set filetype=perl
au BufNewFile,BufRead *.t set filetype=perl

"Abbreviations
iab phbp  #! /usr/gnu/bin/perl -w      
iab pdbg  use Data::Dumper 'Dumper';warn Dumper [];hi
iab pbmk  use Benchmark qw( cmpthese );cmpthese -10, {};O     
iab pusc  use Smart::Comments;### 
iab putm  use Test::More qw( no_plan );
 
iab papp  :r ~/.code_templates/perl_application.pl
iab pmod  :r ~/.code_templates/perl_module.pm

"Mappings
noremap  g

"Plugins
runtime macros/matchit.vim

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType perl set omnifunc=perlcomplete#CompletePerl
autocmd FileType c set omnifunc=ccomplete#Complete

let g:SuperTabDefaultCompletionType = "context"

" CDC = Change to Directory of Current file
command CDC cd %:p:h
