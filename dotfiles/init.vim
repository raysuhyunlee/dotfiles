" ~/.config/nvim/init.vim — minimal neovim config
"
" Neovim ships sane defaults already: syntax on, filetype plugin indent on,
" hlsearch, incsearch, wildmenu, autoindent, showcmd, utf-8, ruler,
" `backspace=indent,eol,start`. So we only override what we actually want.

" --- plugins (vim-plug, auto-installed on first launch) ---
let s:plug = stdpath('data') . '/site/autoload/plug.vim'
if empty(glob(s:plug))
  silent execute '!curl -fLo ' . s:plug . ' --create-dirs '
        \ . 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(stdpath('data') . '/plugged')
Plug 'junegunn/seoul256.vim'    " low-contrast colorscheme, font-agnostic
" Plug 'tpope/vim-fugitive'     " uncomment for git wrapper
call plug#end()

" --- editor ---
set number                                    " line numbers
set mouse=a                                   " mouse in all modes
set tabstop=2 shiftwidth=2 softtabstop=2 expandtab  " 2-space indent
set termguicolors                             " 24-bit color

" --- colorscheme ---
let g:seoul256_background = 237               " 233 darkest .. 239 brightest
silent! colorscheme seoul256                  " silent! so first run (pre-install) won't error
