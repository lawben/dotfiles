set nocompatible

"""""""""""""""""""""
" Directories
"""""""""""""""""""""

silent call system('mkdir -p $HOME/.vim/undo')
set undodir=$HOME/.vim/undo/

silent call system('mkdir -p $HOME/.vim/swap')
set directory=$HOME/.vim/swap/

silent call system('mkdir -p $HOME/.vim/backup')
set backupdir=$HOME/.vim/backup/


""""""""""""""""""""
" Plugins
""""""""""""""""""""

" Install plugin manager automatically
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Editor
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'ctrlpvim/ctrlp.vim'

" Tools
Plug 'Raimondi/delimitMate'

" Code
Plug 'scrooloose/syntastic'
Plug 'Shougo/deoplete.nvim'

" Python
Plug 'zchee/deoplete-jedi'
Plug 'vim-python/python-syntax'
Plug 'ambv/black'

" Elixir
"Plug 'elixir-editors/vim-elixir'
"Plug 'slashmili/alchemist.vim'
"Plug 'elixir-lang/vim-elixir'
"Plug 'awetzel/elixir.nvim', { 'do': 'yes \| ./install.sh' }

call plug#end()


"""""""""""""""""""""""""
" Plugin Settings
"""""""""""""""""""""""""
" Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
let g:python3_host_prog = '/usr/local/bin/python3'

" Black
autocmd BufWritePre *.py execute ':Black'

" Python syntax
let g:python_highlight_all = 1

" Airline
let g:airline_theme='gruvbox'
let g:airline_solarized_bg='dark'

" Colorscheme
set background=dark
colorscheme gruvbox

" Syntastic
let g:syntastic_python_python_exec = 'python3'
"""""""""""""""""""""""""
" Editor Settings
"""""""""""""""""""""""""
set number
set autoindent
set mouse=a
syntax on
:set showmatch
hi MatchParen cterm=none ctermbg=darkgrey ctermfg=black
:highlight LineNr ctermfg=darkgrey
set laststatus=2
set showtabline=2
set noshowmode
set clipboard=unnamedplus

"""""""""""""""""""""""""
" Key Bindings
"""""""""""""""""""""""""
noremap L $
noremap H ^
noremap j gj
noremap k gk
noremap gj j
noremap gk k

" Disable arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Remove highlighting on enter
nnoremap <CR> :noh<CR><CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Scripts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" Return to last edit position when opening files.
function! ResumeCursorPosition()
  if line("'\"") > 0 && line("'\"") <= line("$") |
    exe "normal! g`\"" |
  endif
endfunction
autocmd BufReadPost * call ResumeCursorPosition()


""""""""""""""""""""""""
" Languages
""""""""""""""""""""""""
set expandtab
set ts=2 sts=2 sw=2
autocmd Filetype python setlocal ts=4 sts=4 sw=4
