" Syntax highlighting
let g:python_highlight_space_errors = 0
let g:python_highlight_all = 1

" Ale
let b:ale_linters = ['flake8', 'mypy', 'pydocstyle']
let b:ale_fixers = [
\   'remove_trailing_lines',
\   'trim_whitespace',
\   'isort',
\   'ale#fixers#generic_python#BreakUpLongLines',
\]

let g:ale_python_flake8_executable = 'python3'
let g:ale_python_flake8_options = '-m flake8'
let g:ale_python_mypy_options = '--config-file ~/dev/Myaku/setup.cfg'

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

