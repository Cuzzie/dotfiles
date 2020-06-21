" Plugins
call plug#begin('~/.config/nvim/autoload/plugged')
Plug 'norcalli/nvim-colorizer.lua'
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'sainnhe/edge'
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'rbgrouleff/bclose.vim'
Plug 'francoiscabrol/ranger.vim'
Plug 'tpope/vim-commentary'
Plug 'suy/vim-context-commentstring'
Plug 'junegunn/vim-peekaboo'
Plug 'SirVer/ultisnips'
Plug 'mattn/emmet-vim'
Plug 'sheerun/vim-polyglot'
Plug 'joshdick/onedark.vim'
Plug 'itchyny/lightline.vim'
call plug#end()

set termguicolors
set background=dark
let g:edge_style = 'neon'
colorscheme onedark

let g:airline_theme='onedark'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter='unique_tail'
let g:onedark_terminal_italics=1
set encoding=utf-8
set t_Co=256

let mapleader=","

" Custom keybindings
" Escape binding
inoremap jk <Esc>
inoremap kj <Esc>

" Newline below or above without having to escape ourselves
nnoremap gO O<Esc>j
nnoremap go o<Esc>k

" Move line up to down
inoremap <A-j> <Esc>:m+<CR>==gi
inoremap <A-k> <Esc>:m-2<CR>==gi
nnoremap <A-j> :m+<CR>==
nnoremap <A-k> :m-2<CR>==
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Keybindings to open and source .vimrc
noremap <F2> :tabe $MYVIMRC<CR>
noremap <F3> :so $MYVIMRC<CR>

" To open fuzzy finder
noremap <C-f> :FZF<CR>

" To save file
nnoremap gh :w<CR>

" To iterate through buffers
nnoremap <A-TAB> :bn<CR>

" To format whole document
" nnoremap <Leader>= mmgg=G`m_

" To replace text
nnoremap <Leader>s :s///g<Left><Left><Left>
nnoremap <Leader>S :%s///g<Left><Left><Left>

" Plug shortcut keys
nnoremap <Leader>pi :PlugInstall<CR>
nnoremap <Leader>pu :PlugUpdate<CR>
nnoremap <Leader>pc :PlugClean<CR>

" Delete camel case text
nnoremap <Leader>dw d/\u<CR>
nnoremap <Leader>cw c/\u<CR>

" Move window
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-q> <C-w>q

" coc.nvim
nmap <silent> <Leader>gd <Plug>(coc-definition)
nmap <silent> <Leader>gr <Plug>(coc-references)
nmap <silent> <Leader>rn <Plug>(coc-rename)
nmap <silent> <Leader>gi <Plug>(coc-implementation)
nmap <silent> <Leader>= <Plug>(coc-format-selected)

set nu
set rnu
set tabstop=2
set shiftwidth=2
set expandtab
set incsearch
set nohlsearch
set updatetime=300
set laststatus=2
set smartindent
set showtabline=2
set autoindent
set splitbelow
set splitright
set timeoutlen=300
set cursorline
set wrap
set linebreak
set nolist
set nojoinspaces
set autochdir
set inccommand=nosplit

filetype on
filetype plugin on
filetype plugin indent on

" Associate extensions to filetypes so that go to file will work
augroup suffixes
  autocmd!

  let associations = [
        \["javascript", ".js,.mjs,.jsx,.json"],
        \]

  for ft in associations
    execute "autocmd FileType " . ft[0] . " setlocal suffixesadd=" . ft[1]
  endfor
augroup END

let g:UltiSnipsExpandTrigger="<tab>"

" Custom todo filetype handling
au BufRead,BufNewFile *.todo set ft=todo
highlight TodoTitle guifg=yellow
highlight TodoHeader guifg=SteelBlue1
highlight TodoSubHeader guifg=LightSalmon3
highlight TodoItemNew guifg=LightSteelBlue
highlight TodoItemDone guifg=LightGreen

function! ToggleTodo()
  let l:line = getline('.')
  let l:char = matchstr(l:line, '\[.\?\]')

  if l:char == '[]'
    let l:char = '[x]'
  else
    let l:char = '[]'
  endif

  call setline(line('.'), substitute(l:line, '\[.\?\]', l:char, ''))
endfunction

autocmd FileType todo nnoremap <buffer> <Leader><Space> :call ToggleTodo()<CR>
