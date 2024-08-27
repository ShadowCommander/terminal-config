set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

Plugin 'ycm-core/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" # Leader
let mapleader ="\<Space>"
nnoremap <Space> <Nop>

" ## Window movement
noremap <C-H> <C-W>h
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-L> <C-W>l
" ## Normal mode - Don't have to stretch for Esc when switching to normal
inoremap jk <Esc>
" ## Jump to outer curly brackets
noremap <leader>[ [{
noremap <leader>] ]}

set hlsearch
set incsearch
set showcmd
set rnu nu

" # Terminal settings
autocmd TermOpen * setlocal nonumber norelativenumber
" ## Window movement
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l
" ## Command mode
tnoremap jk <C-\><C-N><C-W>N
tnoremap <Esc> <C-\><C-n>


" set mouse=a
" set ruler

" Block cursor
" let &t_ti.="\e[1 q"
" let &t_SI.="\e[5 q"
" let &t_EI.="\e[1 q"
" let &t_te.="\e[0 q"

" Plugins
" call plug#begin('~/.vim/plugged')

" Plug 'easymotion/vim-easymotion'

" call plug#end()

" Mappings

" # EasyMotion
map <leader>f <Plug>easymotion-s
map <leader>e <Plug>easymotion-f

" # Clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>p "+p
vnoremap <leader>p "+p

"nnoremap <leader>y :<c-u>let @/=@"<cr>gvy:let [@/,@"]=[@",@/]<cr>/\V<c-r>=substitute(escape(@/,'/\'),'\n','\\n','g')<cr><cr>
"nnoremap <leader>* 0y$/\V<c-r>"<cr>
