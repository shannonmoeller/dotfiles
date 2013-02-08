" ~/.vimrc
" vim: set filetype=vim:

" Runtime
set runtimepath^=$DOTDIR/.vim
set runtimepath+=$DOTDIR/.vim/bundle/vundle

" Bundles
filetype off
    call vundle#rc('$DOTDIR/.vim/bundle')
    Bundle 'gmarik/vundle'

    " Interface
    Bundle 'Lokaltog/vim-powerline'
    Bundle 'nathanaelkane/vim-indent-guides'
    Bundle 'shannonmoeller/vim-monokai256'

    " Editing
    Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
    Bundle 'scrooloose/syntastic'
    Bundle 'tpope/vim-repeat'
    Bundle 'tpope/vim-surround'
    Bundle 'Valloric/YouCompleteMe'

    " Utilities
    Bundle 'tpope/vim-fugitive'

    " Language
    Bundle 'digitaltoad/vim-jade'
    Bundle 'kchmck/vim-coffee-script'
    Bundle 'shannonmoeller/vim-javascript'
    Bundle 'wavded/vim-stylus'
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
	au BufWinEnter * match ColorColumn /\%>120v.\+/
endif

" Filetypes
autocmd BufNewFile,BufRead *.cson setl ft=coffee
autocmd BufNewFile,BufRead *.json setl ft=javascript
autocmd FileType coffee,jade,stylus,yaml setl sw=2 ts=2

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
let g:indent_guides_guide_size=1
let g:indent_guides_auto_colors=0
let g:Powerline_symbols = 'fancy'
autocmd BufNewFile,BufRead * :IndentGuidesEnable
autocmd InsertEnter * match TrailingSpace /\s\+\%#\@<!$/
autocmd InsertLeave * match TrailingSpace /\s\+$/

" Validation
let g:syntastic_javascript_jshint_conf=$DOTDIR.'/.jshintrc'

" Completion
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_auto_select = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_underbar_completion = 1
autocmd FileType css setl omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setl omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setl omnifunc=javascriptcomplete#CompleteJS
autocmd FileType php setl omnifunc=phpcomplete#CompletePHP
