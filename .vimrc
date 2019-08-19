set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'godlygeek/tabular' " must be placed before vim-markdown
Plugin 'plasticboy/vim-markdown'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-fugitive'
Plugin 'majutsushi/tagbar'
Plugin 'vim-syntastic/syntastic'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'vim-python/python-syntax'
Plugin 'Valloric/YouCompleteMe'


call vundle#end()
filetype plugin indent on

set number
set relativenumber
set autochdir

" количество символов пробелов, которые будут заменять \t
set tabstop=4
set shiftwidth=4
set smarttab
" автозамена по умолчанию
"set et
" перенос строк
set wrap

" настройки поиска и подсветки результатов поиска и совпадения скобок
set showmatch
set hlsearch
set incsearch
set ignorecase

" ленивая перерисовка экрана при выполнении скриптов
set lz

" показывать табы в начале строки точками
set listchars=tab:··
set list

" порядок применения кодировок и формата файлов
set ffs=unix,dos,mac
set fencs=utf-8,cp1251,koi8-r,ucs-2,cp866

" отключение захвата мышки вне графического интерфейса
if !has('gui_running')
	set mouse=
endif

" отключение меню и тулбара
set guioptions-=T
set guioptions-=m

" шрифты
if has('gui')
	colorscheme darkblue
	if has('win32')
		set guifont=Lucida_Console:h12:cRUSSION::
	else
		set guifont=Terminus\ 14
	endif
endif

" попытка занять максимально большое пространство на экране
if has('gui')
	if has('win32')
		au GUIEnter * call libcallnr('maximize', 'Maximize', 1)
	elseif has('gui_gtk2')
		au GUIEnter * :set lines=99999 columns=99999
	endif
endif

" переопределение систем сборок
if has('win32')
	set makeprg=nmake
	compiler msvc
else
	set makeprg=make
	compiler gcc
endif

" tagbar settings
nmap <F8> :TagbarToggle<CR>

" NERDTree settings
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>

" NERDTree git extension settings
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:synastic_always_populate_loc_list = 1
let g:synastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:python_highlight_all = 1

