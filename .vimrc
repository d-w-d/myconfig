"==================================================
" Misc settings
"==================================================

syntax on                           " Turn on syntax
set clipboard=unnamed               " enables yanked stuff to be copied to mac clipboard
set backspace=indent,eol,start      " enables backspaces  
set encoding=utf-8                  " Set encoding
let g:ctrlp_show_hidden = 1         " Have ctrlP find hidden files

"==================================================
" Page numbering
"==================================================

set number                          " turn absolute line numbers on 
set nu rnu                          " turn hybrid line numbers on 
" Toggle relative numbering
nmap <Leader>l :set rnu! <cr>
" Toggle absolute numbering
nmap <Leader>L :set nu! <cr>

"==================================================
" Tabbing
"==================================================

set tabstop=4                   " Set tab size to 4
set shiftwidth=4                " affects what happens when you press >>, << or ==
set expandtab                   " affects what happens when you press the <TAB> key. 
                                " if 'expandtab' is set, pressing the <TAB> key will 
                                " insert 'softtabstop' amount of space characters

"==================================================
" Shortcuts
"==================================================

noremap <C-f> :Autoformat<CR>

" Jump to beginning/end of line
map <C-a> ^
imap <C-a> <ESC>I
vmap <C-a> ^
map <C-e> g_
imap <C-e> <ESC>A
vmap <C-e> g_

" Fast exist from insert mode
imap kj <Esc>

" Fast/smooth vertical scrolling
nmap <C-j> 3jzz
nmap <C-k> 3kzz

" Select all file
nmap VV ggVG

" Toggle file-tree display
map <C-n> :NERDTreeToggle<CR>

" Toggle line commenting
nmap com \c<Space>
vmap com \c<Space>

" More-Width-in-present-window shortcut
nmap MW :vertical resize +10<cr>
" Less-Width-in-present-window shortcut
nmap LW :vertical resize -10<cr>
" More-Height-in-present-window shortcut
nmap MH :resize +10<cr>
" Less-Height-in-present-window shortcut
nmap LH :resize -10<cr>

" Shortcuts for moving between vim windows
nmap JJ <C-w><Up>
nmap KK <C-w><Down>
nmap HH <C-w><Left>
nmap LL <C-w><Right>


"==================================================
" Enable Folding (see: https://bit.ly/2YRCucT)
"==================================================

set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za 
" Enable docstring for folded content
let g:SimpylFold_docstring_preview=1

"==================================================
" Setup autoindents in python
"==================================================

au BufNewFile,BufRead *.py set
    \ tabstop=4
    \ softtabstop=4
    \ shiftwidth=4
    \ textwidth=79
    \ expandtab
    \ autoindent
    \ fileformat=unix

"==================================================
" Highlight white space
"==================================================
highlight BadWhitespace ctermbg=red guibg=red
au BufRead,BufNewFile *.js,*.ts,*.ts,.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

"==================================================
" Begin Vundle setup
"==================================================
set nocompatible                    " required
filetype off                        " required
set rtp+=~/.vim/bundle/Vundle.vim   " set the runtime path to include Vundle and initialize
call vundle#begin()
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Plugin 'gmarik/Vundle.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'Valloric/YouCompleteMe'                                     " autocomplete
Plugin 'scrooloose/nerdtree'                                        " enables file-tree searching
Plugin 'kien/ctrlp.vim'                                             " file-word-search utility
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}     " enables vim status line
Plugin 'Chiel92/vim-autoformat'
Plugin 'preservim/nerdcommenter'                                    " used to toggle comments
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
call vundle#end()            " required
filetype plugin indent on    " required

