set nocompatible
set history=400
set encoding=utf8
set autoread                    " Set to auto read when a file is changed from the outside
set mouse=a                     " Have the mouse enabled all the time
set nobackup                    " Don't create file backups
set nowb
set noswapfile                  " Turn off swapfile

" Text options
set expandtab                   " Convert tabs to spaces
set shiftwidth=4
set tabstop=4
set smarttab
set lbr
set textwidth=78
set autoindent
set smartindent
set wrap                        " Wrap lines

set backspace=eol,start,indent  " allow backspacing over everything in insert mode
set whichwrap+=<,>,h,l          " Backspace and cursor keys wrap to
set ignorecase                  " Ignore case when searching
set incsearch
set hlsearch                    " Highlight search results

filetype off

set rtp+=~/.vim/vundle/
call vundle#rc()

Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails'
Bundle 'vim-matchit'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-cucumber'
Bundle 'ervandew/supertab'
Bundle 'msanders/snipmate.vim'
Bundle 'mileszs/ack.vim'
Bundle 'sjl/gundo.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'Raimondi/delimitMate'
Bundle 'vim-scripts/taglist.vim'
Bundle 'godlygeek/tabular'
Bundle 'altercation/vim-colors-solarized'
Bundle 'git://git.wincent.com/command-t.git'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'bufexplorer.zip'
Bundle 'kchmck/vim-coffee-script'
Bundle 'davidoc/taskpaper.vim'
Bundle 'gregsexton/gitv'
Bundle 'JSON.vim'
Bundle 'majutsushi/tagbar'
Bundle 'serverhorror/javascript.vim'

filetype plugin indent on

" Mappings

let mapleader = " "
let g:mapleader = " "

map  § $
imap § $
vmap § $
cmap § $

vmap > >gv
vmap < <gv

map  <D-7> \
map! <D-7> \
map  <D-8> {
map  <D-9> }
map! <D-8> {
map! <D-9> }

" Some insert mode moving commands
imap <C-u> <ESC>kA
imap <C-e> <ESC>A
imap <C-l> <C-o>l
imap <C-h> <C-o>h

map <leader>t2 :set sw=2<cr>
map <leader>t4 :set sw=4<cr>

" Disable arrow keys in normal mode
nmap <up> <nop>
nmap <down> <nop>
nmap <left> <nop>
nmap <right> <nop>

map <leader>bd :bd<cr>
map <C-l> :bn<cr>
map <C-h> :bp<cr>

" Window movement
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_

" Do :help cope if you are unsure what cope is. It's super useful!
map <leader>n :cn<cr>
map <leader>p :cp<cr>

" Quickfix toggle
map <leader>ct :Ctoggle<cr>

" Tab configuration
map <leader>tn :tabnew %<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
try
  set switchbuf=usetab
  set stal=2
catch
endtry

imap <m-$> <esc>$a
imap <m-0> <esc>0i
imap <D-$> <esc>$a
imap <D-0> <esc>0i

" Fast saving
nmap <leader>w :w!<cr>

" Fuzzy finder
nmap <leader>ff :FufFile<cr>

" F-buttons
map <F2> :NERDTreeToggle<CR>
set pastetoggle=<F4>
map  <F5>  :nohlsearch<CR>
imap <F5>  <ESC>:nohlsearch<CR>i
vmap <F5>  <ESC>:nohlsearch<CR>gv
" <F6> is used for colorscheme switching

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

" Look and feel

" User Interface

set background=dark
set scrolloff=2                 " Set 2 lines to the curors - when moving vertical..
set wildmenu                    " Turn on WiLd menu
set ruler                       " Always show current position
set cmdheight=1                 " The commandbar is one line high
set number                      " Show line number
set lz                          " Do not redraw, when running macros.. lazyredraw
set hid                         " Change buffer - without saving
set magic
set showmatch                   " Show matching bracets
set linespace=2                 " Increase spacint b/w lines
set wmh=0                       " Set window min height for stacking


" Some platform specific stuff
if has("macunix")
    set langmenu=en
    lang en_US
    set shell=/bin/bash
    set guifont=Menlo_Regular:h10
elseif has("win32") || has("win64")
    lang en
    set shell=cmd.exe
    set shellcmdflag=/c
    set guifont=Consolas:h9
endif

syntax enable
autocmd BufEnter * :syntax sync fromstart

if has("gui_running")
  set guioptions=aAc
  set showtabline=1
  if has("gui_macvim")
    set antialias
    set fuoptions=maxvert,maxhorz
  endif
  colorscheme inspiration761937
  highlight Cursor guibg=red guifg=white
else
  hi MatchParen ctermfg=black ctermbg=yellow
  colorscheme baycomb
endif

augroup BgHighlight
  autocmd WinEnter * hi StatusLine guibg=#dddd00 guifg=Black
  autocmd WinLeave * hi StatusLineNC guibg=#aaaaaa guifg=#444444
augroup END

" Highlight current line
if has("gui_running")
  set cursorline
  hi CursorLine guibg=#222222
endif

" Omnicompletion menu colors
hi Pmenu guibg=#999900 guifg=#000000
hi PmenuSel guibg=#000000 guifg=#dddddd
set completeopt-=preview

" Show tabs and spaces
set listchars=tab:»·,trail:·
set list

" Turn the errors off
set vb t_vb=

" Statusline
set laststatus=2                " Always show statusline

function! CurDir()
 let curdir = substitute(getcwd(), '/Users/ilia/', "~/", "g")
 return curdir
endfunction

"Format the statusline
set statusline=[%n]\ %t%m%r%h\ %w\ \ cwd:\ %r%{CurDir()}%h\ %=(%{strlen(&ft)?&ft:'none'})\ %{&ff}\,%{strlen(&fenc)?&fenc:&enc}

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

vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>

" Enable folding
set nofen
set fdl=0

" Set Omni complete functions

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType javascript,html,ruby,css set sw=2
autocmd FileType text set tw=80

" VIM
autocmd FileType vim map <buffer> <leader>r :w!<cr>:source %<cr>

" Qickfix Toggle
function! s:qf_toggle()
  for i in range(1, winnr('$'))
    let bnum = winbufnr(i)
    if getbufvar(bnum, '&buftype') == 'quickfix'
      cclose
      return
    endif
  endfor

  botright copen
endfunction

command! Ctoggle call s:qf_toggle()

" Change to current dir
function! Change_to_pwd()
    let _dir = expand("%:p:h")
    exec "cd " . _dir
    unlet _dir
endfunction

" autocmd BufEnter * call Change_to_pwd()

" Trim trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" Vim grep
let Grep_Skip_Dirs = '.git .svn .bzr. .hg'

let g:vimclojure#ParenRainbow=1
let vimclojure#HighlightBuiltins=1
let vimclojure#HighlightContrib=1
let vimclojure#DynamicHighlighting=1
"let vimclojure#WantNailgun=1

"  Automagic Clojure folding on defn's and defmacro's
function! GetClojureFold()
      if getline(v:lnum) =~ '^\s*(defn.*\s'
            return ">1"
      elseif getline(v:lnum) =~ '^\s*(defmacro.*\s'
            return ">1"
      elseif getline(v:lnum) =~ '^\s*(defmethod.*\s'
            return ">1"
      elseif getline(v:lnum) =~ '^\s*$'
            let my_cljnum = v:lnum
            let my_cljmax = line("$")

            while (1)
                  let my_cljnum = my_cljnum + 1
                  if my_cljnum > my_cljmax
                        return "<1"
                  endif

                  let my_cljdata = getline(my_cljnum)

                  " If we match an empty line, stop folding
                  if my_cljdata =~ '^$'
                        return "<1"
                  else
                        return "="
                  endif
            endwhile
      else
            return "="
      endif
endfunction

function! TurnOnClojureFolding()
      setlocal foldexpr=GetClojureFold()
      setlocal foldmethod=expr
endfunction

autocmd FileType clojure call TurnOnClojureFolding()

let javaScript_fold=1
au BufRead,BufNewFile *.json set filetype=json
