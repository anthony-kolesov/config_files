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

" set viminfo^=%,<100
set viminfo=%,'100,<1000,s10,h

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

" Force "markdown" filetype to .md files
au BufNewFile,BufRead *.md set filetype=markdown

" Vim thinks that 
" au BufRead,BufNewFile *.md set filetype=text
if &filetype == 'text'
	setlocal textwidth=78
endi

" highlight SpellBad ctermfg=red ctermbg=white
highlight clear SpellBad
highlight SpellBad cterm=underline ctermfg=red
set spelllang=en_us
"set spell spelllang=en_us

" Show trailing whitepace and spaces before a tab:
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/

" Remember last position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Properly handle unordered lists, starting with *
au FileType gitcommit setlocal comments-=mb:* comments+=f:*
" GNU-like formatting for C files.
au FileType c setlocal cinoptions=>4,n-2,{2,^-2,:2,=2,g0,h2,p5,t0,+2,(0,u0,w1,m1
au FileType cpp setlocal cinoptions=>4,n-2,{2,^-2,:2,=2,g0,h2,p5,t0,+2,(0,u0,w1,m1

" Default colorscheme is awful for diffs, because sometimes fg == bg.
if &diff
    colorscheme desert
endif

if getcwd()=~#'^\(/home/akolesov/ws/openocd/\)'
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
    set noexpandtab
endif

if getcwd()=~#'^\(/remote/ru20home1/akolesov/p4/nsim_dev\)'
    set tabstop=2
    set softtabstop=2
    set shiftwidth=2
    set expandtab
endif

if getcwd()=~#'^\(/home/akolesov/ws/nsim/nsim\)'
    set tabstop=2
    set softtabstop=2
    set shiftwidth=2
    set expandtab
endif

