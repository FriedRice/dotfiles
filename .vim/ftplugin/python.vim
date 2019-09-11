let b:ale_linters = ['flake8', 'mypy', 'pydocstyle']
let b:ale_fixers = [
\   'remove_trailing_lines',
\   'trim_whitespace',
\   'isort',
\   'ale#fixers#generic_python#BreakUpLongLines',
\   'autopep8',
\]

nnoremap <buffer> <leader>q :ALEFix<CR>

"let g:ale_fix_on_save = 1
