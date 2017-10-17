" ~/.vimrc
" vim: set filetype=vim:

" Runtime
set directory='~/tmp,/var/tmp,/tmp'
set runtimepath^=$DOTDIR/.vim
filetype off

" Plugins
call plug#begin('$DOTDIR/.vim/plugins')
Plug 'Chiel92/vim-autoformat'
Plug 'SirVer/ultisnips'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }
Plug 'cyphell/htmllint'
Plug 'editorconfig/editorconfig-vim'
Plug 'ervandew/supertab'
Plug 'grensjo/tmuxline.vim'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'scrooloose/nerdtree'
Plug 'shannonmoeller/vim-monokai256'
Plug 'sheerun/vim-polyglot'
Plug 'ternjs/tern_for_vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/CSSMinister'
Plug 'vim-syntastic/syntastic'
call plug#end()

" Settings
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
set viminfo='100,<100,s100,%,n$DOTDIR/.viminfo
set wildmenu
set wildmode=longest:full

" Plugin Settings
let c_minlines=1024
let html_wrong_comments=1
let g:EditorConfig_core_mode = 'external_command'
let g:NERDTreeMinimalUI = 1
let g:NERDTreeShowHidden = 1
let g:NERDTreeWinSize = 32
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = ' '
let g:airline#extensions#taboo#enabled = 0
let g:airline_theme = 'powerlineish'
let g:fzf_history_dir = '~/.local/share/fzf-history'
let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size = 1
let g:javascript_plugin_jsdoc = 1
let g:polyglot_disabled = ['yaml']
let g:prettier#autoformat = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exec = 'eslint_d'
let g:syntastic_html_checkers = ['htmllint']
let g:tmuxline_powerline_separators = 0

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

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
nnoremap <c-f> :Ag<CR>
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
let c_minlines=500

hi OverLength ctermbg=199
autocmd FileType *sh,css,javascript,php,ruby match OverLength /\%121v.\+/

hi TrailingSpace ctermbg=199
autocmd InsertEnter * match TrailingSpace /\s\+\%#\@<!$/
autocmd InsertLeave * match TrailingSpace /\s\+$/

autocmd BufNewFile,BufRead * :IndentGuidesEnable

" Formatting
autocmd BufWritePre *.css,*.js,*.json,*.jsx Autoformat
" autocmd BufWritePre *.css,*.graphql,*.js,*.json,*.jsx,*.less,*.mjs,*.scss,*.ts,*.tsx PrettierAsync

" Macros
runtime macros/matchit.vim
