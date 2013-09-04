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
set tabstop=4
set softtabstop=4
set shiftwidth=4
"set expandtab

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

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

"if &syntax=="gitcommit"
"	setlocal textwidth=76
"endif

highlight SpellBad ctermfg=red ctermbg=white
set spelllang=en_us
"set spell spelllang=en_us

