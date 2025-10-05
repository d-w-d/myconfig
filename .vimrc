"==================================================
" Pre-plugin Misc Setup
"==================================================
syntax on                           " Turn on syntax
let mapleader = " "                 " Make spacebar the leader
"set clipboard^=unnamed
set clipboard=unnamedplus
set backspace=indent,eol,start      " enables backspaces
set encoding=utf-8                  " Set encoding
set scrolloff=5
colorscheme torte

"let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_global_ycm_extra_conf = '~/.myconfig/.ycm_extra_conf.py'


"==================================================
" BEGIN VUNDLE SETUP
"==================================================
"
" Initiate plugins first in order to call functions,
" variables, etc. later
" See: https://github.com/VundleVim/Vundle.vim for setup instructions
"
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" DO NOT EDIT:
set nocompatible                    " REQUIRED
filetype off                        " REQUIRED
set rtp+=~/.vim/bundle/Vundle.vim   " SET THE RUNTIME PATH TO INCLUDE VUNDLE AND INITIALIZE
call vundle#begin()
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" EDIT:
Plugin 'gmarik/Vundle.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'christoomey/vim-tmux-navigator'     " Move between vim windows and tmux panes with ctrl-j, etc.
"Plugin 'Yggdroot/indentLine'
"Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'ycm-core/YouCompleteMe', {'do': '!echo \"Skipping YCM compilation - will be built manually\"'}                                     " autocomplete
"Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'mattn/emmet-vim'                                            " emmet webdev snippets
Plugin 'mattn/webapi-vim'                                           " emmet webdev snippets
Plugin 'scrooloose/nerdtree'                                        " enables file-tree searching
Plugin 'kien/ctrlp.vim'                                             " file-word-search utility
Plugin 'Chiel92/vim-autoformat'                                     " Autoformatting
Plugin 'kana/vim-submode'
Plugin 'ekalinin/dockerfile.vim'                                    " Enables :set syntax=Dockerfile
Plugin 'preservim/nerdcommenter'                                    " used to toggle comments
Plugin 'ojroques/vim-oscyank'                                       " enable copying to board remote
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}     " enables vim status line
Plugin 'maksimr/vim-jsbeautify'                                     " format js-related docs
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" DO NOT EDIT:
call vundle#end()            " required
filetype plugin indent on    " required
"==================================================
" END VUNDLE SETUP
"==================================================

"==================================================
" POST-PLUGIN MISC SETTINGS
"==================================================

let g:oscyank_max_length = 1000000
let g:user_emmet_mode='inv'
let g:ctrlp_show_hidden = 1         " Have ctrlP find hidden files
"let g:user_emmet_leader_key='<C-Space>'
"let g:user_emmet_settings = webapi#json#decode(join(readfile(expand('~/.myconfig/.vim-emmet-snippets.json')), "\\n"))

"==================================================
"==================================================
" SHORTCUTS
"==================================================
"==================================================

"==================================================
" NON-LEADER SHORTCUTS
"================================================

" FIND AND SELECT NEXT OCCURANCE OF YANKED CONTENT
noremap ff <ESC>:let @/=@*<CR><ESC>wgn
noremap FF <ESC>:let @/=@*<CR><ESC>bbgN

" SHORTCUT TO AUTOFORMAT THE DOC
noremap <C-f> :Autoformat<CR>

" MAKE Y BEHAVE SIMILARLY TO C AND D
noremap Y y$

" OVERWRITE: "CTRL-A    2    ADD N TO NUMBER AT/AFTER CURSOR"
"map <C-a> ^
imap <C-a> <ESC>I
" OVERWRITE: "CTRL-E         SCROLL N LINES UPWARDS (N LINES EXTRA)"
"map <C-e> g_
imap <C-e> <ESC>A

" FAST SWITCHING BETWEEN MODES
imap kj <Esc>
imap <C-i> <Esc>l
imap <C-n> <Esc>l

" FASTER SCROLLING WITH SHIFT
noremap <S-j> 3jzz
noremap <S-k> 3kzz
noremap <S-h> b
noremap <S-l> w
vnoremap <S-l> e

" ENABLES UP/DOWN ON SINGLE-WRAPPED LINES WHILST PRESERVING STANDARD JUMPTO
" SEE: HTTPS://STACKOVERFLOW.COM/A/21000307/8620332
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'

" SELECT ALL FILE
nmap VV ggVG

" MOVE AROUND IN COMMAND AND INSERT MODE WITH CTRL-HJKL
inoremap <C-h> <ESC>i
inoremap <C-j> <ESC>ja
inoremap <C-k> <ESC>ka
inoremap <C-l> <ESC>la
cnoremap <C-h> <ESC>i
cnoremap <C-j> <ESC>ja
cnoremap <C-k> <ESC>ka
cnoremap <C-l> <ESC>la

"==================================================
" LEADER SHORTCUTS
"==================================================

" ENABLE EASY SURROUNDING OF SELECTED TEXT WITH BRACKETS
vnoremap <Leader>[  c[]<Esc>P
vnoremap <Leader>(  c()<Esc>P
vnoremap <Leader>{  c{}<Esc>P

" LEADER+F IN VISUAL MODE WILL CAUSE
vnoremap <Leader>f :s/\%Vfoo\%V/bar/gc

" WHEN YOU WANT TO REPLACE LOTS OF INSTANCES OF THE LAST ITEM YOU SEARCHED FOR
" THEN CALL THIS
noremap <Leader>sub :%s//new-string/gc


" JUMP TO BEGINNING/END OF LINE
noremap <Leader>b ^
vnoremap <Leader>e $h
nnoremap <Leader>e $

" TOGGLE FILE-TREE DISPLAY; CRUDELY SET MENU TO WIDTH 20
" THIS MIGHT WELL LEAD TO CRAP RESULTS IF WE HAVE MULTIPLE SPLITS
map <Leader>n :NERDTreeToggle <bar> vertical resize 20<CR>

" MORE-WIDTH-IN-PRESENT-WINDOW SHORTCUT
nmap <Leader>mw :vertical resize +2<cr>
" MUCH-MORE-WIDTH-IN-PRESENT-WINDOW SHORTCUT
nmap <Leader>mmw :vertical resize +10<cr>
" LESS-WIDTH-IN-PRESENT-WINDOW SHORTCUT
nmap <Leader>lw :vertical resize -2<cr>
" MUCH-LESS-WIDTH-IN-PRESENT-WINDOW SHORTCUT
nmap <Leader>mlw :vertical resize -10<cr>
" MORE-HEIGHT-IN-PRESENT-WINDOW SHORTCUT
nmap <Leader>mh :resize +2<cr>
" MUCH-MORE-HEIGHT-IN-PRESENT-WINDOW SHORTCUT
nmap <Leader>mmh :resize +10<cr>
" LESS-HEIGHT-IN-PRESENT-WINDOW SHORTCUT
nmap <Leader>lh :resize -2<cr>
" MUCH-LESS-HEIGHT-IN-PRESENT-WINDOW SHORTCUT
nmap <Leader>mlh :resize -10<cr>
" FANCY PASTE TEXT ONTO LINE BELOW/ABOVE
nnoremap <leader>p m`o<ESC>p``
nnoremap <leader>P m`O<ESC>p``

" EMMET SHORTCUT
" NOREMAP <C-SPACE> <C-Y>,
map <NUL> <C-y>,
imap <NUL> <C-y>,
"map <Leader>e <C-y>,
"noremap <Leader>g viw

" TOGGLE RELATIVE NUMBERING
nmap <Leader>nu :set rnu! <cr>
" TOGGLE ABSOLUTE NUMBERING
nmap <Leader>rnu :set nu! <cr>

" REPLACEMENT FOR J = JOIN
vmap <Leader>j :join!<CR>

" MAKE COLOR SCHEME LIGHT
nmap <Leader>l :colorscheme morning<CR>
" MAKE COLOR SCHEME LIGHT
nmap <Leader>d :colorscheme desert<CR>

" TOGGLE LINE COMMENTING; SEE: HTTPS://GITHUB.COM/PRESERVIM/NERDCOMMENTER
nmap <Leader>/ <Leader>c<Space>
vmap <Leader>/ <Leader>c<Space>

" ENABLE FOLDING WITH THE SPACEBAR; MAPS TO BINDING GIVEN BY SYMPLFOLD PLUGIN
nnoremap <Leader>f za

"
" WORKING APPROACH TO YANKING CONTENT INTO CLIPBOARD USES THIS LIBRARY:
" https://github.com/ojroques/vim-oscyank
" NOTE: Sep 2023: a breaking change was introduced;
"       I had to go to ~/.vim/bundle/vim-oscyank and run:
"       `sudo git checkout v1.0.0`  to get it to work again!
noremap <Leader>c :OSCYankReg + <CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Alter Cut-Paste Behavior:
"   By default in vim, whatever you delete goes into the register used to then paste.
"   I don't like this because I often want to repeat-paste the same content.
"   These functions allow me to toggle between default and my own modified
"   behavior, where 'x' acts like a classic delete key, and 'd' acts like a
"   classic cut command. Yes, this feels backwards, but actions like 'ddp' are
"   so classic to vim that I wanted to preserve the cut-like bevior of 'd',
"   but without the overwrite-upon-paste-over behavior.
"
"   - Note: if you want to do 'dd' without copying to register, then you need to select
"   the lines visually and then use 'x' to delete without copying.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Function to modify cut-paste-register behavior
" Note: we are writing to '*' register and then copying to the '+' register.
" '*' seems to be needed on the Mac, but my understanding is that linux and
" windows also like to use the '+' register for their system clipboards.
" Note: I also add a bunch of marks with ma -> `a (mark a -> goto a) syntax
" Note: read e.g. `noremap yy my"*yy:let @+=@*<CR>` as
"       `mark y here; use register '*'; yy; copy register * to register +`
" Note: the register "_ is the "blackhole" register
function! DisableDefaultCutPasteRegisterBehavior()
    " On this approach 'x' acts like classic 'delete' key
    nnoremap x mx"_x
    vnoremap x mx"_d
    noremap X mx"_X
    " On this approach 'c' does not copy to working registers
    vnoremap c mc"_c
    noremap C mc"_C
    noremap CC ^mc"_C
    " On this approach 'd' acts like classic 'cut' (i.e. copies to working regiesters
    vnoremap d md"*d:let @+=@*<CR>
    noremap dd md"*ddmd:let @+=@*<CR>
    noremap D md"*DmD:let @+=@*<CR>
    noremap y my"*y:let @+=@*<CR>
    "noremap y "*y:let @+=@*<CR>:call SendViaOSC52(getreg('"*'))<CR>
    noremap yw my"*yw:let @+=@*<CR>
    noremap yiw my"*yiw:let @+=@*<CR>
    noremap yy my"*yy:let @+=@*<CR>
    vnoremap Y my"*y`>:let @+=@*<CR>
    " Re-yank what just got pasted in visual mode
    vnoremap p mppgv"*y
    " Mark where you start visual mode; go there with `v
    noremap v mvv
    noremap V mvV
    noremap <C-v> mv<C-v>
endfunction

" Function to restore default behavior
function! EnableDefaultCutPasteRegisterBehavior()
    unmap d
    unmap dd
    unmap D
    unmap x
    unmap X
    unmap p
    "  unmap P
    unmap y
    unmap yy
    unmap Y
endfunction

" Call function on vim startup to use modified behavior
call DisableDefaultCutPasteRegisterBehavior()

" Define function to toggle between modified and default behavior
function! ToggleDefaultCutPasteRegisterBehavior()
    if mapcheck("d", "n") == ""
        call DisableDefaultCutPasteRegisterBehavior()
        echo 'Default cut-paste-register behavior DISABLED'
    else
        call EnableDefaultCutPasteRegisterBehavior()
        echo 'Default cut-paste-register behavior ENABLED'
    endif
endfunction
" Define shortcut to toggle between default and modified cut-paste behavior
nnoremap <Leader>s :call ToggleDefaultCutPasteRegisterBehavior()<CR>

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
"set listchars=tab:→\\ ,trail:_,space:·
"set listchars=tab:→\\ ,trail:·
"set listchars=tab:>\\ ,eol:$,trail:-
"set listchars=space:·
"highlight WhiteSpaceBol guifg=blue
"highlight WhiteSpaceMol guifg=white
"match WhiteSpaceMol / /
"2match WhiteSpaceBol /^ \\+/
"highlight LeadingSpace ctermbg=red guibg=red
"highlight TrailingSpace ctermbg=red guibg=red
"highlight LeadingTab ctermbg=red guibg=green
"highlight TrailingTab ctermbg=red guibg=green
"call matchadd('LeadingSpace', '^\\s\\+', 80)
"call matchadd('TrailingSpace', '\\s\\+$', 80)
"call matchadd('LeadingTab', '^t\\+', 99)
"call matchadd('TrailingTab', '\\t\\+$', 99)


"==================================================
" YouCompleteMe Settings
"==================================================

" Toggle YCM information box
nmap <silent> <Leader>t <plug>(YCMHover)

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
au BufRead,BufNewFile *.js,*.ts,*.ts,.py,*.pyw,*.c,*.h match BadWhitespace /\\s\\+$/

"==================================================
" Make _ a word boundary;
" NOTE: use cw to select _-separated words;
"           cW to select whole thing
"==================================================
"set iskeyword-=_

"==================================================
" Change color when in insert mode
"==================================================
"autocmd InsertEnter * set cursorline | highlight CursorLine guibg=darkgrey ctermbg=darkgrey | highlight Normal ctermbg=darkred
"autocmd InsertLeave * set nocursorline | highlight clear | colorscheme torte

"autocmd InsertEnter * colorscheme evening
"autocmd InsertLeave * colorscheme torte

autocmd InsertEnter * colorscheme industry | set cursorline | highlight CursorLine guibg=darkgrey ctermbg=darkgrey
autocmd InsertLeave * colorscheme torte

"==================================================
" Add short cut :Sw to save with sudo permissions
" even if you forgot to open vim with sudo
"==================================================
command! -nargs=0 Sw w !sudo tee % > /dev/null

"==================================================
" Settings for https://github.com/maksimr/vim-jsbeautify
" to format js-related docs
"==================================================
""" Format whole doc
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
autocmd FileType typescript noremap <buffer>  <c-f> :call JsBeautify()<cr>
autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
""" Format selection
autocmd FileType javascript vnoremap <buffer>  <c-f> :call RangeJsBeautify()<cr>
autocmd FileType typescript vnoremap <buffer>  <c-f> :call RangeJsBeautify()<cr>
autocmd FileType json vnoremap <buffer> <c-f> :call RangeJsonBeautify()<cr>
autocmd FileType jsx vnoremap <buffer> <c-f> :call RangeJsxBeautify()<cr>
autocmd FileType html vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
autocmd FileType css vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>
