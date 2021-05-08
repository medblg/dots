" set cursorline
" set mouse=a
" syntax highlighter vim-polyglot
set encoding=utf-8
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

" test the new remapping, maybe it will be my default instead of jk
nnoremap <C-I> <C-I>
vnoremap <Tab> <Esc>gV
onoremap <Tab> <Esc>
inoremap <Tab> <Esc>`^
"
" buffers
map <C-J> :bnext<CR>
map <C-K> :bprev<CR>
nnoremap <Leader>b :ls<CR>:b<Space>

" copy from register " to +(clipboard)
" need to enable +clipboard, install vim-gtk3(gvim)
let @+=@"
let @*=@"
noremap Y "+y
noremap P "+p
 
" declare list of plugins
" Plug 'githubuser/plugin' 
" Plug 'morhetz/gruvbox'

" automate installation of vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" Plug 'tpope/vim-sensible'
" Plug 'gruvbox-material/vim', {'as': 'gruvbox-material'}
" Plug 'sheerun/vim-polyglot'
" Plug 'vim-airline/vim-airline'
" Plug 'JamshedVesuna/vim-markdown-preview'
" Plug 'Valloric/YouCompleteMe'
Plug 'morhetz/gruvbox'
call plug#end()

" https://github.com/morhetz/gruvbox/wiki/Installation
autocmd vimenter * ++nested colorscheme gruvbox


" nocompatible from vim-polyglot troubleshooting
" set nocompatible

" Important!!
"if has('termguicolors')
"    set termguicolors
"endif

" For dark version.
set background=dark

" Set contrast.
" This configuration option should be placed before `colorscheme gruvbox-material`.
" Available values: 'hard', 'medium'(default), 'soft'
"let g:gruvbox_material_background = 'hard'
"let g:gruvbox_contrast_dark = 'hard'

" colorscheme gruvbox-material
"let g:airline_theme = 'gruvbox_material'
"let g:airline#extensions#tabline#enabled = 1
"colorscheme archman

" insert line without leaving normal mode
nnoremap on o<Esc>
nnoremap On O<Esc>
" just Explorer with current working dir
set autochdir
map zz :e.<CR>

" going throw buffers
" let vim_markdown_preview_github=1
"let vim_markdown_preview_pandoc=1

" setting powerline
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

set laststatus=2
