execute pathogen#infect()
call pathogen#helptags()

syntax on
filetype plugin indent on


if has('gui_running')
    colorscheme solarized
    set background=dark
endif

syntax enable
let mapleader=";"

" std vim settings to make it easy to use
set gfn=Monaco:h12
set number
set tabstop=4
set autoindent
set showmatch
set ignorecase
set smartcase
set smarttab
set hlsearch
set incsearch
set history=1000
set undolevels=1000
set title
set visualbell
set noerrorbells
set nobackup
set noswapfile
set autoread
set gcr=a:blinkon0
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
set nocompatible

" customize the wildmenu
set wildmenu
set wildignore+=*.dll,*.pyc
set wildmode=list:full

let g:netrw_list_hide = '.pyc,.git,.venv'

autocmd filetype html,xml set listchars-=tab:>.
nnoremap <tab> %
vnoremap <tab> %

au FocusLost * :wa  "save on auto focus

filetype plugin indent on
nmap <silent> ,/ :nohlsearch<CR>

cmap w!! w !sudo tee % >/dev/null

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

filetype plugin indent on
filetype detect
set cindent tabstop=8 shiftwidth=8 cinoptions=l1,:0

" The default blue is just impossible to see on a black terminal
highlight Comment ctermfg=Brown

" Show trailing whitespace and spaces before a tab:
"match ExtraWhitespace /\s\+$\| \+\ze\t/

" Ignore line width for syntax checking
let g:syntastic_python_flake8_args='--ignore=E501'
