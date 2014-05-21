set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
Bundle 'cespare/vim-golang' 
Bundle 'Blackrush/vim-gocode'
" Bundle 'Valloric/YouCompleteMe'

" ... other plugin
" snipmate
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
" Optional:
Bundle "honza/vim-snippets"
Bundle "aperezdc/vim-template"

Bundle "vim-scripts/javacomplete"
Bundle "Pydiction"
let g:pydiction_location = '$HOME/.vim/bundle/Pydiction/complete-dict'
Bundle "pythoncomplete"

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.

"set omnifunc=syntaxcomplete#Complete    
set completeopt=longest,menu
autocmd BufWritePre *.go :Fmt

set showcmd
set ruler
" enable backspace
set backspace=indent,eol,start
set nu
set mouse=
set ts=4 sts=4 sw=4
" set expandtab
autocmd Filetype python set ts=4 sts=4 expandtab
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd Filetype java setlocal omnifunc=javacomplete#Complete
