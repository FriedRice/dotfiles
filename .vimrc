"" Vundle
" Required for Vundle
set nocompatible
filetype off

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'

" To install plugins, run :PluginInstall
" To update plugins, run PluginInstall! or :PluginUpdate
" 'u' after updates complete to see the change log
" 'l' to see the log of commands if any errors occurred
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'scrooloose/nerdcommenter'
Plugin 'dense-analysis/ale'
Plugin 'vim-python/python-syntax'
Plugin 'chr4/nginx.vim'
Plugin 'tpope/vim-surround'
Plugin 'tmhedberg/matchit'
Plugin 'easymotion/vim-easymotion'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'elzr/vim-json'
Plugin 'leafgarland/typescript-vim'
Plugin 'peitalin/vim-jsx-typescript'

" All Plugins must be added before the following line
call vundle#end()
filetype plugin indent on

"" General settings
set autoread
set nohlsearch
set nomodeline
set ignorecase
set smartcase
set ruler
set showmatch       " highlight matching [{()}]
set number          " show line numbers
set wildmenu        " visual autocomplete for command menu
set splitright      " make vertical splits to the right
set lazyredraw
set backspace=eol,start,indent
set encoding=utf8
set spelllang=en_us
syntax enable

let mapleader = ","

" Tabbing
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set autoindent
set smartindent

" Text width
set textwidth=79
set wrap

" Use jk to switch from insert to normal mode
inoremap jk <esc>
inoremap <esc> <NOP>

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" Map search to space
noremap <space> /
noremap <c-space> ?

" Disable arrow keys in normal mode
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Clipboard mappings
nnoremap <c-c><c-c> "+yy
vnoremap <c-c><c-c> "+yy<cr>
noremap <c-v><c-v> "+p

" Move lines using Alt+[jk]
nnoremap <M-j> mz:m+<cr>`z
nnoremap <M-k> mz:m-2<cr>`z

" Split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Pressing ,ss will toggle spell checking
map <leader>ss :setlocal spell!<cr>

" Highlight tabs and trailing whitespace
set list
set listchars=tab:>.,trail:.

" Move backups to /tmp directory
set backup
set writebackup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*

" Apply syntax highlighting to any Dockerfile.* file
au BufRead,BufNewFile Dockerfile.* set filetype=dockerfile

" Change indention for YAML and JSON files
au BufRead,BufNewFile *.yml,*.yaml,*.json setlocal shiftwidth=2
au BufRead,BufNewFile *.yml,*.yaml,*.json setlocal tabstop=2
au BufRead,BufNewFile *.yml,*.yaml,*.json setlocal softtabstop=2

" Set jsx files to use typescript jsx syntax highlighting plugin
autocmd BufRead,BufNewFile *.tsx,*.jsx setlocal filetype=typescript.tsx

" JSON settings
let g:vim_json_syntax_conceal = 0
let g:vim_json_warnings = 0

" CtrlP settings
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = '\v[\/]\.?(git|cache|mypy_cache|pytest_cache|node_modules)$'
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("t")': ['<c-t>', '<c-cr>'],
    \ 'AcceptSelection("v")': ['<c-v>', '<RightMouse>', '<c-s>'],
    \ 'AcceptSelection("h")': ['<c-x>'],
\ }

" NERDCommenter settings
nnoremap <leader>cd :call NERDComment('n', 'toggle')<cr>
xnoremap <leader>cd :call NERDComment('x', 'toggle')<cr>
vnoremap <leader>cd :call NERDComment('v', 'toggle')<cr>

" Ale settings
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
nmap <silent> <leader>en :ALENext<cr>
nmap <silent> <leader>ep :ALEPrevious<cr>
nmap <silent> <leader>q :ALEFix<CR>

" YouCompleteMe settings
" Add language keywords to autocomplete like 'Class', 'continue', etc.
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_show_diagnostics_ui = 0
map <leader>g :YcmCompleter GoTo<CR>
map <leader>d :YcmCompleter GetDoc<CR>

" EasyMotion settings
let g:EasyMotion_smartcase = 1
nmap s <Plug>(easymotion-overwin-f)
nmap <Leader>w <Plug>(easymotion-w)
nmap <Leader>b <Plug>(easymotion-b)

" Like gJ, but always remove spaces (taken from vi.stackexchange.com)
fun! JoinSpaceless()
    execute 'normal gJ'

    " Character under cursor is whitespace?
    if matchstr(getline('.'), '\%' . col('.') . 'c.') =~ '\s'
        " When remove it!
        execute 'normal dw'
    endif
endfun

nnoremap DJ :call JoinSpaceless()<CR>
