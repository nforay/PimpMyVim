if empty(glob('~/.vim/autoload/plug.vim'))
        silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'
call plug#end()

if (has("termguicolors"))
        set termguicolors
endif

set listchars=tab:→\ ,eol:$
set list
set tabstop=4
set shiftwidth=4
set cursorline
set colorcolumn=81
set noshowmode
set laststatus=2
set shortmess=F
set number relativenumber

syntax on

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

let g:lightline = {
    \ 'colorscheme': 'onedark',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'fugitive#head'
    \ },
    \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
    \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
\ }
let g:onedark_terminal_italics = 1
let g:onedark_hide_endofbuffer = 1
let g:onedark_terminal_italics = 1
colorscheme onedark
