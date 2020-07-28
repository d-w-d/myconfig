"==================================================
" Pre-plugin Misc Setup
"==================================================
syntax on                           " Turn on syntax
let mapleader = " "                 " Make spacebar the leader
set clipboard=unnamed               " enables yanked stuff to be copied to mac clipboard
set backspace=indent,eol,start      " enables backspaces
set encoding=utf-8                  " Set encoding
colorscheme torte

"==================================================
" Begin Vundle setup
"==================================================
" 
" Initiate plugins first in order to call functions,
" variables, etc. later
" See: https://github.com/VundleVim/Vundle.vim for setup instructions
"
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" DO NOT EDIT:
set nocompatible                    " required
filetype off                        " required
set rtp+=~/.vim/bundle/Vundle.vim   " set the runtime path to include Vundle and initialize
call vundle#begin()
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" EDIT:
Plugin 'gmarik/Vundle.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'christoomey/vim-tmux-navigator'     " Move between vim windows and tmux panes with  ctrl-j, etc.
"Plugin 'Yggdroot/indentLine'
"Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Valloric/YouCompleteMe'                                     " autocomplete
Plugin 'mattn/emmet-vim'                                            " emmet webdev snippets
Plugin 'mattn/webapi-vim'                                           " emmet webdev snippets
Plugin 'scrooloose/nerdtree'                                        " enables file-tree searching
Plugin 'kien/ctrlp.vim'                                             " file-word-search utility
Plugin 'Chiel92/vim-autoformat'                                     " Autoformatting
Plugin 'kana/vim-submode'
Plugin 'ekalinin/dockerfile.vim'                                    " Enables :set syntax=Dockerfile
Plugin 'preservim/nerdcommenter'                                    " used to toggle comments
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}     " enables vim status line
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" DO NOT EDIT:
call vundle#end()            " required
filetype plugin indent on    " required
"==================================================
" End Vundle setup
"==================================================

"==================================================
" Post-Plugin Misc settings
"==================================================

let g:user_emmet_mode='inv'
let g:ctrlp_show_hidden = 1         " Have ctrlP find hidden files
"let g:user_emmet_leader_key='<C-Space>'
let g:user_emmet_settings = webapi#json#decode(join(readfile(expand('~/.myconfig/.vim-emmet-snippets.json')), "\n"))

"==================================================
"==================================================
" Shortcuts
"==================================================
"==================================================

"==================================================
" Non-Leader Shortcuts
"==================================================

" Shortcut to autoformat the doc
noremap <C-f> :Autoformat<CR>

" Make Y behave similarly to C and D
noremap Y y$

" Overwrite: "CTRL-A    2    add N to number at/after cursor"
map <C-a> ^
imap <C-a> <ESC>I
" Overwrite: "CTRL-E         scroll N lines upwards (N lines Extra)"
map <C-e> g_
imap <C-e> <ESC>A

" Fast exit from insert mode
imap kj <Esc>
"vmap kj <Esc> # Not in visual; will cancel your selections when changing dirn

" Faster scrolling with shift
noremap <S-j> 3jzz
noremap <S-k> 3kzz
noremap <S-h> b
noremap <S-l> w

" Jump to beginning/end of line
noremap <Leader>b ^
vnoremap <Leader>e $h
nnoremap <Leader>e $

" Enables up/down on single-wrapped lines whilst preserving standard jumpto
" See: https://stackoverflow.com/a/21000307/8620332
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'

" Select all file
nmap VV ggVG

" Toggle file-tree display
map <C-n> :NERDTreeToggle<CR>

" More-Width-in-present-window shortcut
nmap <Leader>mw :vertical resize +2<cr>
" Much-More-Width-in-present-window shortcut
nmap <Leader>mmw :vertical resize +10<cr>
" Less-Width-in-present-window shortcut
nmap <Leader>lw :vertical resize -2<cr>
" Much-Less-Width-in-present-window shortcut
nmap <Leader>mlw :vertical resize -10<cr>
" More-Height-in-present-window shortcut
nmap <Leader>mh :resize +2<cr>
" Much-More-Height-in-present-window shortcut
nmap <Leader>mmh :resize +10<cr>
" Less-Height-in-present-window shortcut
nmap <Leader>lh :resize -2<cr>
" Much-Less-Height-in-present-window shortcut
nmap <Leader>mlh :resize -10<cr>

" Move around in command and insert mode with CTRL-hjkl
inoremap <C-h> <ESC>i
inoremap <C-j> <ESC>ja
inoremap <C-k> <ESC>ka
inoremap <C-l> <ESC>la
cnoremap <C-h> <ESC>i
cnoremap <C-j> <ESC>ja
cnoremap <C-k> <ESC>ka
cnoremap <C-l> <ESC>la

"==================================================
" Leader Shortcuts
"==================================================

" Fancy paste text onto line below/above
nnoremap <leader>p m`o<ESC>p``
nnoremap <leader>P m`O<ESC>p``

" Emmet shortcut
"noremap <C-Space> <C-y>,
map <NUL> <C-y>,
imap <NUL> <C-y>,
"map <Leader>e <C-y>,
noremap <Leader>g viw

" Toggle relative numbering
nmap <Leader>nu :set rnu! <cr>
" Toggle absolute numbering
nmap <Leader>rnu :set nu! <cr>

" Replacement for J = Join
map <Leader>j :join!<CR>

" Make color scheme light
nmap <Leader>l :colorscheme morning<CR>
" Make color scheme light
nmap <Leader>d :colorscheme desert<CR>

" Toggle line commenting; see: https://github.com/preservim/nerdcommenter
nmap com <Leader>c<Space>
vmap com <Leader>c<Space>

" Enable folding with the spacebar; maps to binding given by symplfold plugin
nnoremap <Leader>f za

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Alter Cut-Paste Behavior:
"   By default in vim, whatever you delete goes into the register used to then paste.
"   I don't like this because I often want to repeat-paste the same content.
"   These functions allow me to toggle between default and my own modified
"   behavior, where 'x' acts like a classic delete key, and 'd' acts like a
"   classic cut command. Yes, this feels backwards, but actions like 'ddp' are
"   so classic to vim that I wanted to preserve the cut-like bevior of 'd',
"   but without the overwrite-upon-paste-over behavior. 
"   Note: if you want to do 'dd' without copying to register, then you need to
"   the lines visually and then use 'x' to delete without copying.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! DisableDefaultCutPasteRegisterBehavior()
    " On this approach 'x' acts like classic 'delete' key
    nnoremap x "_x
    vnoremap x "_d
    noremap X "_X
    " On this approach 'd' acts like classic 'cut' 
    noremap d "xd
    noremap dd "xdd
    noremap D "xD
    noremap y "xy
    noremap yy "xyy
    noremap Y "xY
    noremap p "xp
    noremap P "xP
endfunction

function! EnableDefaultCutPasteRegisterBehavior()
    unmap d
    unmap dd
    unmap D
    unmap x
    unmap X
    unmap p
    unmap P
    unmap y
    unmap yy
    unmap Y
endfunction

call DisableDefaultCutPasteRegisterBehavior()

function! ToggleSideEffects()
    if mapcheck("d", "n") == ""
        call DisableDefaultCutPasteRegisterBehavior()
        echo 'Default cut-paste-register behavior DISABLED'
    else
        call EnableDefaultCutPasteRegisterBehavior()
        echo 'Default cut-paste-register behavior ENABLED'
    endif
endfunction
nnoremap <Leader>s :call ToggleSideEffects()<CR>

"==================================================
" Indent Guides Config
"==================================================

" TODO: fix the mess that is indent highlighting
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=cyan ctermbg=lightgrey
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=blue ctermbg=grey


"let g:indentLine_setColors = 0
"let g:indentLine_char = '.'
"set list
"set listchars=tab:→\ ,trail:_,space:·
"set listchars=tab:→\ ,trail:·
"set listchars=tab:>\ ,eol:$,trail:-
"set listchars=space:·
"highlight WhiteSpaceBol guifg=blue
"highlight WhiteSpaceMol guifg=white
"match WhiteSpaceMol / /
"2match WhiteSpaceBol /^ \+/
"highlight LeadingSpace ctermbg=red guibg=red
"highlight TrailingSpace ctermbg=red guibg=red
"highlight LeadingTab ctermbg=red guibg=green
"highlight TrailingTab ctermbg=red guibg=green
"call matchadd('LeadingSpace', '^\s\+', 80)
"call matchadd('TrailingSpace', '\s\+$', 80)
"call matchadd('LeadingTab', '^t\+', 99)
"call matchadd('TrailingTab', '\t\+$', 99)

"==================================================
" Terminal Settings
"==================================================

set splitbelow
set splitright
"set termwinsize=8x0

"==================================================
" Page numbering
"==================================================

set number                          " turn absolute line numbers on
set nu rnu                          " turn hybrid line numbers on

"==================================================
" Tabbing
"==================================================

set tabstop=4                   " Set tab size to 4
set shiftwidth=4                " affects what happens when you press >>, << or ==
set expandtab                   " affects what happens when you press the <TAB> key.
" if 'expandtab' is set, pressing the <TAB> key will
" insert 'softtabstop' amount of space characters

"==================================================
" Enable Folding (see: https://bit.ly/2YRCucT)
"==================================================

set foldmethod=indent
set foldlevel=99
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
" Sub-mode pluging functionality
"==================================================

" Horizontal fast scrolling
call submode#enter_with('fastLeft', 'n', '', '<leader>h', '3h')
call submode#enter_with('fastRight', 'n', '', '<leader>l', '3l')
call submode#map('fastLeft', 'n', '', 'h', '3h')
call submode#map('fastRight', 'n', '', 'l', '3l')






