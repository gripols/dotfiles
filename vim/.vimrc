" Basic Settings
set nocompatible          " Disable compatibility with Vi
set shell=zsh             " Set shell to zsh
set clipboard=unnamedplus " Use system clipboard
set encoding=utf-8        " Set encoding
set fileencoding=utf-8    " Set file encoding
set fileencodings=ucs-bom,utf8,prc
set textwidth=80          " Set textwidth to 80
set mouse=a               " Enable mouse support
set t_Co=256              " Enable 256 colors
set expandtab             " Use spaces instead of tabs
set shiftwidth=8          " Number of spaces for each step of (auto)indent
set tabstop=8             " Number of spaces per tab
set number                " Show line numbers
set relativenumber        " Show relative line numbers
set incsearch             " Highlights as you search
set undofile              " Enable persistent undo
set showcmd               " Show command in bottom bar
set termguicolors         " True colors term support
setlocal spell
set spelllang=en_gb
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
syntax enable             " Enable syntax highlighting
filetype plugin indent on " Enable filetype detection, plugins, and indentation

" Plugin Management
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'lervag/vimtex'
Plug 'preservim/tagbar'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'KeitaNakamura/tex-conceal.vim'
call plug#end()

" Colorscheme Settings
colorscheme gruvbox 
set background=dark

" Snippets Configuration
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

" VimTeX Configuration
Plug 'lervag/vimtex'
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
hi Conceal ctermbg=none
let g:vimtex_view_automatic = 1
let g:vimtex_view_zathura = 'build/%:p:.pdf'
let g:vimtex_compiler_method = 'latexmk'
let g:vimtex_compiler_latexmk = {
      \ 'build_dir' : '',
      \ 'callback' : 1,
      \ 'continuous' : 1,
      \ 'options' : [
      \   '-pdf',
      \   '-interaction=nonstopmode',
      \   '-synctex=1',
      \   '-output-directory=build',
      \ ],
      \}
autocmd FileType tex nnoremap <buffer> <Leader>p :VimtexView<CR>
autocmd FileType tex nnoremap <buffer> <Leader>l :VimtexCompile<CR>
nnoremap <Leader>c :!rem<CR>
" Vim LaTeX Live Preview Configuration
" autocmd Filetype tex setl updatetime=1
" autocmd Filetype tex nnoremap <buffer> <Leader>p :LLPStartPreview<CR>
" let g:livepreview_previewer = 'zathura'

" NERDTree Settings
let g:NERDTreeWinSize = 30
let g:NERDTreeShowBookmarks = 1
map <C-n> :NERDTreeToggle<CR>
map <C-p> :NERDTreeFind<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" AutoSave Function
function! AutoSaveBuffer()
    if &readonly == 0
        update
    endif
endfunction

" Performance
set lazyredraw            " Redraw only when required
set updatetime=300        " Faster update time

" Filetype-specific Settings
augroup FiletypeSettings
    autocmd!
    autocmd FileType tex setlocal expandtab shiftwidth=4 tabstop=4
    autocmd FileType c,cpp setlocal expandtab shiftwidth=8 tabstop=8
augroup END
