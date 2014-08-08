execute pathogen#infect()
syntax on
filetype plugin indent on


if has('gui_running')
    colorscheme solarized
    set background=light
endif

# Standard usefulness
set gfn=Monaco:h12
set number
set tabstop=4
set autoindent
syntax enable
let mapleader=","
set showmatch
set ignorecase
set smartcase
set smarttab
set hlsearch
set incsearch
set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak,*.pyc,*.class
set title
set visualbell
set noerrorbells
set nobackup
set noswapfile
filetype plugin indent on
nmap <silent> ,/ :nohlsearch<CR>

# Sudo after you open file. In case you forget before
cmap w!! w !sudo tee % >/dev/null

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

"  NerdTree settings
autocmd vimenter * NERDTree
map <C-s> :NERDTreeToggle<CR>

filetype plugin indent on
filetype detect
set cindent tabstop=8 shiftwidth=8 cinoptions=l1,:0

" And some sane defaults, optional, but quite nice
set nocompatible

" The default blue is just impossible to see on a black terminal
highlight Comment ctermfg=Brown

" clearly point out when someone have trailing spaces
highlight ExtraWhitespace ctermbg=red guibg=red

" Show trailing whitespace and spaces before a tab:
match ExtraWhitespace /\s\+$\| \+\ze\t/
