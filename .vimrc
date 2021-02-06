" set cursorline
" set mouse=a
" syntax highlighter vim-polyglot
syntax on
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

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'gruvbox-material/vim', {'as': 'gruvbox-material'}
Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline'
call plug#end()

" nocompatible from vim-polyglot troubleshooting
" set nocompatible

" Important!!
if has('termguicolors')
    set termguicolors
endif

" For dark version.
set background=dark

" Set contrast.
" This configuration option should be placed before `colorscheme gruvbox-material`.
" Available values: 'hard', 'medium'(default), 'soft'
let g:gruvbox_material_background = 'hard'
let g:gruvbox_contrast_dark = 'hard'

" colorscheme gruvbox-material
let g:airline_theme = 'gruvbox_material'
let g:airline#extensions#tabline#enabled = 1
colorscheme archman

" insert line without leaving normal mode
nnoremap on o<Esc>
nnoremap On O<Esc>
