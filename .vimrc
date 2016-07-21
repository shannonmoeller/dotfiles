" ~/.vimrc
" vim: set filetype=vim:

" Runtime
set runtimepath^=$DOTDIR/.vim
set directory=~/.vim/backup
set backupdir=~/.vim/backup   " keep swap files here
filetype off                  " required

" Plugins
call plug#begin('$DOTDIR/.vim/plugins')
    " Plugins
    Plug 'JazzCore/ctrlp-cmatcher'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'editorconfig/editorconfig-vim'
    Plug 'itchyny/lightline.vim'
    Plug 'jistr/vim-nerdtree-tabs'
    Plug 'nathanaelkane/vim-indent-guides'
    Plug 'scrooloose/nerdtree'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'tomtom/tcomment_vim'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-surround'

    " Themes
    Plug 'atelierbram/vim-colors_duotones'
    Plug 'shannonmoeller/vim-monokai256'

    " Languages
    Plug 'mustache/vim-mustache-handlebars'
    Plug 'othree/html5.vim'
    Plug 'pangloss/vim-javascript'
    Plug 'Valloric/YouCompleteMe'
call plug#end()

" Plugin Settings
let g:EditorConfig_core_mode='external_command'
let g:NERDTreeCascadeOpenSingleChildDir=0
let g:NERDTreeCaseSensitiveSort=1
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.swp$', '\.swo$']
let g:NERDTreeMinimalUI=1
let g:NERDTreeShowHidden=1
let g:NERDTreeSortHiddenFirst=1
let g:NERDTreeWinSize=25
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsEnableSnipMate=0
let g:UltiSnipsSnippetDirectories=['UltiSnips']
let g:ctrlp_custom_ignore={ 'dir': '\v[\/](\.git|\.hg|\.svn|dist|docs|node_modules|puphpet|vendor)$', 'file': '\v\.(dll|exe|so|swp)$' }
let g:ctrlp_match_func={ 'match': 'matcher#cmatch' }
let g:indent_guides_auto_colors=0
let g:indent_guides_guide_size=1

" Settings
set backspace=2
set colorcolumn=120
set expandtab
set formatoptions+=j
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
set novisualbell
set noshowmode
set nowrap
set number
set shiftwidth=4
set showcmd
set showtabline=2
set smartindent
set splitbelow
set splitright
set synmaxcol=1024
set tabstop=4
set ttymouse=sgr
set viminfo='100,<100,s100,%,n$DOTDIR/.viminfo
set wildmenu
set wildmode=longest:full


" Mapping
cnoreabbrev Q q
cnoreabbrev Q! q!
cnoreabbrev Sp sp
cnoreabbrev Vs vs
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
nnoremap <Leader>t :TagbarToggle<CR>
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
hi TrailingSpace ctermbg=199
autocmd BufRead,BufNewFile *.html set filetype=mustache
autocmd BufNewFile,BufRead * :IndentGuidesEnable
autocmd InsertEnter * match TrailingSpace /\s\+\%#\@<!$/
autocmd InsertLeave * match TrailingSpace /\s\+$/
autocmd! GUIEnter * set vb t_vb=

" Macros
runtime macros/matchit.vim
