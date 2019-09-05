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
Plugin 'w0rp/ale'
Plugin 'vim-python/python-syntax'
Plugin 'chr4/nginx.vim'
Plugin 'tpope/vim-surround'
Plugin 'tmhedberg/matchit'
Plugin 'easymotion/vim-easymotion'

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

" Move backups to /tmp directory
set backup
set writebackup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*

" Apply syntax highlighting to any Dockerfile.* file
au BufRead,BufNewFile Dockerfile.* set filetype=dockerfile

" Change indention for YAML files
au BufRead,BufNewFile *.yml setlocal shiftwidth=2
au BufRead,BufNewFile *.yml setlocal tabstop=2
au BufRead,BufNewFile *.yml setlocal softtabstop=2
au BufRead,BufNewFile *.yaml setlocal shiftwidth=2
au BufRead,BufNewFile *.yaml setlocal tabstop=2
au BufRead,BufNewFile *.yaml setlocal softtabstop=2

" Python settings
let g:python_highlight_space_errors = 0
let g:python_highlight_all = 1

" CtrlP settings
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
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
let g:ale_python_flake8_executable = 'python3'
let g:ale_python_flake8_options = '-m flake8'
let g:ale_python_mypy_options = '--config-file ~/dev/Myaku/mypy.ini'
nmap <silent> <leader>en :ALENext<cr>
nmap <silent> <leader>ep :ALEPrevious<cr>

" YouCompleteMe settings
" Add language keywords to autocomplete like 'Class', 'continue', etc.
let g:ycm_seed_identifiers_with_syntax = 1  
" let g:ycm_autoclose_preview_window_after_completion = 1
map <leader>g :YcmCompleter GoTo<CR>
map <leader>d :YcmCompleter GetDoc<CR>

" EasyMotion settings
let g:EasyMotion_smartcase = 1
nmap s <Plug>(easymotion-overwin-f)
nmap <Leader>w <Plug>(easymotion-w)
nmap <Leader>b <Plug>(easymotion-b)

" Add python virtualenv paths to place where ycm can see them
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this_path = os.path.join(project_base_dir, 'bin/activate_this.py')
  with open(activate_this_path) as activate_this_file:
      exec(activate_this_file.read(), {'__file__': activate_this_path})
EOF

" Like gJ, but always remove spaces (taken from vi.stackexchange.com)
fun! JoinSpaceless()
    execute 'normal gJ'

    " Character under cursor is whitespace?
    if matchstr(getline('.'), '\%' . col('.') . 'c.') =~ '\s'
        " When remove it!
        execute 'normal dw'
    endif
endfun

nnoremap gJ J
nnoremap J :call JoinSpaceless()<CR>
