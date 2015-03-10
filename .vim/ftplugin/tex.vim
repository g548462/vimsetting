" LaTex File Spell Check
augroup filetype
    au! BufRead,BufNewFile *.tex     set spell 
augroup END

nmap <leader>m :make<cr>


let g:Tex_CompileRule_pdf = '/usr/local/texlive/2009/bin/universal-darwin/xelatex --interaction=nonstopmode $*'
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_FormatDependency_pdf = 'pdf'
let g:Tex_MultipleCompileFormats = 'pdf'
let g:Tex_ViewRule_pdf = 'Preview'
set grepprg=grep\ -nH\ $*

set iskeyword+=:

