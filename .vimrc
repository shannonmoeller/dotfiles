" ~/.vimrc
" vim: set filetype=vim:

" Runtime
set runtimepath^=$DOTDIR/.vim
set runtimepath+=$DOTDIR/.vim/bundle/vundle

" Bundles
filetype off
call vundle#rc('$DOTDIR/.vim/bundle')
Bundle 'gmarik/vundle'
Bundle 'vim-scripts/vim-coffee-script.git'
Bundle 'othree/html5.vim.git'
Bundle 'nathanaelkane/vim-indent-guides.git'
Bundle 'digitaltoad/vim-jade.git'
Bundle 'shannonmoeller/vim-javascript.git'
Bundle 'shannonmoeller/vim-monokai256.git'
Bundle 'Lokaltog/vim-powerline.git'
Bundle 'wavded/vim-stylus.git'
filetype plugin indent on

" Settings
set backspace=2
set cursorline
set expandtab
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set linebreak
set mouse=a
set nowrap
set number
set shiftwidth=4
set showcmd
set smartindent
set splitbelow
set splitright
set tabstop=4
set ttymouse=xterm2
set viminfo=
set wildmenu
set wildmode=longest:full

if exists('+colorcolumn')
	set colorcolumn=120
else
	au BufWinEnter * match TrailingSpace /\%>120v.\+/
endif

" Filetypes
autocmd BufNewFile,BufRead *.json setl ft=javascript
autocmd FileType coffee,jade,stylus,yaml setl sw=2 ts=2
autocmd FileType css setl omnifunc=csscomplete#CompleteCSS
autocmd FileType html setl omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setl omnifunc=javascriptcomplete#CompleteJS
autocmd FileType php setl omnifunc=phpcomplete#CompletePHP

" Mapping
inoremap <Nul> <C-X><C-O>
nnoremap <Leader>c :!csslint %<CR>
nnoremap <Leader>j :!jslint %<CR>
nnoremap <Leader>n :!node %<CR>
nnoremap <Leader>p :!perl %<CR>
nnoremap <silent> <Leader><Space> :sil %s/\s\+$//<CR>
nnoremap <silent> <Leader>w :set wrap!<CR>
nnoremap Y y$
noremap <Nul> <Nop>
vnoremap <Leader>c :!csslint <(cat)<CR>
vnoremap <Leader>j :!jslint <(cat)<CR>
vnoremap <Leader>n :!node <(cat)<CR>
vnoremap <Leader>p :!perl <(cat)<CR>

" Theme
syntax on
color monokai256
let &showbreak='└ '
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
let g:Powerline_symbols = 'fancy'
autocmd BufNewFile,BufRead * :IndentGuidesEnable
autocmd InsertEnter * match TrailingSpace /\s\+\%#\@<!$/
autocmd InsertLeave * match TrailingSpace /\s\+$/
