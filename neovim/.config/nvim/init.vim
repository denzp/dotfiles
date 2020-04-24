set encoding=UTF-8
set number
set updatetime=100

call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'ntpeters/vim-better-whitespace'
Plug 'Yggdroot/indentLine'
Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'
Plug 'liuchengxu/vista.vim'
call plug#end()

let g:onedark_terminal_italics=1
set termguicolors

syntax on
colorscheme onedark

highlight Normal ctermbg=none
highlight Normal guibg=none

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

" Indentation setup
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

let mapleader=' '

command! -nargs=0 Format :call CocAction('format')

nmap <leader>n          :NERDTreeToggle<CR>
nmap <leader>rn         <Plug>(coc-rename)
nmap <leader>g<up>      <Plug>(coc-diagnostic-prev)
nmap <leader>g<down>    <Plug>(coc-diagnostic-next)

nnoremap <C-p>      :Files<CR>
nnoremap <C-g>      :Rg<CR>
nnoremap <Tab>      :bnext!<CR>
nnoremap <S-Tab>    :bprevious!<CR>
