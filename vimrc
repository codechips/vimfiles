" Essential
language en_US
set nocompatible
set history=1000
set encoding=utf-8
scriptencoding utf-8
set autoread
set visualbell
set nobackup
set noswapfile

" Text options
set shiftwidth=2
set tabstop=2
set softtabstop=2
set noexpandtab
set linebreak
set textwidth=78
set autoindent
set smartindent
set nowrap
set pastetoggle=<F4>

" Misc
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set ignorecase
set incsearch
set hlsearch
set iskeyword+=_,$,@,%,#
set splitright
set synmaxcol=200

" Look and feel
set scrolloff=2
set ruler
set cmdheight=1
set number
set hid
set magic
set noshowmatch
set linespace=2
set wmh=0
set laststatus=2
set wildmenu
set listchars=tab:›\ ,trail:·,eol:¬
let loaded_matchparen = 1

" set shell
if $SHELL =~ 'fish'
  set shell=/usr/local/bin/bash
endif

if !has('gui_running')
  set t_Co=256
endif

" MacVim settings
if has("gui_running")
  set guifont=MonospaceTypewriter\ for\ Powerline:h12
  colorscheme ir_black
  hi clear CursorLine
  hi CursorLineNr guibg=#333333 guifg=Yellow
  set cursorline

  if has("gui_macvim")
    set antialias
    set fuoptions=maxvert,maxhorz
    set guioptions-=m
    set guioptions-=R
    set guioptions-=L
    set guioptions-=l
    set guioptions-=r
    set showtabline=0

    macm Window.Select\ Previous\ Tab key=<D-Left>
    macm Window.Select\ Next\ Tab key=<D-Right>
    macm Window.Toggle\ Full\ Screen\ Mode key=<D-Return>
  endif
endif

" Vundle init and packages
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'matchit.zip'
Plugin 'jiangmiao/auto-pairs'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'rking/ag.vim'
Plugin 'SirVer/ultisnips'
Plugin 'kien/ctrlp.vim'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'scrooloose/syntastic'
Plugin 'elzr/vim-json'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-colorscheme-switcher'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'godlygeek/tabular'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'paradigm/TextObjectify'
Plugin 'fatih/vim-go'
Plugin 'majutsushi/tagbar'
Plugin 'ervandew/supertab'
Plugin 'maxbrunsfeld/vim-yankstack'
Plugin 'itchyny/lightline.vim'
Plugin 'dag/vim-fish'
Plugin 'chase/vim-ansible-yaml'
Plugin 'mustache/vim-mustache-handlebars'

call vundle#end()

filetype plugin indent on

" Mappings  """""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = "\<space>"
let g:mapleader = "\<space>"
inoremap jk <esc>
map  § $
imap § $
vmap § $
cmap § $

vmap > >gv
vmap < <gv

map  <D-8> {
map  <D-9> }
map! <D-8> {
map! <D-9> }

" Some insert mode moving commands
inoremap <C-u> <ESC>kA
inoremap <C-e> <ESC>A
inoremap <C-l> <C-o>l
inoremap <C-h> <C-o>h

map <leader>t2 :set sw=2<cr>
map <leader>t4 :set sw=4<cr>

" Disable arrow keys in normal mode
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

" window navigation shortcuts, ctrl h j k l
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

map <leader>bd :bd<cr>
nnoremap L :bn<cr>
nnoremap H :bp<cr>

" Stack window movement
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
map <c-h> :tabprevious<cr>
map <c-l> :tabnext<cr>

inoremap <m-$> <esc>$a
inoremap <m-0> <esc>0i
inoremap <D-$> <esc>$a
inoremap <D-0> <esc>0i

" faster buffer switching
nnoremap <leader>s :b#<cr>
nnoremap <leader>b :CtrlPBuffer<cr>

" destroy buffer, preserve split
nnoremap <silent> <leader>Q :bp\|bd #<cr>

" yank-ring
let g:yankstack_map_keys = 0
nmap <leader>p <Plug>yankstack_substitute_older_paste
nmap <leader>P <Plug>yankstack_substitute_newer_paste

" Fast saving
nnoremap <silent> <leader>w :w!<cr>
nnoremap <silent> <C-s> :w!<cr>

" Tag navigation
noremap gt <C-]>
noremap gT <C-t>

" No more ex mode
nnoremap Q <nop>

" F-buttons
nnoremap <silent> <F2> :NERDTreeToggle<cr>
nnoremap <silent> <F9> :TagbarToggle<CR>
nnoremap <cr> :noh<cr><esc>

nnoremap <silent> <leader>ff :%!js-beautify -t -a -k --good-stuff -f -<CR>
nnoremap <silent> <leader>l :setlocal list!<cr>
nnoremap <silent> <leader>c :setlocal cursorline!<cr>

" open current buffer in new tab ie maximize window
nnoremap <leader>0 :tabedit %<cr>

nnoremap <leader>oc :tabedit $MYVIMRC<cr>
nnoremap <leader>ot :tabedit ~/Dropbox/notes/todo.txt<cr>
nnoremap <leader>oq :tabedit ~/Dropbox/notes/quotes.txt<cr>
nnoremap <leader>oi :tabedit ~/Dropbox/notes/ideas.txt<cr>

cabbrev W w

nnoremap <leader>a :call SearchCurrentWord()<cr>

" When .vimrc is edited, reload it
autocmd! bufwritepost vimrc so %
autocmd FileType vim map <buffer> <leader>r :w!<cr>:source %<cr>

" Helper functions
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

function! SearchCurrentWord()
   let l:wuc = expand("<cword>")
   execute ":Ag " . l:wuc
endfunction

" Trim trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" Javascript
au BufRead,BufNewFile *.js set ft=javascript syntax=javascript
au FileType javascript setlocal ts=2 sw=2 noexpandtab

" Plugins """""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" SuperTab
let g:SuperTabDefaultCompletionType="context"

" NERDTree
let NERDTreeWinSize = 45
let NERDTreeHighlightCursorline = 1
let NERDChristmasTree = 1
let NERDTreeChDirMode = 2

" Tagbar
let g:tagbar_width = 45
let g:tagbar_autofocus = 1
let g:tagbar_compact = 1
let g:tagbar_sort = 1
let g:tagbar_iconchars = ['▸', '▾']

" Syntastic
let g:syntastic_check_on_open = 1
let g:syntastic_enable_signs = 1
let g:syntastic_enable_highlighting = 0
let g:syntastic_javascript_checkers = ['eslint']
sign define SyntasticError text=▸ linehl=Red texthl=SyntasticErrorSign

" vim-json
let g:vim_json_syntax_conceal = 0

" ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" vim-go
let g:go_fmt_command = "goimports"

" Turn off preview window
set completeopt-=preview

au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <Leader>e <Plug>(go-rename)
au FileType go nmap <Leader>gd :GoDef<cr>

" lightline
let g:lightline = {
  \ 'active': {
  \   'left': [['mode', 'paste'], ['fugitive', 'filename', 'ctrlpmark', 'modified']],
  \   'right': [['syntastic', 'lineinfo'], ['percent'], ['fileformat', 'fileencoding', 'filetype']]
  \ },
  \ 'component': {
  \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
  \ },
  \ 'separator': { 'left': '', 'right': '' },
  \ 'subseparator': { 'left': '|', 'right': '|' }
  \ }

" Custom colors """"""""""""""""""""""""""""""""""""""""
" """"""""""""""""""""""""""""""""""""""""""""""""""""""
syntax off

hi Pmenu                    ctermbg=25  ctermfg=233
hi PmenuSel                 ctermbg=148 ctermfg=233
hi CursorLine               ctermbg=234 ctermfg=none cterm=none
hi! SystasticErrorSign      ctermbg=1   ctermfg=255
hi SpellCap                 ctermfg=1   ctermbg=37
hi SignColumn               ctermbg=233
hi Search                   ctermbg=198 ctermfg=255 cterm=none
