" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Ensure that file type detection is on
filetype on
filetype plugin on
filetype indent on

" Configure tabs
" Use 8 for real tabs, use 4 for space-tabs
set tabstop=8
set softtabstop=4
set shiftwidth=4
set ai
set noexpandtab

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Search
set incsearch

" Disable backup files
set nobackup nowb noswapfile

set viminfo^=%

if &term=="xterm"
    set t_Co=8
    set t_Sb=^[[4%dm
    set t_Sf=^[[3%dm
endif

" Don't wake up system with blinking cursor:
" http://www.linuxpowertop.org/known.php
let &guicursor = &guicursor . ",a:blinkon0"

" Show ruler with line and column numbers.
set ruler

" Vim thinks that 
au BufRead,BufNewFile *.md set filetype=text
if &filetype == 'text'
	setlocal textwidth=78
endi

highlight SpellBad ctermfg=red ctermbg=white
set spelllang=en_us
"set spell spelllang=en_us

" Show trailing whitepace and spaces before a tab:
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
:autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/

" Remember last position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Default colorscheme is awful for diffs, because sometimes fg == bg.
if &diff
    colorscheme desert
endif

