import vim

def bold_words(line):
    words = []
    for word in line.split(" "):
        if len(word) > 0:
            size = int(len(word) / 2)
            words.append(word[:size])
        else:
            words.append(word)
    return " ".join(words)

def skipread():
    cb = vim.current.buffer
    lines = [bold_words(l) for l in list(cb)]

    for i in range(len(lines)):
        vim.current.buffer[i] = lines[i]
