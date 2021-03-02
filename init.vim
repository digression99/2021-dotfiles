
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

" Language server platform.
Plug 'neoclide/coc.nvim', { 'branch' : 'release' }

" Use motion for the surround.
Plug 'tpope/vim-surround'

" Use register for motion.
Plug 'vim-scripts/ReplaceWithRegister'

" Give comment action.
Plug 'tpope/vim-commentary'

" Very useful keymaps for moving buffers, tabs.
Plug 'tpope/vim-unimpaired'

" Use emmet in vim.
Plug 'mattn/emmet-vim'

" Support multiple languages.
Plug 'sheerun/vim-polyglot'

" Fuzzy finder.
Plug 'junegunn/fzf', { 'dir' : '~/.fzf', 'do' : { -> fzf#install() }}
Plug 'junegunn/fzf.vim'

" Use ack in vim to search code.
Plug 'mileszs/ack.vim'

" THE nerdtree.
Plug 'preservim/nerdtree'

" Markdown related plugins.
Plug 'junegunn/goyo.vim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'}

" Colorscheme.
Plug 'morhetz/gruvbox'

call plug#end()

" --------------------------------------------------------------------------
" Keymaps, settings.
" --------------------------------------------------------------------------

" Set leader to ,
let mapleader = ','

if has('nvim') 
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1 " Support true color in nvim.
endif

" coc-nvim
" coc extensions.
let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-pairs', 'coc-tsserver', 'coc-eslint', 'coc-html', 'coc-css', 'coc-pyright', 'coc-styled-components', 'coc-prettier'] 
" run :Format to format the current buffer.
command! -nargs=0 Format :call CocAction('format') 
" press gh to hover.
nnoremap <silent> gh :call CocAction('doHover')<CR> 
" Go to definition.
nmap <silent> gd <Plug>(coc-definition)
" Go to implementation.
nmap <silent> gi <Plug>(coc-implementation)
" Find references.
nmap <silent> gr <Plug>(coc-references)
" Find type definition.
nmap <silent> ry <Plug>(coc-type-definition)
" [START]--------------- Use tab key to autocomplete. 
inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" [END]--------------- Use tab key to autocomplete. 
" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
" ⭐️⭐️⭐️⭐️⭐️ symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" ⭐️⭐️⭐️⭐️⭐️ Apply codeAction to the selected region.
" Example - <leader>aap for current paragraph.
xmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>ac <Plug>(coc-codeaction)
" Quickfix current buffer.
nmap <leader>qf <Plug>(coc-fix-current) 
" Add neovim's native statusline support.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function', '')}

" emmet-vim
let g:user_emmet_leader_key='<C-Z>' " Use Ctrl + Z to expand.

" fzf-vim
" Open fuzzy finder window.
nnoremap <C-p> :<C-u>FZF<CR> 
" Find among git staged files.
nmap <leader>v :GFiles<CR> 

" ack-vim
" Use ag when ag is avilable
if executable('ag')
  let g:ackprg = 'ag -- vimgrep --smart-case'
endif
let g:ack_autoclose = 1 " autoclose ack.
let g:ack_use_cword_for_empty_search = 1
cnoreabbrev Ack Ack!
nnoremap <leader>; :Ack!<Space>

" preservim/nerdtree
nmap <leader>e :NERDTreeToggle<CR>
let g:NERDTreeCaseSensitiveSort = 1 " Add file sort.
let g:NERDTreeNaturalSort = 1 
let g:NERDTreeIgnore=[ '\.DS_Store$[[file]]' ] " Ignore ds store files.
let g:NERDTreeMinimalUI=1 " Remove unnecessary messages.

" Keymap for opening tab.
nnoremap <leader>t :tabnew <Bar> term<CR>

" Keymap for markdown related plugins.
nnoremap <leader>g :Goyo<CR>
nnoremap <leader>h :Goyo 120<CR>
nnoremap <leader>p :MarkdownPreview<CR>

" colorscheme.
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_italic=1
let g:gruvbox_termcolors=256
colorscheme gruvbox

" Send ESC to the terminal session inside vim.
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <C-v><Esc> <Esc>
endif

" Keymap for tab navigation.
nnoremap <silent> [t :tabprev<CR>
nnoremap <silent> ]t :tabnext<CR>

" --------------------------------------------------------------------------
" Autocmds.
" --------------------------------------------------------------------------

" Highlight json file comment.
autocmd CursorHold * silent call CocActionAsync('highlight')

" markdown.
autocmd BufRead,BufNewFile *.md set wrap
autocmd FileType markdown normal zR

" python.
autocmd FileType python nnoremap <leader>r :exec '!python3' shellescape(@%, 1)<CR>

" cpp.
autocmd BufNewFile,BufRead *.cpp nnoremap <leader>r :!./a.out<CR>
autocmd BufNewFile,BufRead *.cpp nnoremap <leader>c :!g++ -std=c++11 %<CR>

" typescript.
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact
