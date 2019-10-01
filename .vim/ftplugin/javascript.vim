let b:ale_linters = ['eslint']
let b:ale_fixers = [
\   'remove_trailing_lines',
\   'trim_whitespace',
\]

nnoremap <buffer> <leader>q :ALEFix<CR>
