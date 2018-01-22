" ~/.vimrc
" vim: set filetype=vim:

" Environment

set directory='~/tmp,/var/tmp,/tmp'
filetype off

set backspace=2
set colorcolumn=80
set expandtab
set formatoptions+=croj
set guioptions=
set hidden
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set lazyredraw
set linebreak
set mouse=a
set nocursorcolumn
set nocursorline
set noerrorbells
set noshowmode
set novisualbell
set nowrap
set number
set shiftwidth=4
set showcmd
set showtabline=2
set smartindent
set splitbelow
set splitright
set tabstop=4
set ttymouse=sgr
set viminfo='100,<100,s100,%,n$HOME/.viminfo
set wildmenu
set wildmode=longest:full

" Plugins

call plug#begin('$HOME/.vim/plugins')
Plug 'Shougo/neocomplete.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'flowtype/vim-flow'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'scrooloose/nerdtree'
Plug 'shannonmoeller/vim-monokai256'
Plug 'sheerun/vim-polyglot'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'terryma/vim-multiple-cursors'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
call plug#end()

let g:EditorConfig_core_mode = 'external_command'
let g:NERDTreeCascadeSingleChildDir=0
let g:NERDTreeMinimalUI = 1
let g:NERDTreeShowHidden = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_alt_sep = ' '
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#taboo#enabled = 0
let g:airline_theme = 'powerlineish'
let g:ale_fix_on_save = 1
let g:ale_fixers = { 'css': ['prettier', 'stylelint'], 'javascript': ['prettier', 'eslint'] }
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_lint_delay = 500
let g:ale_sign_column_always = 1
let g:fzf_history_dir = '~/.local/share/fzf-history'
let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size = 1
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Mapping

command Q q
command QA qa
command Qa qa
command W w
command WA wa
command Wa wa
command WQ wq
command Wq wq
command WQA wqa
command WQa wqa
command Wqa wqa
nnoremap <c-p> :Files<CR>
nnoremap <silent> <Leader><Space> :sil %s/\s\+$//<CR>
nnoremap <silent> <Leader>l :syntax sync fromstart<CR>
nnoremap <silent> <Leader>n :NERDTreeTabsToggle<CR>
nnoremap <silent> <Leader>p :set paste!<CR>
nnoremap <silent> <Leader>w :set wrap!<CR>
nnoremap Y y$
vmap < <gv
vmap > >gv

" Theme

syntax on
syntax sync minlines=1024
color monokai256
let &showbreak='└ '

hi TrailingSpace ctermbg=199
autocmd InsertEnter * match TrailingSpace /\s\+\%#\@<!$/
autocmd InsertLeave * match TrailingSpace /\s\+$/
autocmd BufNewFile,BufRead * :IndentGuidesEnable

" Macros
runtime macros/matchit.vim
