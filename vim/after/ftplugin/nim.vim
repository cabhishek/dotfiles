set list
set listchars=trail:.,extends:#,nbsp:.
set shiftwidth=2
set tabstop=2
set softtabstop=2
autocmd FileType nim autocmd BufWritePre <buffer> :%s/\s\+$//e
