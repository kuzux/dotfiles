set nocompatible

set relativenumber
set number

set ts=4
set sw=4
set expandtab
set smarttab

set ruler

set history=5000
set nobackup

set ignorecase
set smartcase
set incsearch

if has("mouse")
    set mouse=a
endif

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'vim-syntastic/syntastic'
Plugin 'rust-lang/rust.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'junegunn/fzf'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'

" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on
syntax enable

" syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:solarized_termcolors = 256
set background=dark
colorscheme solarized

nnoremap <Leader>f :FZF<CR>
nnoremap <Leader>c :SyntasticCheck
nnoremap <Leader>t :TagbarToggle<CR>
nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <Leader>b :buffers<CR>

" terminal config
tnoremap <Esc> <C-\><C-n>
