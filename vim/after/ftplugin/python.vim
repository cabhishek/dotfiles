set list
set listchars=tab:..,trail:.,extends:#,nbsp:.
set shiftwidth=4
autocmd FileType python autocmd BufWritePre <buffer> :%s/\s\+$//e
