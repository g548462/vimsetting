set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()


" For better bundle
Bundle 'gmarik/vundle'
" Great tool for auto-completion of variables and functions
Plugin 'Shougo/neocomplete'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'
" Fuzzy Search of files in repository|file directory. Super handy!!
Bundle 'kien/ctrlp.vim'
" Pretty status bar
Bundle 'bling/vim-airline'
Bundle 'scrooloose/nerdtree'
Bundle 'majutsushi/tagbar'
Bundle 'mileszs/ack.vim'
Plugin 'octol/vim-cpp-enhanced-highlight'
Bundle 'kevinw/pyflakes-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " Enable filetype-specific plugins



if has("gui_running")   " GUI color and font settings
    set guifont=Monaco:h18
    set background=dark 
    set t_Co=256          " 256 color mode
    set cursorline        " highlight current line
    colors solarized
    highlight SpellBad term=underline gui=undercurl guisp=Orange 
else
    set t_Co=256
    set background=dark
    color yen3
endif


" auto reload vimrc when editing it
autocmd! bufwritepost .vimrc source ~/.vimrc

set ttyfast
syntax enable 
set number

set nocompatible        " not compatible with the old-fashion vi mode
set ruler               " show the cursor position all the time
set autoread            " auto read when file is changed from outside

set ofu=syntaxcomplete#Complete

""" set encoding to UTF-8
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,big5,euc-jp,gbk,euc-kr,utf-bom,iso8859-1
set termencoding=utf-8
set ambiwidth=double

set title
set showmode            " Show current input mode in status line
set cursorline         " Show Cursor Line in Underline
"set showtabline=2
set wildmenu " Show autocomplete menus.
set visualbell

""" Search Setting
set showcmd
set incsearch
set showmatch

set hls

""" set status bar
set laststatus=2
set statusline=%4*%<\ %1*[%F]
set statusline+=%4*\ %5*[%{&encoding}, " encoding
set statusline+=%{&fileformat}]%m " file format
set statusline+=%4*%=\ %6*%y%4*\ %3*%l%4*,\ %3*%c%4*\ \<\ %2*%P%4*\ \>
highlight User1 cterm=NONE ctermfg=203 ctermbg=NONE
highlight User2 term=underline cterm=underline ctermfg=77     ctermbg=NONE
highlight User3 term=underline cterm=underline ctermfg=247    ctermbg=NONE
highlight User4 term=underline cterm=underline ctermfg=white  ctermbg=NONE
highlight User5 ctermfg=87
highlight User6 ctermfg=254

""" set folding
"set foldnestmax=3
"set foldmethod=syntax
"set foldcolumn=4

""" Set editing Tab
set autoindent
set expandtab
set shiftwidth=2
set softtabstop=4
set tabstop=2
set smarttab            " insert tabs on the start of a line according to context
set backspace=indent,eol,start 
set copyindent         " copy the previous indentation on autoindenting

" disable sound on errors
set noerrorbells
set novisualbell
"set t_vb=
set tm=500


""" set help doc
"helptags $HOME/.vim/doc 


""" Key Mapping
nmap <LEADER>nt :NERDTree<CR>
nmap <LEADER>tt :TagbarToggle<CR>
nmap <silent><F4> :SrcExplToggle<CR>
nmap <silent><F6> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q && cscope -bR<CR>
nmap <silent><F7> :set foldmethod=syntax<CR>

""" Tab Setting
nmap <LEADER>tc :tabnew<CR>
nmap <LEADER>te :tabedit<SPACE>
nmap <LEADER>tm :tabmove<SPACE>
nmap <LEADER>tk :tabclose<CR>
nmap <C-H> :tabprev<CR>
nmap <C-L> :tabnext<CR>

autocmd TabLeave * let g:LastUsedTabPage = tabpagenr()
function! SwitchLastUsedTab()
    if exists("g:LastUsedTabPage")
        execute "tabnext " g:LastUsedTabPage
    endif
endfunction

nmap tt :call SwitchLastUsedTab()<CR>

""" 讓我們可以使用 tab 來縮排
nmap <tab> v>
nmap <s-tab> v<
vmap <tab> >gv
vmap <s-tab> <gv

"Restore cursor to file position in previous editing session
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm'\"")|else|exe "norm $"|endif|endif

""" Auto remove each line-end space 
autocmd FileType c,cpp,java,php,perl,python,ruby,sh,v,tex autocmd BufWritePre  :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))


nmap <leader>g :Ack<CR>


nmap <leader>m :make -j4<cr>
nmap <leader>, :make clean<cr>
nmap <leader>q :SQFix<cr>

" open the error console
nmap <leader>cc :botright cope<CR> 
"move to next error
nmap <leader>] :cn<CR>
" move to the prev error
nmap <leader>[ :cp<CR>


com! -bang -nargs=? SQFix cal QFixToggle(<bang>0)
fu! QFixToggle(forced)
    if exists("g:qfix_win") && a:forced == 0
        cclose
        unlet g:qfix_win
    else
        copen 10
        let g:qfix_win = bufnr("$")
        en
    endf


""" Tagbar plugin setting
let g:tagbar_ctags_bin = 'ctags'
let g:tagbar_width = 30

""" NERDTree plugin setting
let NERDTreeWinSize = 20


"AutoComplPop
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
"inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'


" set temp ctags source
"set tags=/home/g548462/Ruckus/rks-3.4/ML_3.4/video54/apps/wsgclient/tags
set tags=/home/g548462/Ruckus/simulator/wsgclient-sim-3.4/tags
"set tags =/home/g548462/Ruckus/rks-3.5/scg35_UI/video54/tags
