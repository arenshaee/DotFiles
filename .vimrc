
call plug#begin('~/.vim/plugged')
	Plug 'preservim/nerdtree'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'tpope/vim-fugitive'
	Plug 'jiangmiao/auto-pairs'
	Plug 'arcticicestudio/nord-vim'
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'

	" Markdown plugins
	Plug 'preservim/vim-markdown'
	Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

	Plug 'dense-analysis/ale'

	" Languages & Frameworks
	Plug 'rust-lang/rust.vim'

call plug#end()

if has('terminal')
	set t_Co=256
	set termguicolors
endif

set background=dark

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nord configurations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:nord_cursor_line_number_background = 1
let g:nord_uniform_status_lines = 1
augroup nord-theme-overrides
  autocmd!
  " Use 'nord7' as foreground color for Vim comment titles.
  autocmd ColorScheme nord highlight vimCommentTitle ctermfg=14 guifg=#8FBCBB
  autocmd ColorScheme nord highlight ColorColumn ctermfg=None guifg=#FF0000
augroup END
let g:nord_bold = 1
let g:nord_italic = 1

colorscheme nord
if has('gui_running')
	highlight Normal guibg=black
    "set guifont=Fixedsys 
    set guifont=Cousine\ Nerd\ Font:h16
	set noanti
else
	set go+=a
endif

set cursorline

syntax on
set number
set relativenumber
set noshowmode

set noexpandtab
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent
filetype plugin indent on

set showmatch

set incsearch
set hlsearch
set ignorecase
set smartcase
nnoremap <CR> :noh<CR><CR>

set wildmenu
set mouse=a

set encoding=utf-8
set nocompatible

set clipboard+=unnamed
set paste

set nofoldenable
set nowrap

" FUCKING BELL
set noerrorbells
set belloff=all

set backspace=indent,eol,start
" Keymappings
map <C-n> :NERDTreeToggle<CR>
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

" to move up and down one visual line
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
nnoremap <UP> gk
nnoremap <DOWN> gj
"inoremap <UP> gk
"inoremap <DOWN> gj
vnoremap <UP> gk
vnoremap <DOWN> gj

" So the $ command wouldn't take the breakline character too.
nnoremap $ g_
vnoremap $ g_

nmap H ^
nmap L $
vmap H ^
vmap L $

" Easier save and quit
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fast editing and reloading of vimrc configs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>e :e! ~/.vimrc<cr>
autocmd! bufwritepost ~/.vimrc source ~/.vimrc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => FZF configs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Go to definition
nnoremap <leader>gd :FzfPreviewGd<CR>
" Find usages
nnoremap <leader>fu :FzfPrevie<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Markdown configs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType markdown setlocal spell spelllang=en_us
autocmd FileType markdown setlocal shiftwidth=4
autocmd FileType markdown setlocal tabstop=4
autocmd FileType markdown setlocal expandtab
let g:mkdp_refresh_slow = 0  " Preview update time in milliseconds

" Airline Setting vigation
let g:airline_powerline_fonts = 0
let g:airline_section_b = '' " in section B of the status line display the CWD                                                 
let g:airline_detect_paste=0
let g:airline_detect_spell=0
let g:airline_detect_readonly=1
let g:airline_stl_path_style = ''
let g:airline_section_c_only_filename = 1
let g:airline_statusline_ontop = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tabs_label = ''       " can put text here like BUFFERS to denote buffers (I clear it so nothing is shown)
let g:airline#extensions#tabline#buffers_label = ''    " can put text here like TABS to denote tabs (I clear it so nothing is shown)      
let g:airline#extensions#tabline#fnamemod = ':t'       " disable file paths in the tab                                                    
let g:airline#extensions#tabline#show_tab_count = 0    " dont show tab numbers on the right                                                           
let g:airline#extensions#tabline#show_buffers = 0      " dont show buffers in the tabline                                                 
let g:airline#extensions#tabline#tab_min_count = 4     " minimum of 4 tabs needed to display the tabline                                  
let g:airline#extensions#tabline#show_splits = 0       " disables the buffer name that displays on the right of the tabline               
let g:airline#extensions#tabline#show_tab_nr = 0       " disable tab numbers                                                              
let g:airline#extensions#tabline#show_tab_type = 0     " disables the weird ornage arrow on the tabline
 let g:airline#extensions#whitespace#enabled = 0
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_symbols.maxlinenr = ''
let g:airline_section_x = ''
let g:airline_symbols.linenr = ''
"set statusline=%f 

" Autopairs
let g:auto_pairs_map_keys = 1

" Define a function to source .vimrc
function! ReloadVimrc()
    source ~/.vimrc
endfunction

" Automatically delete swap files when closing a buffer
autocmd BufUnload * if filereadable(expand('%')) && !&modifiable | call delete(expand('%:p') . '.sw?') | endif
