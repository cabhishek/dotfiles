execute pathogen#infect()
call pathogen#helptags()

if has('gui_running')
    colorscheme base16-ocean
    set background=dark
endif

set runtimepath^=~/.vim/bundle/ctrlp.vim

filetype plugin indent on
syntax on

filetype detect
set cindent tabstop=8 shiftwidth=8 cinoptions=l1,:0

syntax enable
let mapleader="'"

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

" Status lines
:set statusline=%f\ -\ FileType:\ %y
:set statusline+=%l    " Current line
:set statusline+=/    " Separator
:set statusline+=%L   " Total lines
:set statusline+=%2l
:set statusline+=%{fugitive#statusline()}

" Buffer setting
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>

" Customize the wildmenu
set wildmenu
set wildignore+=*.dll,*.pyc,.venv
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

" The default blue is just impossible to see on a black terminal
highlight Comment ctermfg=Brown

" Ignore line width for syntax checking
let g:syntastic_python_flake8_args='--ignore=E501'

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

nnoremap \ :Ag<SPACE>

" Python linting setup
let g:syntastic_enable_perl_checker = 1
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_quiet_messages = { "type": "style" }

" Code fold settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1        "this is just what i use

" Jedi-vim
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = "1"
