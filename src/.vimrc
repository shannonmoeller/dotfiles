" ~/.vimrc
" vim: set filetype=vim:

" https://github.com/vim/vim/issues/3117#issuecomment-402622616
if has('python3')
  silent! python3 1
endif

" Environment

set directory='~/tmp,/var/tmp,/tmp'
filetype off

set backspace=2
set colorcolumn=80
set completeopt+=menuone,noselect
set completeopt-=preview
set expandtab
set formatoptions+=croj
set guioptions=
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set lazyredraw
set linebreak
set mouse=a
set nocursorcolumn
set nocursorline
set nohidden
set noerrorbells
set noshowmode
set novisualbell
set nowrap
set number
set omnifunc=ale#completion#OmniFunc
set shiftwidth=4
set shortmess+=c
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
Plug 'Asheq/close-buffers.vim'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'PhilRunninger/nerdtree-buffer-ops'
Plug 'PhilRunninger/nerdtree-visual-selection'
Plug 'Raimondi/delimitMate'
Plug 'dense-analysis/ale'
Plug 'editorconfig/editorconfig-vim'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'lifepillar/vim-mucomplete'
Plug 'mg979/vim-visual-multi'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdtree-project-plugin'
Plug 'shannonmoeller/vim-monokai256'
Plug 'sindresorhus/focus', { 'rtp': 'vim' }
Plug 'solarnz/thrift.vim'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/CSSMinister'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'xolox/vim-colorscheme-switcher'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
call plug#end()

let g:NERDTreeCascadeSingleChildDir=0
let g:NERDTreeMinimalUI = 1
let g:NERDTreeShowBookmarks=1
let g:NERDTreeShowHidden = 1
let g:UltiSnipsExpandTrigger="<c-e>"
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#close_symbol = '×'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_alt_sep = ' '
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#taboo#enabled = 0
let g:airline_theme = 'powerlineish'
let g:ale_completion_enabled = 1
let g:ale_fix_on_save = 1
let g:ale_fixers = { 'css': ['stylelint', 'prettier'], 'html': ['prettier'], 'javascript': ['eslint', 'prettier'], 'json': ['prettier'] }
let g:ale_linters = { 'css': ['stylelint'], 'html': [], 'javascript': ['tsserver', 'eslint'], 'json': [] }
let g:ale_css_stylelint_executable = 'stylelint_d'
let g:ale_javascript_eslint_executable = 'eslint_d'
" let g:ale_javascript_prettier_executable = 'prettier_d'
let g:ale_sign_column_always = 1
let g:colorscheme_switcher_exclude = ['focus-light']
let g:colorscheme_switcher_exclude_builtins = 1
let g:fzf_history_dir = '~/.local/share/fzf-history'
let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size = 1
let g:markdown_fenced_languages = ['css', 'flow=javascript', 'html', 'javascript', 'js=javascript', 'json=javascript', 'jsx=javascript', 'ts=javascript', 'xml']
let g:netrw_liststyle = 3
let g:netrw_browse_split = 2
let g:netrw_altv = 1
let g:javascript_plugin_flow = 1
let g:javascript_plugin_jsdoc = 1
let g:mucomplete#enable_auto_at_startup = 1
let g:session_autoload = 'no'
let g:session_autosave = 'yes'
let g:session_autosave_silent = 1
let g:session_verbose_messages = 0

let s:sdks = finddir('.yarn/sdks', ';')
if !empty(s:sdks)
  let g:ale_fixers = { 'javascript': ['eslint'], 'json': ['prettier'] }
  let g:ale_linters = { 'javascript': ['eslint', 'flow-language-server'], 'json': [] }
  let g:ale_javascript_eslint_use_global = 1
  let g:ale_javascript_eslint_options = '--eslint-path=' . s:sdks . '/eslint/lib/api.js'
  let g:ale_javascript_flow_ls_use_global = 1
  let g:ale_javascript_flow_ls_executable = s:sdks . '/flow-bin/cli.js'
  let g:ale_javascript_prettier_use_global = 1
  let g:ale_javascript_prettier_executable = 'prettier_d'
  let g:ale_javascript_prettier_options = '--prettier-path="' . s:sdks . '/prettier/index.js"'
endif

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
nnoremap <C-p> :Files<CR>
nnoremap <silent> <Leader><Space> :sil %s/\s\+$//<CR>
nnoremap <silent> <Leader>l :syntax sync fromstart<CR>
nnoremap <silent> <Leader>n :NERDTreeTabsToggle<CR>
nnoremap <silent> <Leader>p :set spell!<CR>
nnoremap <silent> <Leader>q :Bdelete hidden<CR>
nnoremap <silent> <Leader>sr :exec 'OpenSession' xolox#misc#str#slug(getcwd())<CR><CR>
nnoremap <silent> <Leader>ss :exec 'SaveSession' xolox#misc#str#slug(getcwd())<CR><CR>
nnoremap <silent> <Leader>t :ALEHover<CR>
nnoremap <silent> <Leader>w :set wrap!<CR>
nnoremap <silent> <Leader>c :NextColorScheme<CR>
nnoremap <silent> <Leader>z :Goyo<CR>
nnoremap Y y$
nnoremap gn :NERDTreeFind<CR>
nnoremap g] :ALEGoToDefinition<CR>
nnoremap gi :ALEGoToDefinition -split<CR>
nnoremap gs :ALEGoToDefinition -vsplit<CR>
nnoremap gt :ALEGoToDefinition -tab<CR>
" imap <expr> <cr> pumvisible() ? "\<c-y>" : "<Plug>delimitMateCR"
vmap < <gv
vmap > >gv

function! s:goyo_enter()
  set noshowmode
  set noshowcmd
  set scrolloff=999
  ALEDisable
  call xolox#colorscheme_switcher#switch_to('focus-dark')
endfunction

function! s:goyo_leave()
  set showmode
  set showcmd
  set scrolloff=0
  call xolox#colorscheme_switcher#switch_to('monokai256')
  ALEEnable
endfunction

" autocmd! User GoyoEnter nested call <SID>goyo_enter()
" autocmd! User GoyoLeave nested call <SID>goyo_leave()

" Theme

syntax on
syntax sync minlines=1024
color monokai256
let &showbreak='└ '

hi TrailingSpace ctermbg=199
autocmd BufNewFile,BufRead * :IndentGuidesEnable
autocmd BufNewFile,BufRead *.{ts,tsx} set filetype=javascript
autocmd InsertEnter * match TrailingSpace /\s\+\%#\@<!$/
autocmd InsertLeave * match TrailingSpace /\s\+$/
autocmd InsertEnter * let lwd = getcwd() | set autochdir
autocmd InsertLeave * set noautochdir | execute 'cd' fnameescape(lwd)

" Jump to last position
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Macros
runtime macros/matchit.vim
