set list
set listchars=tab:..,trail:.,extends:#,nbsp:.

autocmd FileType python autocmd BufWritePre <buffer> :%s/\s\+$//e
