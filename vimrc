" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

"Start up pathogen
runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()

"Options
set modelines=0                   "Prevent modelines security problems

"Indenting & Tabs
set textwidth=115                  "Wrap at this column
set wrap                          "Default to word wrapped text
set autoindent                    "Preserve current indent on new lines
set tabstop=4                     "Indentation levels every four columns
set expandtab                     "Convert all tabs typed to spaces
set shiftwidth=4                  "Indent/outdent by four columns
set shiftround                    "Indent/outdent to nearest tabstop
set formatoptions=tcqrn1          "Auto-wrap text and comments, use 'gq' to reflow
                                  " comments, comment next line, indent
                                  " numbered lists, don't break after 1-letter
                                  " word

"Look & Feel
if version >=703
    set relativenumber                "Show relative line numbers
endif
set showmode                      "Show insert/normal mode indicator
set showcmd                       "Show selection in statusline
set wildmenu                      "Show options when tabbing in ex
set wildmode=list:longest         "Show the list with the longest match first
set cursorline                    "Show the cursor position in status line
" set ttyfast                       "Redraw the screen more
set ruler                         "Show ruler in status line
set laststatus=2                  "Always show status line
set scrolloff=1                   "When scrolling include 1 lines from prev page
set encoding=utf-8                "Encoding is always horrible, maybe this will help

"Behavior
set backspace=indent,eol,start    "Make backspaces delete sensibly
if version >=703
    set undofile                      "Create undo files for persistent undo
endif
set hidden                        "Don't remove buffers, hide them
set matchpairs+=<:>               "Allow % to bounce between angles too
set showmatch                     "Automatically bounce to matching paren when insert
let mapleader=","                 "Use comma instead of backslash for commands
"Use shared tags file
set tags=./tags,tags,./jstags,jstags,./tags;
"nnoremap ; :                      "Use ; exactly like :

" Searching options
set hlsearch                       "Enable search hit highlighting
set incsearch                      "Enable incremental search
set ignorecase                     "Case-insensitive search
set smartcase                      "Unless you type a capital letter
set gdefault                       "Assume we want to change all matches on a line
"Always use real Perl regex syntax
nnoremap / /\v
vnoremap / /\v
"Make it easy to turn off hit highlighting
nnoremap <leader><space> :nohlsearch<cr>

" Use modified delek named delak to have easier to read search highlighting
" Use modified slate named slat to have easier to read search highlighting
colorscheme slat

"Folding disabled for now, it always folds wrong when opening a new file
"set foldmethod=indent       "Lines with the same indent level form a fold
"au BufWinLeave * silent! mkview     "Save fold status on exit
"au BufWinEnter * silent! loadview    "Restore fold status on load
"let g:perl_fold = 1            "Set syntax folding for perl
"let g:xml_syntax_folding = 1   "Set syntax folding for XML
"let g:javaScript_fold = 1      "Set syntax folding for javascript

let g:tagbar_type_markdown = { 'ctagstype' : 'markdown', 'kinds' : [ 'h:headings' ], 'sort' : 0 }

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
au BufNewFile,BufRead *.tt set filetype=tt2html
au BufNewFile,BufRead *.tt2 set filetype=tt2html
au BufNewFile,BufRead *.gml set filetype=xml
au BufNewFile,BufRead *.mdwn set filetype=markdown
au BufNewFile,BufRead *.cql set syntax=cql
AddShebangPattern! perl ^#!.*/bin/env.*perl\>
AddShebangPattern! perl ^#!.*/bin/.*perl\>

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

"Map [[ and ]] to work for perl functions
map [[ ?{<CR>w99[{
map ][ /<BS><BS>}<CR>b99]}
map ]] j0[[%/<BS><BS>{<CR>
map [] k$][%?}<CR>

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
autocmd FileType java set omnifunc=javacomplete#CompleteJava
autocmd FileType java silent! compiler javac
autocmd FileType java set makeprg=javac\ -d\ ../classes\ %
autocmd FileType java set errorformat=%A:%f:%l:\ %m,%-Z%p^,%-C%.%#

let g:SuperTabDefaultCompletionType = "context"
let g:Perl_Perltidy  = 'on'
let g:ctrlp_working_path_mode = 'wr'
let g:ctrlp_by_filename = 1
let g:DeleteTrailingWhitespace_Action = 'ask'

" CDC = Change to Directory of Current file
command CDC cd %:p:h
command TBT TagbarToggle
map <Leader>t :TagbarToggle<Esc>
map <Leader>o :!open "%"<Esc>
map <Leader>q :cclose<Esc>
map <Leader>pt mp1G:%!perltidy<Esc>
map <Leader>b :b #<Esc>
map <Leader>rj :!echo %\|awk -F. '{print $1}'\|xargs java<CR>
map <Leader>rt :!echo %\|awk -F. '{print $1}'\|xargs java org.junit.runner.JUnitCore<CR>
map <Leader>x :% !xmllint --format -<CR>

" HighWire Mappings
map <Leader>s :!saveall<Esc>
map <Leader>u :!updateall<Esc>

" GUI
set macligatures
set guifont=JetBrainsMono-Regular:h16

