""""""""""""""""""""""""""""""""""""""""""""""""""""
" General

set nocompatible
set history=400

"load plugins via pathogen
call pathogen#runtime_append_all_bundles()

filetype plugin indent on
set encoding=utf8

"Set to auto read when a file is changed from the outside
set autoread

"Have the mouse enabled all the time:
set mouse=a

"Set mapleader
let mapleader = ","
let g:mapleader = ","
"let maplocalleader = "-"

"Fast saving
nmap <leader>w :w!<cr>

" Fuzzy finder
nmap <leader>ff :FufFile<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings

map § $
imap § $
vmap § $
cmap § $

map <D-7> \
map! <D-7> \
map <D-8> {
map <D-9> }
map! <D-8> {
map! <D-9> }

map  <F5>  :nohlsearch<CR>
imap <F5>  <ESC>:nohlsearch<CR>i
vmap <F5>  <ESC>:nohlsearch<CR>gv

" Disable arrow keys in normal mode
nmap <up> <nop>
nmap <down> <nop>
nmap <left> <nop>
nmap <right> <nop>

" Set pastetoggle to F4
set pastetoggle=<F4>

"Fast editing of .vimrc
map <leader>ce :e! <c-r>=Get_vimrc_file()<cr><cr>

"When .vimrc is edited, reload it
autocmd! bufwritepost vimrc so %

" Windows == Headache
function! Get_vimrc_file()
  if exists("g:vimrc_file") 
      return g:vimrc_file
   else
      return "~/.vim/vimrc"
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Look and feel

" Some platform specific stuff
if has("macunix")
    set langmenu=en
    lang en_US
    set shell=/bin/bash
    set guifont=Menlo_Regular:h11
elseif has("win32") || has("win64")
    lang en
    set shell=cmd.exe
    set shellcmdflag=/c 
    set guifont=Consolas:h9
endif

syntax enable

" Set list chars
set listchars=tab:»·,trail:·
set list

if has("gui_running")
  set guioptions-=T
  set background=dark
  let psc_style='cool'
  set lines=40 columns=180
  if has("gui_macvim")
    set antialias
    set fuoptions=maxvert,maxhorz
  endif
  colorscheme ir_black
  highlight Cursor guibg=red guifg=white
else
  colorscheme camo
  hi MatchParen ctermfg=black ctermbg=yellow
endif

autocmd BufEnter * :syntax sync fromstart

"Highlight current line
if has("gui_running")
  set cursorline
endif

"Omnicompletion menu colors
hi Pmenu guibg=#1a293f
hi PmenuSel guibg=#54657d guifg=#ffffff
set completeopt-=preview

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" User Interface

"Set 4 lines to the curors - when moving vertical..
set so=4

"Turn on WiLd menu
set wildmenu

"Always show current position
set ruler

"The commandbar is one line high
set cmdheight=1

"Show line number
set nu

"Do not redraw, when running macros.. lazyredraw
set lz

"Change buffer - without saving
set hid

"Set backspace
set backspace=eol,start,indent

"Bbackspace and cursor keys wrap to
set whichwrap+=<,>,h,l

"Ignore case when searching
set ignorecase
set incsearch

"Set magic on
set magic

"No sound on errors.
set noerrorbells
set novisualbell
set t_vb=

"show matching bracets
set showmatch

"Highlight search things
set hlsearch

""""""""""""""""""""""""""""""
" statusline

"Always hide the statusline
set laststatus=2

function! CurDir()
 let curdir = substitute(getcwd(), '/Users/ilia/', "~/", "g")
 return curdir
endfunction

"Format the statusline
set statusline=\ %F%m%r%h\ %w\ \ cwd:\ %r%{CurDir()}%h\ \ \ line:\ %l/%L:%c\ \ [%{&ff}\,%{strlen(&fenc)?&fenc:&enc}]

""""""""""""""""""""""""""""""
" Visual

" From an idea by Michael Naumann
function! VisualSearch(direction) range
  let l:saved_reg = @"
  execute "normal! vgvy"
  let l:pattern = escape(@", '\\/.*$^~[]')
  let l:pattern = substitute(l:pattern, "\n$", "", "")
  if a:direction == 'b'
    execute "normal ?" . l:pattern . "^M"
  else
    execute "normal /" . l:pattern . "^M"
  endif
  let @/ = l:pattern
  let @" = l:saved_reg
endfunction

"Basically you press * or # to search for the current selection !! Really useful
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin configuration

   """"""""""""""""""""""""""""""
   " => Vim Grep
   """"""""""""""""""""""""""""""
   let Grep_Skip_Dirs = '.git .svn .bzr. .hg'

   """"""""""""""""""""""""""""""
   " => File explorer
   """"""""""""""""""""""""""""""
   "Split vertically
   let g:explVertical=1

   "Window size
   let g:explWinSize=35

   let g:explSplitLeft=1
   let g:explSplitBelow=1

   "Hide some files
   let g:explHideFiles='^\.,.*\.class$,.*\.swp$,.*\.pyc$,.*\.swo$,\.DS_Store$'

   "Hide the help thing..
   let g:explDetailedHelp=0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Moving around and tabs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Map space to / and c-space to ?
map <space> /
map <c-space> ?

"Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

map <leader>bd :Bclose<cr>
map <C-l> :bn<cr>
map <C-h> :bp<cr>

"Tab configuration
map <leader>tn :tabnew %<cr>
map <leader>te :tabedit 
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
try
  set switchbuf=usetab
  set stal=2
catch
endtry

"Moving fast to front, back and 2 sides ;)
imap <m-$> <esc>$a
imap <m-0> <esc>0i
imap <D-$> <esc>$a
imap <D-0> <esc>0i


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Files and backups

"Turn backup off
set nobackup
set nowb
set noswapfile
set encoding=utf-8 fileencodings=

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Folding

"Enable folding
set nofen
set fdl=0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text options

set expandtab
set shiftwidth=4
set tabstop=4

map <leader>t2 :set sw=2<cr>
map <leader>t4 :set sw=4<cr>

set smarttab
set lbr
set tw=78

""""""""""""""""""""""""""""""
" Indent

"Auto indent
set ai

"Smart indent
set si

"Wrap lines
set wrap


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Filetype generic

" Set Omni complete functions

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType html set sw=2
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby set sw=2
autocmd FileType text set tw=80


""""""""""""""""""""""""""""""
" VIM

autocmd FileType vim map <buffer> <leader><space> :w!<cr>:source %<cr>

"Press c-q instead of space (or other key) to complete the snippet
"imap <C-q> <C-]>

" Change to current dir
function! Change_to_pwd()
    let _dir = expand("%:p:h")
    exec "cd " . _dir
    unlet _dir
endfunction

autocmd BufEnter * call Change_to_pwd() 

" Python stuff
" Trim trailing whitespace
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``

