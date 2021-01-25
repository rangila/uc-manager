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

set iskeyword-=_

call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on':  'NERDTreeToggle' }
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'chriskempson/base16-vim'
Plug 'dyng/ctrlsf.vim'
"Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'Hydrotoast/mrepl.vim'
Plug 'wsdjeg/vim-fetch'
Plug 'zivyangll/git-blame.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'junegunn/goyo.vim'
Plug 'itchyny/lightline.vim'
Plug 'arcticicestudio/nord-vim'
"Plug 'psliwka/vim-smoothie'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'dense-analysis/ale'
"Plug 'maximbaz/lightline-ale'
if has('nvim')
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
	Plug 'Shougo/deoplete.nvim'
	Plug 'roxma/nvim-yarp'
	Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'zchee/deoplete-jedi'
Plug 'Shougo/deoplete-clangx'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

"let base16colorspace=256
"colorscheme base16-solarized-light
colorscheme nord

nnoremap Q <Nop>
nnoremap <F1> :NERDTreeFind<CR>
nnoremap <F2> :NERDTreeToggle<CR>
nnoremap <F7> :Goyo<CR>
nnoremap <F8> :set ignorecase! ignorecase?<CR>
tnoremap <Esc> <C-\><C-n>

let mapleader = "\<SPACE>"

" goyo
let g:goyo_width = '120'
let g:goyo_height = '80%'

"" LeaderF
"" =============================================================================
"let g:Lf_WindowPosition = 'popup'
"let g:Lf_PreviewInPopup = 1
let g:Lf_WildIgnore = { 'dir': [".ccls-cache"] }
let g:Lf_FollowLinks = 0
"let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_DefaultExternalTool = "ag"

"noremap <leader>fr :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
"noremap <leader>bb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
"noremap <leader>bl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>
"noremap <leader>ff :<C-U><C-R>=printf("Leaderf file %s", "")<CR><CR>
"noremap <leader>pf :<C-U><C-R>=printf("Leaderf file %s application/adp/", "")<CR><CR>

" ctrlsf
" =============================================================================
"nmap <leader>ss <Plug>CtrlSFPrompt
vmap <leader>sp <Plug>CtrlSFVwordPath
"vmap <leader>se <Plug>CtrlSFVwordExec
"nmap <leader>sp <Plug>CtrlSFCwordPath
"nmap <leader>sf <Plug>CtrlSFPwordPath


" git-blame

nnoremap <Leader>aa :<C-u>call gitblame#echo()<CR>

" gutentags
" =============================================================================

let g:gutentags_add_default_project_roots = 1
"let g:gutentags_project_root = ['.project']
let g:gutentags_generate_on_new = 1
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_empty_buffer = 0
let g:gutentags_cache_dir = expand('~/.cache/tags')
"command! -nargs=0 GutentagsClearCache call system('rm ' . g:gutentags_cache_dir . '/*')

" ctags fields
"    a: Access (or export) of class members
"    i: Inheritance information
"    l: Language of input file containing tag
"    m: Implementation information
"    n: Line number of tag definition
"    S: Signature of routine (e.g. prototype or parameter list)

let g:gutentags_ctags_extra_args = [
			\ '--extra=+fq',
			\ '--c++-kinds=+p',
			\ '--tag-relative=yes',
			\ '--fields=+ailmnS',
			\ ]

let g:gutentags_ctags_exclude = [
			\'target',
			\'node_modules',
			\'bundle.js',
			\'bazel-*',
			\ '*.git', '*.js.map', '.svn', '.hg',
			\'*.min.*', '*.swp', '*.bak', '*.tar.*',
			\'*.tex', '*.css', '*.json', '*.js',
			\'*.html', '*.svg', '*.m', '*.proto',
			\'*.xml', '*.inl', '*.ini', '*.txt',
			\]

"" FzF
"" =============================================================================
" cscope
"function! Cscope(option, query)
"  let color = '{ x = $1; $1 = ""; z = $3; $3 = ""; printf "\033[34m%s\033[0m:\033[31m%s\033[0m\011\033[37m%s\033[0m\n", x,z,$0; }'
"  let opts = {
"  \ 'source':  "cscope -dL" . a:option . " " . a:query . " | awk '" . color . "'",
"  \ 'options': ['--ansi', '--prompt', '> ',
"  \             '--multi', '--bind', 'alt-a:select-all,alt-d:deselect-all',
"  \             '--color', 'fg:188,fg+:222,bg+:#3a3a3a,hl+:104'],
"  \ 'down': '40%'
"  \ }
"  function! opts.sink(lines) 
"    let data = split(a:lines)
"    let file = split(data[0], ":")
"    execute 'e ' . '+' . file[1] . ' ' . file[0]
"  endfunction
"  call fzf#run(opts)
"endfunction
"
"" Invoke command. 'g' is for call graph, kinda.
"nnoremap <silent> <Leader>g :call Cscope('3', expand('<cword>'))<CR>

function! s:tags_sink(line)
	let parts = split(a:line, '\t')
	let excmd = matchstr(parts[2], '^.*\ze;')
	"let excmd = parts[2]
	echom "parts " . string(parts)
	echom "excmd " . string(excmd)
	execute 'silent e' parts[1]
	let [magic, &magic] = [&magic, 0]
	execute excmd
	let &magic = magic
endfunction

function! TagSelectWindow(tag)
        let l:taglist = map(taglist('^' . a:tag . '$'),
                \'v:val["kind"] . "\t" . v:val["filename"] . "\t" . v:val["cmd"]')
        call fzf#run({ 'source' : l:taglist, 'sink' : function('s:tags_sink'),
                \'window' : {'width': 0.9, 'height': 0.8},
		\'options' : '--reverse --bind=tab:down --header=' .
                \ a:tag })
endfunction

nnoremap <silent> <leader>gs :call TagSelectWindow(expand('<cword>'))<CR>

nnoremap <silent> <leader>tt :call fzf#vim#tags(expand('<cword>'))<CR>
nnoremap <silent> <leader>hh :call fzf#vim#history()<CR>
nnoremap <silent> <leader>bb :call fzf#vim#buffers()<CR>
nnoremap <silent> <leader>ll :call fzf#vim#buffer_lines()<CR>
nnoremap <silent> <leader>ff :call fzf#vim#files(".")<CR>
nnoremap <silent> <leader>fa :call fzf#vim#files("application/adp")<CR>

command! -nargs=+ -bang -complete=command FeedForward call fzf#run({
            \ 'source' : filter(split(execute(<q-args>), "\n"), {i,v->!empty(v)}),
            \ 'sink': function('s:ff_sink'),
            \ 'options' : <bang>0 ? '--tac' : ''})

" copy into @@, ignore leading index
function! s:ff_sink(item)
  let text = substitute(a:item, '\v^\>?\s*\d+\:?\s*', '', '')
  let @@ = empty(text) ? a:item : text
endfunction


" Deoplete
" =============================================================================
let g:deoplete#enable_at_startup = 1
"call deoplete#custom#option('sources', {
"			\ '_': ['ale', 'foobar'],
"			\})

let g:ale_c_clang_options="-I/home/f09620c/dev/ddad/"
let g:ale_cpp_clang_options="-I/home/f09620c/dev/ddad/"
