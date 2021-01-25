" set cursorline
" set mouse=a
set mouse+=a
set ignorecase
set showcmd
syntax on
set number
set relativenumber
set autoindent
set smartindent
set background=dark
" this is a comment
" for making indentiation with tabs and spaces with 4 char
set shiftwidth=4
set softtabstop=4
inoremap kj <Esc> 
cnoremap kj <Esc>
" copy from register " to +(clipboard)
let @+=@"
let @*=@"
noremap Y "+y
noremap P "+p

" declare list of plugins
" Plug 'githubuser/plugin' 
" Plug 'morhetz/gruvbox'
