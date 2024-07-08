vim.api.nvim_set_option("clipboard", "unnamed")
vim.cmd 'set expandtab'
vim.cmd 'set tabstop=2'
vim.cmd 'set softtabstop=2'
vim.cmd 'set shiftwidth=2'
vim.g.mapleader = " "

vim.keymap.set({'v', 's','n'}, '<c-;>', ':wincmd i<CR>')
vim.keymap.set({'v', 's','n'}, '<c-j>', ':wincmd j<CR>')
vim.keymap.set({'v', 's','n'}, '<c-k>', ':wincmd k<CR>')
vim.keymap.set({'v', 's','n'}, '<c-l>', ':wincmd l<CR>')

vim.keymap.set({'v','s','n'}, 'l', 'k')
vim.keymap.set({'v','s','n'}, 'k', 'j')
vim.keymap.set({'v','s','n'}, 'j', 'h')

vim.keymap.set('n','<c-d>', '<c-d>zz')
vim.keymap.set('n','<c-u>', '<c-u>zz')
vim.keymap.set('n','n', 'nzz')
vim.keymap.set('n','N', 'Nzz')
vim.keymap.set('n', '<leader>p', '\"_dP')

-- Enable line numbers
vim.opt.number = true

-- Enable relative line numbers
vim.opt.relativenumber = true


-- Disable default tmux-navigator mappings
vim.g.tmux_navigator_no_mappings = 1

-- Define custom mappings
vim.api.nvim_set_keymap('n', '<C-j>', ':<C-U>TmuxNavigateLeft<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', ':<C-U>TmuxNavigateDown<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', ':<C-U>TmuxNavigateUp<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-;>', ':<C-U>TmuxNavigateRight<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-p>', ':<C-U>TmuxNavigatePrevious<CR>', { silent = true })

