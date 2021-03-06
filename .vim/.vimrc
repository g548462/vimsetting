set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()


" For better bundle
Bundle 'gmarik/vundle'
Plugin 'octol/vim-cpp-enhanced-highlight'
" Fuzzy Search of files in repository|file directory. Super handy!!
Bundle 'kien/ctrlp.vim'
" Pretty status bar
Bundle 'bling/vim-airline'
Bundle 'scrooloose/nerdtree'
Bundle 'majutsushi/tagbar'
Bundle 'mileszs/ack.vim'
" Bundle 'kevinw/pyflakes-vim'
Bundle 'rhysd/vim-clang-format'
Bundle 'mihais/vim-mark'
Bundle 'elzr/vim-json'
Bundle 'w0rp/ale'
Bundle 'ycm-core/YouCompleteMe'
Bundle 'ludovicchabant/vim-gutentags'
Bundle 'aceofall/gtags.vim'


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
    "color gruvbox
endif


" auto reload vimrc when editing it
autocmd! bufwritepost .vimrc source ~/.vimrc

set ttyfast
syntax enable
set number

set nocompatible        " not compatible with the old-fashion vi mode
set ruler               " show the cursor position all the time
set autoread            " auto read when file is changed from outside
au CursorHold * checktime

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
set tabpagemax=30

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
set foldnestmax=3
set foldmethod=marker
set foldmarker={{{,}}}
set foldlevel=0 " 預設全部關閉
set foldcolumn=4

""" Set editing Tab
set autoindent
set expandtab
set shiftwidth=4
set softtabstop=8
set tabstop=4
set smarttab            " insert tabs on the start of a line according to context
set backspace=indent,eol,start
set copyindent         " copy the previous indentation on autoindenting

" disable sound on errors
set noerrorbells
set novisualbell
"set t_vb=
set tm=500

""" YouCompleteMe setting
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'

""" Key Mapping
nmap <LEADER>nt :NERDTree<CR>
nmap <LEADER>tt :TagbarToggle<CR>
nmap <silent><F7> :set foldmethod=syntax<CR>

""" Tab Setting
nmap <LEADER>tc :tabnew<CR>
nmap <LEADER>te :tabedit<SPACE>
nmap <LEADER>tm :tabmove<SPACE>
nmap <LEADER>tk :tabclose<CR>
nmap <S-H> :tabprev<CR>
nmap <S-L> :tabnext<CR>


let g:clang_format#detect_style_file = 1
"autocmd FileType c ClangFormatAutoEnable
" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>

autocmd TabLeave * let g:LastUsedTabPage = tabpagenr()
autocmd BufWritePre * %s/\s\+$//e

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

" auto load cscope
function! LoadCscope()
  let db = findfile("cscope.out", ".;")
  if (!empty(db))
    let path = strpart(db, 0, match(db, "/cscope.out$"))
    set nocscopeverbose " suppress 'duplicate connection' error
    exe "cs add " . db . " " . path
    set cscopeverbose
  endif
endfunction
au BufEnter /* call LoadCscope()


nmap <leader>g :Ack<CR>
nmap <leader>q :SQFix<cr>

" open the error console
nmap <leader>cc :botright cope<CR>
"move to next error
nmap <leader>] :cn<CR>
" move to the prev error
nmap <leader>[ :cp<CR>

nmap <leader>] <C-]>

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
let g:tagbar_width = 40

""" NERDTree plugin setting
let NERDTreeWinSize = 20


set cscopetag
set csprg="gtags-cscope"
let GtagsCscope_Auto_Load = 1
let GtagsCscope_Auto_Map = 1
let GtagsCscope_Quiet = 1
"
"" gtags setting
"let $GTAGSCONF = '/home/g548462/.globalrc'
let $GTAGSLABEL='native-pygments'

" gutentags 搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件/目录名
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 ctags/gtags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let g:gutentags_cache_dir = expand('~/.cache/tags')

let g:gutentags_file_list_command = 'find . -type f -name *.c -o -type f -name *.h'

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
"" 同时开启 ctags 和 gtags 支持：
let g:gutentags_modules = []
"if executable('ctags')
"	let g:gutentags_modules += ['ctags']
"endif
if executable('gtags-cscope') && executable('gtags')
	let g:gutentags_modules += ['gtags_cscope']
endif

"" 禁用 gutentags 自动加载 gtags 数据库的行为
"let g:gutentags_auto_add_gtags_cscope = 0
"let g:gutentags_define_advanced_commands = 1

"autocmd VimEnter * GutentagsToggleTrace

" GTAGS debug
"let g:gutentags_trace = 1
