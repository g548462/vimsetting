""" Source Code Formating
autocmd Filetype c,cpp :set cindent
autocmd Filetype c,cpp :set cinoptions={0,1s,t0,n-2,p2s,(03s,=.5s,>1s,=1s,:1s 

""" Omnicppcomplete plugin setting
set tags+=~/.vim/bundle/omincppcomplete/tags/cpp " add tag list
set nocp
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_MayCompleteDot = 1
let OmniCpp_MayCompleteArrow = 1
let OmniCpp_MayCompleteScope = 1
let OmniCpp_DisplayMode = 1
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]

" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview


""" Header File/ Source File switching
function! FileHeaderSource()
    let fextname=expand("%:e")
    let fname=expand("%:r")
    if fextname=="h"
         if filereadable(fname.".cpp")
             exec ':e '.fname.".cpp"
             return
         endif
        if filereadable(fname.".c")
            exec ':e '.fname.".c"
            return
        endif
    else
        if filereadable(fname.".h")
             exec ':e '.fname.".h"
             return
        endif
    endif
    echo "file not found"
endfunction
nmap fh :call FileHeaderSource()<cr>
