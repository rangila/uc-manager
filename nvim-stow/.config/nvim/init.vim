" Forget being compatible with good ol' vi
set nocompatible

set directory=~/uc-manager/nvim-stow/.config/nvim/swp
set nobackup
set nowritebackup

set shiftwidth=4
set tabstop=4
set et
setlocal cindent
set number

set hidden
set noreadonly
set lazyredraw
set showmode
set path+=**
set wildmode=longest:full
set wildmenu
set ruler
"set cursorline
syntax on
syntax enable

call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on':  'NERDTreeToggle' }
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'chriskempson/base16-vim'
Plug 'dyng/ctrlsf.vim'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'Hydrotoast/mrepl.vim'
Plug 'wsdjeg/vim-fetch'
Plug 'zivyangll/git-blame.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'junegunn/goyo.vim'
Plug 'itchyny/lightline.vim'
Plug 'arcticicestudio/nord-vim'
call plug#end()

"let base16colorspace=256
"colorscheme base16-solarized-light
colorscheme nord

nnoremap Q <Nop>
nnoremap <F1> :NERDTreeFind<CR>
nnoremap <F2> :NERDTreeToggle<CR>
nnoremap <F12> :Goyo<CR>
nnoremap <F9> :set ignorecase! ignorecase?<CR>
tnoremap <Esc> <C-\><C-n>

let mapleader = "\<SPACE>"

" goyo
let g:goyo_width = '120'
let g:goyo_height = '80%'

" LeaderF
" =============================================================================
"let g:Lf_WindowPosition = 'popup'
"let g:Lf_PreviewInPopup = 1
let g:Lf_WildIgnore = { 'dir': [".ccls-cache"] }
let g:Lf_FollowLinks = 0
"let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_DefaultExternalTool = "ag"

noremap <leader>fr :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>bb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>bl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>
noremap <leader>ff :<C-U><C-R>=printf("Leaderf file %s", "")<CR><CR>
noremap <leader>pf :<C-U><C-R>=printf("Leaderf file %s application/adp/", "")<CR><CR>


" git-blame

nnoremap <Leader>aa :<C-u>call gitblame#echo()<CR>

" gutentags

let g:gutentags_project_root = ['ctags', 'cscope']

