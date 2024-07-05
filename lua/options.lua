vim.cmd 'set expandtab'
vim.cmd 'set tabstop=2'
vim.cmd 'set softtabstop=2'
vim.cmd 'set shiftwidth=2'
vim.g.mapleader = " "

vim.keymap.set('n', '<c-;>', ':wincmd ;<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

vim.keymap.set('n', ';', 'l')
vim.keymap.set('n', 'l', 'k')
vim.keymap.set('n', 'k', 'j')
vim.keymap.set('n', 'j', 'h')

vim.keymap.set('v', ';', 'l')
vim.keymap.set('v', 'l', 'k')
vim.keymap.set('v', 'k', 'j')
vim.keymap.set('v', 'j', 'h')
