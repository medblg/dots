" set cursorline
" set mouse=a
" syntax highlighter vim-polyglot
" #############################
" custom settings
" #############################
set encoding=utf-8
syntax on
set mouse+=a
set ignorecase
set showcmd
set number
set relativenumber
set autoindent
set smartindent
set background=dark
" use the already opened window instead of creating another
set switchbuf=useopen
" 4 char indentiation, space and tabs
set shiftwidth=4
set softtabstop=4
set laststatus=2
set background=dark


" ##############################
" custom remaps
" ##############################

" go to normal via kj
inoremap kj <Esc> 
cnoremap kj <Esc>
" got to normal via tab
nnoremap <C-I> <C-I>
vnoremap <Tab> <Esc>gV
onoremap <Tab> <Esc>
inoremap <Tab> <Esc>`^

" saving with c-s, adding vim alias to not conflict with XOFF
" nmap <c-s> :w<cr>
" imap <c-s> <esc>:w<cr>a

" edit, source vimrc
nnoremap ev :e $MYVIMRC<CR>
nnoremap sv :so $MYVIMRC<CR>

" jumpt btwn buffers
map <C-J> :bnext<CR>
map <C-K> :bprev<CR>
nnoremap <Leader>b :ls<CR>:b<Space>

" toggle edit btwn 2 recent files
nmap <leader>bb <c-^><cr>

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
Plug 'morhetz/gruvbox'
call plug#end()

" https://github.com/morhetz/gruvbox/wiki/Installation
autocmd vimenter * ++nested colorscheme gruvbox


" insert line without leaving normal mode
nnoremap on o<Esc>
nnoremap On O<Esc>
" just Explorer with current working dir
set autochdir
map zz :e.<CR>

map xx :!./%<CR>

" setting powerline
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup
