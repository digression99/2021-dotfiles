" --------------------------------------------------------------------------
" Vim Common Setings
" --------------------------------------------------------------------------

set nocompatible
filetype plugin indent on

" set ruler - Show current cursor row, column. Might be the cause of the speed.
set showmatch " - Move to matching braces.
set nu " Show line numbers. relative number is moved because of the performance problem.
set noswapfile " - Don't create swapfiles.

" Don't create backup files.
set nobackup
set nowritebackup

" Create undo files.
set undodir=~/.vim/undodir
set undofile

set mouse=a " - Allow vim window to work with mouse control.
set nowrap " - Don't wrap line after the text outbounds the window.
set cmdheight=2 " - Set vim command height to 2
set updatetime=500 " - Set updatetime. Updatetime is used to write swapfile.
set scrolloff=8 " Set scroll start position.
set shortmess+=c " Don't pass messages to |ins-completion-menu|
set incsearch " Search when typing.
set nohlsearch " Turn off highlight search since you don't need it after you find one.

" Basic syntax support
syntax on

" Set leader to ,
let mapleader = ','

" Share the system clipboard with vim.
set clipboard=unnamedplus

" Tab, space, indent related settings.
set tabstop=2 " hard tabstop size. (ts)
set shiftwidth=2 " indentation size. (sw)
set expandtab " Use space character than tab character.
set softtabstop=0 " Number of spaces a <Tab> counts for. When 0, the feature is off. (sts)
set autoindent " Copy indent from current line when starting a new line.
set smarttab " Inserts blanks on a <Tab> key (as per sw, ts and sts).

" --------------------------------------------------------------------------
" Plugins
" --------------------------------------------------------------------------

call plug#begin('~/.vim/plugged')
call plug#end()

" --------------------------------------------------------------------------
" Keymaps
" --------------------------------------------------------------------------

