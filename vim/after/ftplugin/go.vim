set list
set listchars=tab:..,trail:.,extends:#,nbsp:.
set shiftwidth=2
set tabstop=2
set expandtab
autocmd FileType go autocmd BufWritePre <buffer> :%s/\s\+$//e

