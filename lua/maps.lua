local keymap = vim.keymap

vim.g.mapleader = ";"

-- Press x to delete char backwards
keymap.set('n', 'x', '"_x')

-- Delete a word backwards
keymap.set('n', 'dw', 'vb"_d')

-- Esc to exit terminal mode
keymap.set('t', '<Esc>', '<C-\\><C-n>')
