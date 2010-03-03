"
" Filetype detection
"
augroup filetypedetect
	" Detect .txt as 'text'
    autocmd! BufNewFile,BufRead *.txt setfiletype text
augroup END
