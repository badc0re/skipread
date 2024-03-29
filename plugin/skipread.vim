if !has("python3")
  echo "vim has to be compiled with +python3 to run this"
  finish
endif

if exists('g:skipread_plugin_loaded')
  finish
endif

let s:plugin_root_dir = fnamemodify(resolve(expand('<sfile>:p')), ':h')

python3 << EOF
import sys
from os.path import normpath, join
import vim
plugin_root_dir = vim.eval('s:plugin_root_dir')
python_root_dir = normpath(join(plugin_root_dir, '..', 'python'))
sys.path.insert(0, python_root_dir)
import skipread
EOF

let g:skipread_plugin_loaded = 1

function! Skipread()
  python3 skipread.skipread()
endfunction

command! -nargs=0 Skipread call Skipread()
