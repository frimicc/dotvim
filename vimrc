" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

"Start up pathogen
runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()

"Options
set modelines=0                   "Prevent modelines security problems

"Indenting & Tabs
set textwidth=78                  "Wrap at this column
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
set relativenumber                "Show relative line numbers
set showmode                      "Show insert/normal mode indicator
set showcmd                       "Show selection in statusline
set wildmenu                      "Show options when tabbing in ex
set wildmode=list:longest         "Show the list with the longest match first
set cursorline                    "Show the cursor position in status line
set ttyfast                       "Redraw the screen more
set ruler                         "Show ruler in status line
set laststatus=2                  "Always show status line
set scrolloff=1                   "When scrolling include 3 lines from prev page
set encoding=utf-8                "Encoding is always horrible, maybe this will help

"Behavior
set backspace=indent,eol,start    "Make backspaces delete sensibly
set undofile                      "Create undo files for persistent undo
set hidden                        "Don't remove buffers, hide them
set matchpairs+=<:>               "Allow % to bounce between angles too
set showmatch                     "Automatically bounce to matching paren when insert
let mapleader=","                 "Use comma instead of backslash for commands
"Use shared tags file
set tags=./tags,tags,./jstags,jstags,~/projects/*/tags,~/svnprojects/*/tags 
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

" Colors, yes we want them
if $HOSTTYPE=="powerpc"
    set background=light
    colorscheme solarized
endif

if $HOSTTYPE=="intel-mac"
    set background=dark
    colorscheme solarized
endif

if $HOSTTYPE=="sun4"
    colorscheme delek
endif

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
au BufNewFile,BufRead *.tt set filetype=tt2html
au BufNewFile,BufRead *.tt2 set filetype=tt2html
au BufNewFile,BufRead *.gml set filetype=xml

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
let g:Perl_Perltidy  = 'on'

" CDC = Change to Directory of Current file
command CDC cd %:p:h
command TBT TagbarToggle
map <Leader>t :TagbarToggle<Esc>
map <Leader>o :!open "%"<Esc>
map <Leader>q :cclose<Esc>
map <Leader>pt mp1G:%!perltidy<Esc>

" HighWire Mappings
map <Leader>s :!saveall<Esc>
map <Leader>u :!updateall<Esc>

