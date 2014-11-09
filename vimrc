execute pathogen#infect()
call pathogen#helptags()

if has('gui_running')
    colorscheme base16-ocean
    set background=dark
endif

filetype plugin indent on
syntax enable

runtime bundle/ctrlp.vim
runtime plugin/dragvisuals.vim
runtime plugin/rename.vim

let mapleader="'"

" Avoid Shift key stroke
nnoremap ; :

" Basic setup
set gfn=Monaco:h12

set expandtab     " insert with spaces instead of tabs
set nowrap        " don't wrap lines
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4     " a tab is four spaces

set backspace=indent,eol,start
                  " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'

set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo

set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep

set ruler                " Show the cursor position
set shortmess=atI        " Don’t show the intro message when starting Vim
set showmode             " Show the current mode

set clipboard=unnamed    " Use the OS clipboard by default (on versions compiled with `+clipboard`)
set wildmenu             " Enhance command-line completion
set noeol                " Don’t add empty newlines at the end of files
set scrolloff=3

set infercase            "Adjust completions to match case

set fileformats=unix,mac,dos        "Handle Mac and DOS line-endings
                                    "but prefer Unix endings
set nobackup
set noswapfile

" Better split switching
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Inserts a space to push the rest of the line to the right, while leaving the cursor in the same position
nnoremap <Space> i<Space><Esc>
nnoremap <Tab> i<Tab><Esc>

" Set to auto read when a file is changed from the outside.
set autoread
set gcr=a:blinkon0

" How many tenths of a second to blink when matching brackets
set mat=2

" Strip trailing whitespace on save for specified file types.
autocmd BufWritePre *.css,*.html,*.js,*.json,*.md,*.py,*.rb,*.sh,*.txt
    \ :call StripTrailingWhitespace()

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

set wildignore+=*.dll,*.pyc,.venv
set wildignore+=*.DS_Store
set wildignore+=migrations
set wildignore+=.hg,.git,.svn
set wildignore+=*.orig


" Netrw ignore file types
let g:netrw_list_hide = '.pyc,.git,.venv,.DS_Store'

au FocusLost * :wa  "save on auto focus

nmap <silent> ,/ :nohlsearch<CR>

cmap w!! w !sudo tee % >/dev/null

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" The default blue is just impossible to see on a black terminal
highlight Comment ctermfg=Brown

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Silver searcher
nnoremap \ :Ag<SPACE>

" Linting setup
let g:syntastic_enable_perl_checker = 1
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_quiet_messages = { "type": "style" }
let g:syntastic_javascript_checkers = ['jshint']

" Code fold settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

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

" Work out what the comment character is, by filetype
autocmd FileType             *sh,awk,python,ruby    let b:cmt = exists('b:cmt') ? b:cmt : '#'

if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:<CR>
  vmap <Leader>a: :Tabularize /:<CR>
endif

" Quick access to Tagbar
nmap <Leader>y :TagbarToggle<CR>

" Buffer toggle
nnoremap <Leader>a :bp<CR>
nnoremap <Leader>s :bn<CR>

" Visual mode indentation
noremap > >>
noremap < <<
vnoremap > >gv
vnoremap < <gv

" Vim jedi disable auto-complete on
let g:jedi#popup_on_dot=0
autocmd FileType python setlocal completeopt-=preview

" Insert a blank line
nmap <S-Enter> O<Esc>j
nmap <CR> o<Esc>

" Strip trailing whitespace
func! StripTrailingWhitespace()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfun

" Load neoautocomplete pretty sweet
let g:neocomplcache_enable_at_startup = 1

" Enable JS tern shortcuts
let g:tern_map_keys=1

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
vnoremap <leader>gb :Gblame<CR>

"  DelimitMate Indent + Auto braces
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
