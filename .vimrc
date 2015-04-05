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
    Plugin 'SirVer/ultisnips'
    Plugin 'Valloric/YouCompleteMe'
    Plugin 'editorconfig/editorconfig-vim'
    Plugin 'honza/vim-snippets'
    Plugin 'jistr/vim-nerdtree-tabs'
    Plugin 'kien/ctrlp.vim'
    Plugin 'marijnh/tern_for_vim'
    Plugin 'mattn/emmet-vim'
    Plugin 'nathanaelkane/vim-indent-guides'
    Plugin 'scrooloose/nerdtree'
    Plugin 'scrooloose/syntastic'
    Plugin 'terryma/vim-multiple-cursors'
    Plugin 'tomtom/tcomment_vim'
    Plugin 'tpope/vim-repeat'
    Plugin 'tpope/vim-surround'

    " Themes
    Plugin 'shannonmoeller/vim-monokai256'

    " Languages
    Plugin 'csscomb/vim-csscomb'
    Plugin 'evidens/vim-twig'
    Plugin 'groenewege/vim-less'
    Plugin 'jakar/vim-json'
    Plugin 'mustache/vim-mustache-handlebars'
    Plugin 'pangloss/vim-javascript'
    " Plugin 'shannonmoeller/vim-javascript'
    Plugin 'tpope/vim-haml'
    Plugin 'tpope/vim-markdown'
filetype plugin indent on

" Plugin Settings
let g:NERDTreeChDirMode = 2
let g:NERDTreeIgnore = ['\.swp$', '\.swo$']
let g:NERDTreeShowHidden = 1
let g:NERDTreeWinSize = 25
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsEnableSnipMate = 0
let g:UltiSnipsSnippetDirectories = ['UltiSnips']
let g:ctrlp_custom_ignore = { 'dir': '\v[\/](\.git|\.hg|\.svn|docs|node_modules|puphpet|vendor)$', 'file': '\v\.(dll|exe|so|swp)$' }
let g:ctrlp_match_func = { 'match': 'matcher#cmatch' }
let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size = 1
let g:javascript_doc = 'yuidoc'
let g:markdown_fenced_languages = ['css', 'html', 'less', 'javascript', 'js=javascript', 'json=javascript', 'sass', 'scss', 'xml']
let g:syntastic_error_symbol = '✗'
let g:syntastic_html_checkers = []
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_warning_symbol = '⚠'
let g:tern#arguments = ['--no-port-file']
let g:tern_map_keys = 1
let g:tern_show_argument_hints = 'on_hold'
let g:vdebug_options = { 'break_on_open': 1, 'port': 9000, 'server': '' }
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
set showtabline=2
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
autocmd BufNewFile,BufRead *.handlebars,*.hbr,*.hbs,*.hbt setl ft=mustache
autocmd BufNewFile,BufRead *.json setl ft=json
autocmd BufNewFile,BufRead Vagrantfile setl ft=ruby
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType html setl omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType json set sw=2 ts=2
autocmd FileType markdown setl omnifunc=htmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType ruby set sw=2 ts=2
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags

" Mapping
cnoreabbrev Q q
cnoreabbrev Q! q!
cnoreabbrev W w
cnoreabbrev W! w!
cnoreabbrev Wa wa
cnoreabbrev Windo windo
cnoreabbrev Wq wq
cnoreabbrev Wqa wqa
cnoreabbrev w!! w !sudo tee > /dev/null %
inoremap <Nul> <C-X><C-O>
inoremap <Leader>g <C-R>=expand('%:t:r')<CR>
nnoremap <Leader>n :NERDTreeTabsToggle<CR>
nnoremap <silent> <Leader>/ :nohlsearch<CR>
nnoremap <silent> <Leader><Space> :sil %s/\s\+$//<CR>
nnoremap <silent> <Leader>f :set foldenable!<CR>
nnoremap <silent> <Leader>p :set paste!<CR>
nnoremap <silent> <Leader>w :set wrap!<CR>
nnoremap Y y$
noremap <Nul> <Nop>
vmap < <gv
vmap > >gv

" Theme
syntax on
color monokai256
let &showbreak='└ '
autocmd BufNewFile,BufRead * :IndentGuidesEnable
autocmd InsertEnter * match TrailingSpace /\s\+\%#\@<!$/
autocmd InsertLeave * match TrailingSpace /\s\+$/

" Macros
runtime macros/matchit.vim
