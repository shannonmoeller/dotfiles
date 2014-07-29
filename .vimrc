" ~/.vimrc
" vim: set filetype=vim:

" Runtime
set runtimepath^=$DOTDIR/.vim
set runtimepath+=$DOTDIR/.vim/bundle/vundle.vim

" Plugins
filetype off
    " Vundle
    call vundle#rc('$DOTDIR/.vim/bundle')
    Plugin 'gmarik/vundle.vim'

    " Plugins
    Plugin 'JazzCore/ctrlp-cmatcher'
    Plugin 'Valloric/YouCompleteMe'
    Plugin 'airblade/vim-gitgutter'
    Plugin 'editorconfig/editorconfig-vim'
    Plugin 'jistr/vim-nerdtree-tabs'
    Plugin 'kien/ctrlp.vim'
    Plugin 'marijnh/tern_for_vim'
    Plugin 'nathanaelkane/vim-indent-guides'
    Plugin 'rking/ag.vim'
    Plugin 'scrooloose/nerdtree'
    Plugin 'scrooloose/syntastic'
    Plugin 'terryma/vim-multiple-cursors'
    Plugin 'tomtom/tcomment_vim'
    Plugin 'tpope/vim-repeat'
    Plugin 'tpope/vim-surround'

    " Themes
    Plugin 'shannonmoeller/vim-monokai256'

    " Languages
    Plugin 'groenewege/vim-less'
    Plugin 'jakar/vim-json'
    Plugin 'kchmck/vim-coffee-script'
    Plugin 'mustache/vim-mustache-handlebars'
    Plugin 'shannonmoeller/vim-javascript'
    Plugin 'tpope/vim-haml'
    Plugin 'tpope/vim-markdown'
filetype plugin indent on

" Plugin Settings
let g:NERDTreeIgnore = ['\.swp$', '\.swo$']
let g:NERDTreeShowHidden = 1
let g:NERDTreeWinSize = 20
let g:ctrlp_match_func = { 'match': 'matcher#cmatch' }
let g:gitgutter_eager = 0
let g:gitgutter_realtime = 0
let g:gitgutter_sign_column_always = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size = 1
let g:javascript_doc = 'yuidoc'
let g:markdown_fenced_languages = ['css', 'html', 'less', 'javascript', 'js=javascript', 'json=javascript', 'sass', 'scss', 'xml']
let g:syntastic_auto_loc_list = 1
let g:syntastic_enable_signs = 0
let g:tern#arguments = ['--no-port-file']
let g:tern_map_keys = 1
let g:tern_show_argument_hints = 'on_hold'
let g:ycm_cache_omnifunc = 0
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_key_list_select_completion = ['<Down>']

" Plugin Setup
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

" Settings
set backspace=2
set cursorline
set expandtab
set hidden
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set linebreak
set mouse=a
set noshowmode
set nowrap
set number
set shiftwidth=4
set showcmd
set smartindent
set splitbelow
set splitright
set tabstop=4
set timeoutlen=1000
set ttimeoutlen=0
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
autocmd BufNewFile,BufRead *.json setl ft=json sw=2 ts=2
autocmd BufNewFile,BufRead *.handlebars,*.hbr,*.hbs,*.hbt setl ft=mustache
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType html setl omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType markdown setl omnifunc=htmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags

" Mapping
cmap w!! w !sudo tee > /dev/null %
inoremap <Nul> <C-X><C-O>
inoremap <Leader>g <C-R>=expand('%:t:r')<CR>
nnoremap <Leader>u :GundoToggle<CR>
nnoremap <Leader>n :NERDTreeTabsToggle<CR>
nnoremap <Leader>t :TagbarToggle<CR>
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

