call plug#begin('~/.vim/plugged')

" Code edit
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'
Plug 'scrooloose/nerdcommenter'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle'   }
Plug 'Raimondi/delimitMate'
Plug 'terryma/vim-multiple-cursors'
Plug 'Shougo/neocomplete'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'junegunn/vim-easy-align'
Plug 'gu-fan/simpleterm.vim'
Plug 'davidhalter/jedi-vim'
Plug 'dense-analysis/ale'

" formatters
Plug 'godlygeek/tabular'

" Lang
" Plug 'pangloss/vim-javascript'
Plug 'zah/nim.vim'

" Search
Plug 'ctrlpvim/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'easymotion/vim-easymotion'
Plug 'rking/ag.vim'

" Colors
Plug 'junegunn/seoul256.vim'
Plug 'chriskempson/base16-vim'
Plug 'mhartington/oceanic-next'
Plug 'liuchengxu/space-vim-dark'
Plug 'nightsense/vim-crunchbang'
Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/gv.vim'

" Markdown
Plug 'junegunn/vim-xmark', { 'do': 'make' }

" Browsing
Plug 'tpope/vim-vinegar'
Plug 'justinmk/vim-gtfo'
Plug 'terryma/vim-expand-region'
Plug 'Shougo/vimfiler.vim'
Plug 'Shougo/unite.vim'
Plug 'christoomey/vim-tmux-navigator'

call plug#end()

" Main theme settings
if has("gui_running")
  colorscheme nord
else
  colorscheme seoul256
  let g:seoul256_background = 235
endif

set background=dark
set guioptions-=m  "no menu
set guioptions-=T  "no toolbar
set guioptions-=l  "no left scrollbar
set guioptions-=L
set guioptions-=r  "no right scrollbar
set guioptions-=R
set mouse=a " mouse scrolling inside tmux
set t_Co=256

filetype plugin indent on
syntax enable

runtime plugin/dragvisuals.vim
runtime plugin/rename.vim
runtime plugin/BufClose.vim
runtime plugin/mru.vim

let mapleader="'"

" Avoid Shift key stroke
nnoremap ; :

" Basic setup
set encoding=utf-8
"set gfn=Monaco:h12 " Font size
" set guifont=Menlo:h12 columns=80 lines=40
"set gfn=Inconsolata:h14 " Font size
set macligatures
set guifont=Fira\ Code:h13

set autochdir

" set spell
set expandtab      " Insert with spaces instead of tabs
set nowrap         " Dont wrap lines
set smartindent
" set tabstop=4
" set softtabstop=4
" set shiftwidth=2    " A tab is four spaces

set modifiable    " Allow edits to vimfiler/netrw
set backspace=indent,eol,start " Allow backspacing over everything in insert mode
set autoindent    " Always set autoindenting on
set copyindent    " Copy the previous indentation on autoindenting
set number        " Always show line numbers
" set numberwidth=2
set shiftround    " Use multiple of shiftwidth when indenting with '<' and '>'

set ignorecase    " Ignore case when searching
set smartcase     " Ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
set smarttab      " Insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
set hlsearch      " Highlight search terms
set incsearch     " Show search matches as you type

set history=1000         " Remember more commands and search history
set undolevels=1000      " Use many muchos levels of undo

set title                " Change the terminal's title
set visualbell           " Don't beep
set noerrorbells         " Don't beep

set ruler                " Show the cursor position
set shortmess=atI        " Don’t show the intro message when starting Vim
set showmode             " Show the current mode

set clipboard=unnamed    " Use the OS clipboard by default (on versions compiled with `+clipboard`)
set wildmenu             " Enhance command-line completion
set noeol                " Don’t add empty newlines at the end of files
set scrolloff=3

set infercase            "Adjust completions to match case

set fileformats=unix,mac,dos  " Handle Mac and DOS line-endings
                              " but prefer Unix endings
set nobackup
set noswapfile
set clipboard=unnamed

" Better split switching
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" This will cause all splits to happen below (including term)
set splitbelow

" Escape out of mode
inoremap jk <Esc>

" Inserts a space to push the rest of the line to the right, while leaving the cursor in the same position
nnoremap <Space> i<Space><Esc>
nnoremap <Tab> i<Tab><Esc>

" Set to auto read when a file is changed from the outside.
set autoread
set gcr=a:blinkon0

set mat=2 " How many tenths of a second to blink when matching brackets

" Status lines
set statusline=%f\%y " Path to the file
set statusline+=%=   " Switch to the right side
set statusline+=%l    " Current line
set statusline+=/     " Separator
set statusline+=%2L   " Total lines
set statusline+=\:%c   " Column number
set statusline+=%{fugitive#statusline()}

" Customize the wildmenu/search
set wildmenu
set wildmode=list:full

set wildignore+=*.dll,*.pyc,.venv,env3,env
set wildignore+=*.DS_Store
set wildignore+=migrations
set wildignore+=.hg,.git,.svn
set wildignore+=*.orig

" Netrw ignore file types
let g:netrw_list_hide = '.pyc,.git,.DS_Store'

au FocusLost * :wa  "save on auto focus

" Work out what the comment character is, by filetype
autocmd FileType             *sh,awk,python,ruby    let b:cmt = exists('b:cmt') ? b:cmt : '#'

" Fast saving
nmap <leader>w :w!<cr>

" Automatically reload .vimrc if it changes
autocmd! bufwritepost .vimrc source %

augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

" Strip trailing whitespace on save for specified file types.
autocmd BufWritePre *.css,*.html,*.js,*.json,*.md,*.py,*.rb,*.sh,*.txt,*.nim,*.go
    \ :call StripTrailingWhitespace()

nmap <silent> ,/ :nohlsearch<CR>

cmap w!! w !sudo tee % >/dev/null

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" The default blue is just impossible to see on a black terminal
highlight Comment ctermfg=Brown

" ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Silver searcher
nnoremap \ :Ag<SPACE>

" Linting setup
" let g:syntastic_enable_perl_checker = 1
" let g:syntastic_python_checkers = ['pylint']
" let g:syntastic_quiet_messages = { "type": "style" }
" let g:syntastic_error_symbol = '✗'
" let g:syntastic_warning_symbol = '!'

" Code fold settings
set foldmethod=indent   " Fold based on indent
set foldnestmax=10      " Deepest fold is 10 levels
set nofoldenable        " Dont fold by default
set foldlevel=1         " This is just what i use

" Automatic commands
if has("autocmd")
    " Enable file type detection
    filetype on
    " Treat .json files as .js
    autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
    " Treat .md files as Markdown
    autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
endif

vmap  <expr>  <LEFT>   DVB_Drag('left')
vmap  <expr>  <RIGHT>  DVB_Drag('right')
vmap  <expr>  <DOWN>   DVB_Drag('down')
vmap  <expr>  <UP>     DVB_Drag('up')
vmap  <expr>  D        DVB_Duplicate()
vmap  <expr>  <C-D>    DVB_Duplicate()

" Quick access to Tagbar
nmap <Leader>y :TagbarToggle<CR>
let g:tagbar_sort = 0

" Buffer toggle
nnoremap <Leader>a :bprev<CR>
nnoremap <Leader>s :bnext<CR>

" Visual mode indentation
noremap > >>
noremap < <<
vnoremap > >gv
vnoremap < <gv

" Linters
" Vim jedi disable auto-complete on
let g:jedi#show_call_signatures = "0"
let g:jedi#popup_on_dot = 0
let g:jedi#completions_enabled = 0
autocmd FileType python setlocal completeopt-=preview

let g:neocomplete#enable_at_startup = 1
let g:ale_completion_enabled = 0
let g:ale_virtualenv_dir_names = ['env3']
let g:ale_linters = {'python': ['pylint', 'pyls']}

" Insert a blank line
nmap <S-Enter> O<Esc>j
nmap <CR> o<Esc>

" Strip trailing whitespace
func! StripTrailingWhitespace()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfun

" Enable JS tern shortcuts
" let g:tern_map_keys=1

" Easymotion
let g:EasyMotion_smartcase = 1
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

" Fugitive
nnoremap <leader>ga :Git add %:p<CR><CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gc :Gcommit<CR>

"  DelimitMate Indent + Auto braces
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1

" This mapping makes Ctrl-Tab switch between tabs.
" Ctrl-Shift-Tab goes the other way.
noremap <C-Tab> :tabnext<CR>
noremap <C-S-Tab> :tabprev<CR>

" switch between tabs with cmd+1, cmd+2,..."
 map <D-1> 1gt
 map <D-2> 2gt
 map <D-3> 3gt
 map <D-4> 4gt
 map <D-5> 5gt
 map <D-6> 6gt
 map <D-7> 7gt
 map <D-8> 8gt
 map <D-9> 9gt

" Close buffer but and leave other intact
nnoremap <leader>q :BufClose<cr>

" Toggle undo graph UI
nnoremap <C-u> :UndotreeToggle<cr>

" Toggle MRU UI
nnoremap <C-b> :MRU<cr>

" Toggle vimfiler
nnoremap <C-x> :VimFilerExplorer<cr>

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" vimfiler
let g:vimfiler_ignore_filters = ['matcher_ignore_wildignore']
let g:vimfiler_as_default_explorer = 1
let g:unite_kind_file_use_trashbox = 1
let g:loaded_netrwPlugin = 1
call vimfiler#custom#profile('default', 'context', {
  \ 'safe' : 0,
  \ })

call unite#filters#matcher_default#use(['sorter_rank'])
nnoremap <leader>r :<C-u>Unite -start-insert file_rec<CR>
nnoremap <silent> <leader>b :<C-u>Unite buffer bookmark<CR>

let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist|test-reports|docs|env3|env)|(\.(swp|ico|git|svn))$'

fun! JumpToDef()
  if exists("*GotoDefinition_" . &filetype)
    call GotoDefinition_{&filetype}()
  else
    exe "norm! \<C-]>"
  endif
endf

" Jump to tag
nn <M-g> :call JumpToDef()<cr>
ino <M-g> <esc>:call JumpToDef()<cr>i

" Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
  if exists(':NeoCompleteLock')==2
    exe 'NeoCompleteLock'
  endif
endfunction

" Called once only when the multiple selection is canceled (default <Esc>)
function! Multiple_cursors_after()
  if exists(':NeoCompleteUnlock')==2
    exe 'NeoCompleteUnlock'
  endif
endfunction
