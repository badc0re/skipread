if !has('python3')
  echo "Error: Required vim compiled with +python3"
  finish
endif

function! skip_read()

python << EOF
import vim

def bold_words(line):
    g = [word[:len(word) / 2] for word in line.split(" ")]
    return " ".join(g)

cb = vim.current.buffer
lines = [bold_words(l) for l in list(cb)]

for i in range(len(lines)):
  vim.current.buffer[i] = lines[i]

EOF
endfunction
