" Vim-Plug PLUGINS

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" INSTALLED PLUGINS - use single quotes ''
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'cskeeters/vim-smooth-scroll'

Plug 'neomake/neomake' "Neomake syntax checking
" Plug 'w0rp/ale'      " Lint syntax checking
Plug 'valloric/youcompleteme' " Code completion


Plug 'itchyny/lightline.vim'
Plug 'dracula/vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'joshdick/onedark.vim'
Plug 'tomasr/molokai'
Plug 'jnurmine/Zenburn'
Plug 'morhetz/gruvbox'

" Initialize plugin system
call plug#end()

" Neomake full config: when writing or reading a buffer, and on changes in insert and
" normal mode (after 1s; no delay when writing).
call neomake#configure#automake('nrwi', 500)"

" OTHER SETTINGS BEGIN HERE

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif
	
set clipboard=unnamedplus 
set background=dark
colorscheme gruvbox " molokai / delek

set foldmethod=indent
set foldlevel=99

set number
set relativenumber

let mapleader = "\<Space>"

let g:netrw_liststyle = 3
let g:netrw_browse_split = 3

" open error/warning list
nnoremap <leader>e :lopen<CR>
" close preview
nnoremap <leader>x :pclose<CR> 

let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion = 1

nnoremap <leader>d :YcmCompleter GetDoc<CR>
nnoremap <leader>j :YcmCompleter GoTo<CR>
