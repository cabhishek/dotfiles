execute pathogen#infect()
call pathogen#helptags()

if has('gui_running')
    colorscheme base16-ocean
    set background=dark
endif

set runtimepath^=~/.vim/bundle/ctrlp.vim

syntax on
filetype on

filetype plugin indent on

syntax enable

let mapleader="'"

" Avoid useless key stroke
nnoremap ; :

" Basic setup
set gfn=Monaco:h12

set nowrap        " don't wrap lines
set tabstop=4 softtabstop=4 shiftwidth=4     " a tab is four spaces
set backspace=indent,eol,start
                  " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'

set showmatch     " set show matching parenthesis
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

set autoread
set gcr=a:blinkon0


" Status lines
set statusline=%f\ %y " Path to the file
:set statusline+=%=   " Switch to the right side
set statusline+=%l    " Current line
set statusline+=/     " Separator
set statusline+=%2l   " Total lines
set statusline+=%{fugitive#statusline()}

" Buffer setting
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>

" Customize the wildmenu
set wildmenu
set wildignore+=*.dll,*.pyc,.venv
set wildmode=list:full

let g:netrw_list_hide = '.pyc,.git,.venv'

nnoremap <tab> %
vnoremap <tab> %

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

" Jedi-vim
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = "1"

" Automatic commands
if has("autocmd")
    " Enable file type detection
    filetype on
    " Treat .json files as .js
    autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
    " Treat .md files as Markdown
    autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
endif

" Make arrow keys move visual blocks around

runtime plugin/dragvisuals.vim
runtime plugin/rename.vim

vmap  <expr>  <LEFT>   DVB_Drag('left')
vmap  <expr>  <RIGHT>  DVB_Drag('right')
vmap  <expr>  <DOWN>   DVB_Drag('down')
vmap  <expr>  <UP>     DVB_Drag('up')

vmap  <expr>  D        DVB_Duplicate()
vmap  <expr>  <C-D>    DVB_Duplicate()

" Work out what the comment character is, by filetype...
autocmd FileType             *sh,awk,python,ruby    let b:cmt = exists('b:cmt') ? b:cmt : '#'

if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:<CR>
  vmap <Leader>a: :Tabularize /:<CR>
endif
