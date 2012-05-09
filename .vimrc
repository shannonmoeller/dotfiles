" ~/.vimrc
" vim: set filetype=vim:

" Runtime
set runtimepath^=$ZDOTDIR/.vim

" Pathogen
filetype off
call pathogen#infect()
filetype plugin indent on

" Settings
set backspace=2
set colorcolumn=80
set cursorline
set hlsearch
set incsearch
set laststatus=2
set linebreak
set noexpandtab
set nowrap
set number
set shiftwidth=4
set showcmd
set smartindent
set splitbelow
set splitright
set tabstop=4
set viminfo=
set wildmenu
set wildmode=longest:full

" Filetypes
autocmd BufNewFile,BufRead *.confluence setl ft=confluencewiki
autocmd BufNewFile,BufRead *.json setl ft=javascript
autocmd FileType coffee,confluencewiki,jade,stylus,yaml setl et sw=2 ts=2
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
vnoremap <Leader>n :!node -e "`cat`"<CR>
vnoremap <Leader>p :!perl -e "`cat`"<CR>

" Theme
syntax on
color monokai256
let &showbreak='└ '
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
autocmd BufNewFile,BufRead * :IndentGuidesEnable
autocmd InsertEnter * match TrailingSpace /\s\+\%#\@<!$/
autocmd InsertLeave * match TrailingSpace /\s\+$/
