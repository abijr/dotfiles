" not vi compatible
set nocompatible
"
" set vim to use 256 colors
set t_Co=256

" set history size
set history=150

" set persistent undo and its dir
set undofile
 
" switch to taglist right after opening it.
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Show_One_File = 1


" USE THE ZENBURN COLOR SCHEME
let g:zenburn_high_Contrast = 1
colorscheme zenburn

"mouse
set mouse=a
 
" Open tag in new tab with Ctrl-\
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" Make word before uppercase
map! <C-F> <Esc>gUiw`]a

" Set encoding to UTF-8
set encoding=utf-8
 
" Set wildmenu
set wildmenu 

" Place numbering
set number

" Set tabs to equal 4 spaces
set ts=4
set sw=4

" Set title
set title
let &titlestring = $CLEARCASE_ROOT
 
"Remove menu in gvim
set guioptions=ate 
 
"PERL STUFF
" my perl includes pod
let perl_include_pod = 1
 
" syntax color complex things like @{${"foo"}}
let perl_extended_vars = 1

let perl_fold=1
let perl_fold_blocks=1

"=========================================
  
"Set folding to syntax
	"set fdm=syntax
 
" sane movement with wrap turned on
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

" These are mappings to move along 
" tabs with the alt-key
noremap <M-j> gT
noremap <M-k> gt

inoremap <M-j> <Esc> gT
inoremap <M-k> <Esc> gt
 
" Mapping to make a new line without
" switching to insert mode.
nmap <C-o> o <Esc>
 
" Mappings to go to next error in the code
" [c & cpp plugin]
"map  <silent> <F7>    <Esc>:cp<CR>
"map  <silent> <F8>    <Esc>:cn<CR>

" Mapping to toggle the taglist window
nnoremap <silent> <F10> :TlistToggle<CR>

" Mapping to toggle the NERDtree window
nnoremap <silent> <F8> :NERDTreeToggle<CR>
 
" These are mappings to copy and paste
" to clipboard with F5 and F6
vmap <silent> <F6> :!xclip -f -sel clip<CR>
map <silent> <F7> :-1r !xclip -o -sel clip<CR>

" get rid of the highlight results fast
map <M-/> :nohl<CR>

" c.vim stuff
let g:C_LineEndCommColDefault    = 35

" search options....
set ignorecase
set smartcase

" keep the cursor position x rows from the end
set so=3

"Syntax and omnicompletion
syntax on
filetype plugin on
filetype plugin indent on
set ofu=syntaxcomplete#Complete
 
" Setting for latex suite
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"
let g:Tex_DefaultTargetFormat = "pdf"
let g:Tex_CompileRule_pdf = "pdflatex $*"
let g:Tex_ViewRule_pdf = "okular"
 
" Settings for C/C++ 
let g:C_OutputGvim = "xterm"
let g:C_XtermDefaults = "-geometry 70x42-20+40 -fn Monospace -fs 10"
 
" SWANK setup
let g:slimv_swank_cmd = "! xterm -e sbcl --load ~/.vim/slime/start-swank.lisp &"

"Be able to increment with C-A alphanumeric values
set nrformats=alpha
