set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}
"
"Plugin 'gmarik/vundle'

" ... other plugin

Plugin 'Valloric/YouCompleteMe'
Plugin 'python.vim'
Plugin 'cespare/vim-golang'
Plugin 'Blackrush/vim-gocode'
Plugin 'pylint.vim'

Plugin 'honza/vim-snippets'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"

" Remember last position
if has("autocmd")
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif
"
"set omnifunc=syntaxcomplete#Complete    
"set completeopt=longest,menu
let g:gofmt_command = "goimports"
autocmd BufWritePre *.go :Fmt

syntax on
set showcmd
set ruler
" enable backspace
set backspace=indent,eol,start
set nu
set mouse=
set ts=4 sts=4 sw=4
set encoding=utf-8
" set expandtab
autocmd Filetype python set ts=4 sts=4 expandtab
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd Filetype java setlocal omnifunc=javacomplete#Complete
