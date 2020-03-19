if !has("python3")
    echo "vim has to be compiled with +python3 to run this"
    finish
endif

if exists('g:palt_loaded')
    finish
endif

let s:plugin_root_dir = fnamemodify(resolve(expand('<sfile>:p')), ':h')

python3 << EOF
import vim
sys.path.insert(0, vim.eval('s:plugin_root_dir'))
import palt
EOF

function! PalternateFile(path, vim_cmd)
python3 << EOF
paltfile = palt.alternate_file(vim.eval("a:path"))
EOF

  let palt = py3eval("paltfile")
  exec a:vim_cmd . " " . palt
endfunction

function! PalternateCurrentFile(vim_cmd)
  call PalternateFile(expand("%"), a:vim_cmd)
endfunction

command! -nargs=0 PaltFile call PalternateCurrentFile(":vs")

let g:palt_loaded = 1
