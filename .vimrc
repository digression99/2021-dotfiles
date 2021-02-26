
" vim의 예전 버전과의 backward compatibility를 맞출 필요가 없다는 의미.
set nocompatible
" `:filetype` 을 입력했을 때 detection:ON이 되어 있어야 한다.
filetype plugin indent on

" row, column을 footer에서 보여주게 한다.
set ruler

" bracket match를 보여준다.
set showmatch

" TextEdit might fail if hidden is not set.
" 현재 버퍼를 열고 수정했을 때, 그것들을 메모리에 저장하게 한다.
" 만일 이게 꺼져있다면 다른 파일로 이동할 때 저장되지 않았다고 에러가 날 것.
set hidden

" .swap file을 생성하지 않게 한다.
set noswapfile

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" undo file 을 남긴다.
" undo tree 와 함께 작동한다.
set undodir=~/.vim/undodir
set undofile

" mouse로 window를 조절한다.
set mouse=a

" " 한줄을 감싸지 않게 한다.
set nowrap

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
" set updatetime=300
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" scroll할 때, n칸 위에서부터 화면이 스크롤되도록 한다.
" cursor가 좀더 가운데에 있도록 만든다.
set scrolloff=8

" extra column을 두어서, linting 등을 사용하기 편하게 한다.
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" relative number를 켠다.
" cpu intensive 하기는 하다.
" set relativenumber 
" 왼쪽에 line number를 표시한다.
set nu
" default syntax highlighting 기능을 지원한다.
syntax on

" leader key를'\' 대신 ','로 지정한다.
let mapleader = ','

" unnamed register를 사용하여, 복사하면 macos clipboard에도 넣어지도록 한다.
set clipboard=unnamedplus

" Use spaces
" editorconfig를 읽도록 하려면 어떻게 해야 할까.
set tabstop=2     " Size of a hard tabstop (ts).
set shiftwidth=2  " Size of an indentation (sw).
set expandtab     " Always uses spaces instead of tab characters (et).
set softtabstop=0 " Number of spaces a <Tab> counts for. When 0, featuer is off (sts).
set autoindent    " Copy indent from current line when starting a new line.
set smarttab      " Inserts blanks on a <Tab> key (as per sw, ts and sts).

" search 시 case를 신경쓰게 한다.
" ignorecase 가 켜져있을 때 작동한다.
" Capital letter를 사용했을 때 case sensitive.
" set smartcase

" search 시 타이핑할때마다 결과를 보여주도록 한다.
set incsearch

" highlight search를 끈다.
set nohlsearch

" block cursor를 보여주게 한다.
" set guicursor=

" n번째 column에 색을 칠한다.
set colorcolumn=80

" 지금 cursor가 있는 라인을 하이라이트한다.
" set cursorline

" 256 color를 넣어준다.
set termguicolors

" ----------------- Plugins

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" statusline을 예쁘게 바꿔준다.
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'

" Vim signify는 version control system에 의해 변경된 부분을 표시해준다.
if has('nvim') || has('patch-8.0.902')
  Plug 'mhinz/vim-signify'
else
  Plug 'mhinz/vim-signify', { 'branch' : 'legacy' }
endif

" Make sure you use single quotes
" image를 ascii로 간단하게 보여주는 플러그인.
Plug 'ashisha/image.vim'

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
" Plug 'junegunn/vim-easy-align'
" 페어를 자동으로 삽입해준다. 
Plug 'jiangmiao/auto-pairs'

" register 에 있는 데이터를 갈아끼울 수 있게 한다.
Plug 'vim-scripts/ReplaceWithRegister'

" 페어를 vim command로 삽입, 변경,삭제가 가능하다.
Plug 'tpope/vim-surround'

" dot repeating을 다른 플러그인까지 확장해준다.
Plug 'tpope/vim-repeat'

" comment 를 편하게 해준다.
Plug 'tpope/vim-commentary'

" handy mapping을 지원하는 플러그인.
Plug 'tpope/vim-unimpaired'

" emmet을 vim에서 쓸 수 있다.
Plug 'mattn/emmet-vim'

" 여러 언어의 syntax를 지원하기 위한 플러그인.
Plug 'sheerun/vim-polyglot'

" JavaScript syntax highlighting을 지원하는 플러그인.
"Plug 'pangloss/vim-javascript'

" jsx syntax highlighting을 지원하는 플러그인.
"Plug 'MaxMellon/vim-jsx-pretty'

" typescript react를 지원하기 위함. "
"Plug 'leafgarland/typescript-vim'
"Plug 'peitalin/vim-jsx-typescript'

" Tag를 한꺼번에 바꿀 수 있게 하는 플러그인.
Plug 'AndrewRadev/tagalong.vim'

" code intellisense
Plug 'neoclide/coc.nvim', { 'branch' : 'release'}

" Color scheme 을 바꾼다.
Plug 'sainnhe/gruvbox-material'

" rainbow parentheses를 적용한다.
Plug 'luochen1990/rainbow'

" Fuzzy finder vim.
Plug 'junegunn/fzf', { 'dir' : '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

" ack.vim - vim내에서 ack을 써서 searching을 더 잘 하게 해주는 플러그인.
Plug 'mileszs/ack.vim'

" multi cursor를 가능하게 해주는 플러그인.
" <C-n> 으로 다음 occurence를 선택할 수 있다.
Plug 'mg979/vim-visual-multi'

" Asynchronous Lint Engine.
" elm linting이 자동으로 될 것.
Plug 'dense-analysis/ale'

" Support for elm.
Plug 'elmcast/elm-vim'

" tagbar. 여러 정보를 알려준다.
Plug 'preservim/tagbar'

" styled components를 하이라이트해준다.
" Plug 'styled-components/vim-styled-components'

" graphql을 highlight 해준다.
Plug 'jparise/vim-graphql'

" support for reasonml
Plug 'reasonml-editor/vim-reason-plus'

" rescript를 지원하기 위한 플러그인.
Plug 'rescript-lang/vim-rescript'

" scala related plugins
Plug 'derekwyatt/vim-scala' 

" nerd tree.
Plug 'preservim/nerdtree'

" markdown related.
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

Plug 'iamcco/markdown-preview.nvim', { 'do' : 'cd app && yarn install' }

" Initialize plugin system
call plug#end()

" colorscheme을 설정한다.
" 반드시 Plug 'sainnhe/gruvbox-material' 뒤에 넣어야 한다.
colorscheme gruvbox-material

" coc.nvim 의 extension을 미리 지정한다.
let g:coc_global_extensions = [
  \ 'coc-tsserver'
  \ ]

" if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
"   let g:coc_global_extensions += ['coc-prettier']
" endif

" if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
"   let g:coc_global_extensions += ['coc-eslint']
" endif

" coc.nvim 에서 :OR로 import를 organize한다.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" coc.nvim 관련 설정. default status line을 켠다고 한다.
" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" 이걸 하면 tagalong이 같은 태그를 바꿀 때 visual feedback을 준다.
let g:tagalong_verbose = 1
let g:tagalong_additional_filetypes= ['js']

" neovim 에서 true color를 지원하도록 한다.
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" louchen1990/rainbow 를 트리거한다.
let g:rainbow_active = 1

" --------------------Mappings

" esc를 두번 누르면 hlsearch의 하이라이트를 제거한다.
" 그냥 highlight search 를 꺼버렸다.
" nnoremap <esc><esc> :silent! nohls<cr>

"let g:user_emmet_expandabbr_key='<Tab>'
" emmet-vim 에서 expand key를 <leader>tab키로 사용하는 코드.
" coc.nvim에서 tab completion 과 충돌이 있어 변경한다.
" imap <expr> <c-y><leader> emmet#expandAbbrIntelligent("\<tab>")
let g:user_emmet_leader_key='<C-Z>'

" coc.nvim 설정. gh를 누르면 hovering 한 것 처럼 모달이 뜬다.
nnoremap <silent> gh :call CocAction('doHover')<CR>

" coc.nvim에서 go to definition 기능을 추가한다.
nmap <silent> gd <Plug>(coc-definition)
" coc.nvim에서 go to implementation 기능을 추가한다.
nmap <silent> gi <Plug>(coc-implementation)
" coc.nvim에서 references를 찾는 기능을 추가한다.
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gy <Plug>(coc-type-definition)

" coc.nvim 에서 tab 키를 auto completion으로 하기 위한 코드.
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" " Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" " Make <CR> auto-select the first completion item and notify coc.nvim to
" " format on enter, <cr> could be remapped by other vim plugin
" 이건 너무 딜레이를 유발해서 사용하지 않기로 한다.
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
"                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" " Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code. 이거 유용할 듯 싶다.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
"  와 이거 엄청 편하다...
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" scroll float은 무엇일까??
" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" fzf related key mapping.
nnoremap <C-p> :<C-u>FZF<CR>
nmap <leader>v :GFiles<CR>

" ---------------- autocmd thing.
"

" json 파일에서 comment highlighting을 위한 것.
autocmd FileType json syntax match Comment +\/\/.\+$+

" good.
" coc.nvim 관련 설정.
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" ack.vim에서 ag를 대신 사용할 수 있도록 한다.
if executable('ag')
  let g:ackprg = 'ag --vimgrep --smart-case'
endif

let g:ack_autoclose = 1

let g:ack_use_cword_for_empty_search = 1

cnoreabbrev Ack Ack!

nnoremap <leader>; :Ack!<Space>

nnoremap <silent> [t :tabprev<CR>
nnoremap <silent> ]t :tabnext<CR>
" nnoremap <silent> [q :cprevious<CR>
" nnoremap <silent> ]q :cnext<CR>

nnoremap <leader>c :!g++ -std=c++11 %<CR>
" nnoremap <leader>r :!./a.out<CR>


" if (&ft=='py')
"   nnoremap <leader>r :!python3 %<CR>
" elseif (&ft=='cpp')
"   nnoremap <leader>r :!./a.out<CR>
" endif

" neovim terminal 관련 키 맵핑.
" command! -nargs=* T vsplit | term

nnoremap <silent> <C-b> :<C-u>sp \| wincmd j <Bar> resize 15 <Bar> te<CR><C-l>

" terminal 내부의 프로그램에 esc 신호를 보낸다.
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <C-v><Esc> <Esc>
endif

" nerdtree related
nmap <leader>e :NERDTreeToggle<CR>

" 파일에 대해 다양한 sort를 적용한다.
let g:NERDTreeCaseSensitiveSort=1
let g:NERDTreeNaturalSort=1
" ignore할 regex를 넣는다.
let g:NERDTreeIgnore=['\.DS_Store$[[file]]']
" ? for help 등의 필요없는 메시지를 없앤다.
let g:NERDTreeMinimalUI=1

" custom keybindings
nnoremap <leader>t :tabnew <Bar> term<CR>

" markdown related.

" markdown-vim에서의 folding을 제거한다.
autocmd FileType markdown normal zR 
" autocmd BufRead,BufNewFile *.md setlocal textwidth=120
autocmd BufRead,BufNewFile *.md set wrap
autocmd BufNewFile,BufRead *.py nnoremap <leader>r :!python3 %<CR>
autocmd FileType python nnoremap <leader>r :exec '!python3' shellescape(@%, 1)<CR>
autocmd BufNewFile,BufRead *.cpp nnoremap <leader>r :!./a.out<CR>

autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

nnoremap <leader>g :Goyo<CR>
map <leader>h :Goyo 120<CR>
map <leader>p :MarkdownPreview<CR>
map <leader>l :Limelight!!<CR>

" typescript-vim settings
" let g:typescript_indent_disable = 1

" arrow keys를 맵핑하여 윈도우를 조절하는데 사용한다.

" image buffer가 열릴 때, image.vim을 가동한다.
" au BufRead *.png,*.jpg,*.jpeg :call DisplayImage()

" cnoreabbrev Ack Ack!
" ----- Notes
"
" coc.nvim
" - configuration file을 열려면 :CocConfig 을 치면 된다.
"
" leader
" - leader 키를 누르고 1000ms의 여유 시간이 주어진다.
" - 이 시간은 :set timeoutlen으로 바꿀 수 있다.
"   https://medium.com/usevim/vim-101-what-is-the-leader-key-f2f5c1fa610f
(
