set encoding=UTF-8
set number
set updatetime=100

" fallback for vim to use be compatible with neovim config
set runtimepath+=~/.config/nvim

" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'ntpeters/vim-better-whitespace'
Plug 'Yggdroot/indentLine'
Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/nerdcommenter'
call plug#end()

let g:onedark_terminal_italics=1
set termguicolors

if !empty(glob('~/.config/nvim/plugged/onedark.vim'))
    syntax on
    colorscheme onedark
endif

highlight Normal ctermbg=NONE
highlight Normal guibg=NONE

" airline config
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='unique_tail_improved'
let g:airline_powerline_fonts=1
let g:airline_theme='onedark'

" better-whitespace config
let g:better_whitespace_enabled=1
let g:show_spaces_that_precede_tabs=1
let g:show_spaces_that_precede_tabs=1
let g:strip_max_file_size=1000
let g:strip_only_modified_lines=1
let g:strip_whitelines_at_eof=1
let g:strip_whitespace_on_save=1

" indentLine config
let g:indentLine_char='⎸'
let g:indentLine_leadingSpaceEnabled=1
let g:indentLine_leadingSpaceChar='·'

" NERDTree config
let g:NERDTreeAutoDeleteBuffer=1
let g:NERDTreeChDirMode=2
let g:NERDTreeMinimalUI=1

" NERDCommenter config
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'

" Indentation setup
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

autocmd Filetype hcl setlocal ts=2 sw=2
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

let mapleader=' '

let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0

nmap <leader>f          :call CocAction('format')<CR>
nmap <leader>gs         :GitGutterStageHunk<CR>
nmap <leader>gr         :GitGutterUndoHunk<CR>

nmap <leader>a          <Plug>(coc-fix-current)
nmap <leader>rn         <Plug>(coc-rename)
nmap <leader>g<up>      <Plug>(coc-diagnostic-prev)
nmap <leader>g<down>    <Plug>(coc-diagnostic-next)

nnoremap d "_d
nnoremap D "_D
vnoremap d "_d

nnoremap c "_c
nnoremap C "_C
vnoremap c "_c

nnoremap <leader>d ""d
nnoremap <leader>D ""D
vnoremap <leader>d ""d

nnoremap <leader>c ""c
nnoremap <leader>C ""C
vnoremap <leader>c ""c

vnoremap <leader>y "+y
vnoremap <leader>p "+p
vnoremap <leader>P "+P
nnoremap <leader>y "+y
nnoremap <leader>p "+p
nnoremap <leader>P "+P

nnoremap <C-p>      :Files<CR>
nnoremap <C-g>      :Rg<CR>
nnoremap <Tab>      :bnext!<CR>
nnoremap <S-Tab>    :bprevious!<CR>

noremap <F5> :IndentLinesToggle<CR>

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "<CR>"
inoremap <silent><expr> <c-space> coc#refresh()
