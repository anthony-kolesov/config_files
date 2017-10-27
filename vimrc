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
" Use 4 for real tabs.
set tabstop=4
" Use 4 for space-tabs.
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
" Should `autocmd Syntax` instead of simple `match` because there can be only
" one match in the buffer.
autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/ containedin=ALL

" Show invalid GNU comments:
" 1. dot must be succeeded by two whitespaces
" 2. Comment must end with a [.?!] and two spaces.
highlight InvalidGNUComment ctermbg=red guibg=red
" `autocmd Syntax` tends to break comment highlightinh, so use only `match`.
au FileType c match InvalidGNUComment /[^.\?! ] \{1,2\}\*\/\|\S\*\/\|\. [^ ]/
au FileType cpp match InvalidGNUComment /[^.\?! ] \{1,2\}\*\/\|\S\*\/\|\. [^ ]/

" Remember last position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Properly handle unordered lists, starting with *
au FileType gitcommit setlocal comments-=mb:* comments+=f:*
" GNU-like formatting for C files.
"au FileType c setlocal cinoptions=>4,n-2,{2,^-2,:2,=2,g0,h2,p5,t0,+2,(0,u0,w1,m1
"au FileType cpp setlocal cinoptions=>4,n-2,{2,^-2,:2,=2,g0,h2,p5,t0,+2,(0,u0,w1,m1

au FileType verilog setlocal expandtab ts=2 sts=2 sw=2
au FileType expect setlocal tabstop=8 softtabstop=4 shiftwidth=4
au FileType python setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
au FileType rst setlocal tw=80 ts=3 sts=3 sw=3 expandtab

" Default colorscheme is awful for diffs, because sometimes fg == bg.
if &diff
    colorscheme pablo
endif

" Custom command that will set special background color for columns after 74
" and 80.  GDB standard is soft limit of 74 column, hard limit of 80.
command ColumnWarn
      \ let &colorcolumn="74,".join(range(81,999),",") | hi ColorColumn ctermbg=0

if getcwd()=~#'^\(/home/akolesov/ws/openocd/\)'
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
    set noexpandtab
endif

if getcwd()=~#'^\(/slowfs/ru20arcgnu1/akolesov/p4/nsim_dev\)'
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

if getcwd()=~#'^\(/home/akolesov/ws/gdb\)'
    set tabstop=8
    set softtabstop=2
    set shiftwidth=2
    set tw=79
    set noexpandtab
endif

