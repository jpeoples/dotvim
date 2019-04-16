" Override the markdown filetype detection to set the file type to
" markdown *and* mkd_wiki so that vim-markdown-wiki will follow links in
" markdown files.

" markdown filetype file
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} setlocal filetype=markdown.mkd_wiki
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn}.{des3,des,bf,bfa,aes,idea,cast,rc2,rc4,rc5,desx} setlocal filetype=markdown.mkd_wiki
