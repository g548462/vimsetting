" Python autocomplete setting
autocmd BufRead,BufNewFile *.py map <F9> :% w !python<CR>
autocmd BufRead,BufNewFile *.py vmap f :w !python<CR>

let g:pydiction_location = '~/Documents/rc/vim/bundle/pydiction/after/ftplugin/complete-dict'

autocmd FileType python set complete+=k~/.vim/syntax/python.vim isk+=.,(


let python_highlight_all = 1

