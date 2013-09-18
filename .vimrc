" ~/.vimrc
" vim: set filetype=vim:

" Runtime
set runtimepath^=$DOTDIR/.vim
set runtimepath+=$DOTDIR/.vim/bundle/vundle

" Bundles
filetype off
     call vundle#rc('$DOTDIR/.vim/bundle')
    Bundle 'gmarik/vundle'

    " Plugins
    Bundle 'JazzCore/ctrlp-cmatcher'
    Bundle 'Lokaltog/vim-easymotion'
    Bundle 'SirVer/ultisnips'
    Bundle 'Valloric/YouCompleteMe'
    Bundle 'bling/vim-airline'
    Bundle 'godlygeek/tabular'
    Bundle 'jistr/vim-nerdtree-tabs'
    Bundle 'kien/ctrlp.vim'
    Bundle 'majutsushi/tagbar'
    Bundle 'marijnh/tern_for_vim'
    Bundle 'nathanaelkane/vim-indent-guides'
    Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
    Bundle 'scrooloose/nerdtree'
    Bundle 'scrooloose/syntastic'
    Bundle 'thinca/vim-textobj-function-javascript'
    Bundle 'tomtom/tcomment_vim'
    Bundle 'tpope/vim-abolish'
    Bundle 'tpope/vim-fugitive'
    Bundle 'tpope/vim-repeat'
    Bundle 'tpope/vim-surround'

    " Themes
    Bundle 'shannonmoeller/vim-monokai256'

    " Languages
    Bundle 'digitaltoad/vim-jade'
    Bundle 'jakar/vim-json'
    Bundle 'kchmck/vim-coffee-script'
    Bundle 'nono/vim-handlebars'
    Bundle 'shannonmoeller/vim-javascript'
    Bundle 'wavded/vim-stylus'

    " Settings
    let g:NERDTreeIgnore = ['\.swp$', '\.swo$']
    let g:NERDTreeShowHidden = 1
    let g:airline_powerline_fonts = 1
    let g:airline_theme = 'powerlineish'
    let g:indent_guides_auto_colors = 0
    let g:indent_guides_guide_size = 1
    let g:javascript_doc = 'yuidoc'
    let g:tern#arguments = ['--no-port-file']
    let g:tern_map_keys = 1
    let g:tern_show_argument_hints = 'on_hold'
    let g:ycm_cache_omnifunc = 0
    let g:ycm_key_list_previous_completion = ['<Up>']
    let g:ycm_key_list_select_completion = ['<Down>']
filetype plugin indent on

" Settings
set backspace=2
set cursorline
set expandtab
set foldmethod=indent
set foldnestmax=2
set hidden
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
set ttyfast
set ttymouse=xterm2
set ttyscroll=3
set viminfo='100,<100,s100,%,n$DOTDIR/.viminfo
set wildmenu
set wildmode=longest:full

if exists('+colorcolumn')
    set colorcolumn=81
else
    au BufWinEnter * match ColorColumn /\%>81v.\+/
    au BufWinEnter * match ColorColumn /\%>121v.\+/
endif

" Filetypes
autocmd BufNewFile,BufRead *.css,*.scss setl fdm=manual
autocmd BufNewFile,BufRead *.json setl ft=json
autocmd BufNewFile,BufRead *.hbr,*.hbs,*.hbt setl ft=handlebars
autocmd FileType coffee,jade,stylus,yaml setl sw=2 ts=2
autocmd FileType css setl omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setl omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setl omnifunc=javascriptcomplete#CompleteJS
autocmd FileType php setl omnifunc=phpcomplete#CompletePHP

" Mapping
cmap w!! w !sudo tee > /dev/null %
inoremap <Nul> <C-X><C-O>
nnoremap <Leader>n :NERDTreeTabsToggle<CR>
nnoremap <silent> <Leader>/ :nohlsearch<CR>
nnoremap <silent> <Leader><Space> :sil %s/\s\+$//<CR>
nnoremap <silent> <Leader>f :set foldenable!<CR>
nnoremap <silent> <Leader>p :set paste!<CR>
nnoremap <silent> <Leader>w :set wrap!<CR>
nnoremap Y y$
noremap <Nul> <Nop>

" Theme
syntax on
color monokai256
let &showbreak='└ '
autocmd BufNewFile,BufRead * :IndentGuidesEnable
autocmd InsertEnter * match TrailingSpace /\s\+\%#\@<!$/
autocmd InsertLeave * match TrailingSpace /\s\+$/

" Macros
runtime macros/matchit.vim
