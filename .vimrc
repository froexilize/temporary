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

