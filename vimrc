execute pathogen#infect()
syntax on
filetype plugin indent on

set guifont=Monaco\ 12

syntax enable

if has('gui_running')
    colorscheme solarized

    set background=light
endif

filetype plugin indent on
filetype detect
set cindent tabstop=8 shiftwidth=8 cinoptions=l1,:0

" TODO: extern "C" gets indented
" TODO: content of class blocks gets indented

" And some sane defaults, optional, but quite nice
set nocompatible

" The default blue is just impossible to see on a black terminal
highlight Comment ctermfg=Brown

" clearly point out when someone have trailing spaces
highlight ExtraWhitespace ctermbg=red guibg=red

" Show trailing whitespace and spaces before a tab:
match ExtraWhitespace /\s\+$\| \+\ze\t/
