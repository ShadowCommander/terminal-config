nnoremap <Space> <Nop>
let mapleader ="\<Space>"

noremap <C-H> <C-W>h
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-L> <C-W>l
inoremap jk <Esc>

noremap <leader>[ [{
noremap <leader>] ]}

set hlsearch
set incsearch
set showcmd
set rnu nu
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
"  EasyMotion
map <leader>f <Plug>easymotion-s
map <leader>e <Plug>easymotion-f

nnoremap <leader>y :<c-u>let @/=@"<cr>gvy:let [@/,@"]=[@",@/]<cr>/\V<c-r>=substitute(escape(@/,'/\'),'\n','\\n','g')<cr><cr>
nnoremap <leader>* 0y$/\V<c-r>"<cr>
